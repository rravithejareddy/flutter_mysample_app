import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_sample_app/blocs/crops/crops.dart';
import 'package:flutter_sample_app/blocs/filtered_crops/filtered_crops.dart';
import 'package:flutter_sample_app/models/crop.dart';
import 'package:flutter_sample_app/models/filter.dart';

class FilteredCropsBloc extends Bloc<FilteredCropsEvent, FilteredCropsState> {
  final CropsBloc cropsBloc;
  StreamSubscription cropsSubscription;


  FilteredCropsBloc({@required this.cropsBloc})
      : super(
    cropsBloc.state is CropsLoadSuccess
        ? FilteredCropsLoadSuccess(
      (cropsBloc.state as CropsLoadSuccess).crops,
      Filter.initial(),
    )
        : FilteredCropsLoadInProgress(),
  ) {
    cropsSubscription = cropsBloc.listen((state) {
      if (state is CropsLoadSuccess) {
        add(CropsUpdated((cropsBloc.state as CropsLoadSuccess).crops));
      }
    });
  }

  @override
  Stream<FilteredCropsState> mapEventToState(FilteredCropsEvent event) async* {
    try{
    if (event is FilterUpdated) {
      yield* _mapFilterUpdatedToState(event);
    } else if (event is CropsUpdated) {
      yield* _mapCropsUpdatedToState(event);
    }}
    on Error catch(ex){
      print(ex);
      yield FilteredCropsFailed("Couldn't fetch weather. Is the device online?");
    }
  }

  Stream<FilteredCropsState> _mapFilterUpdatedToState(
      FilterUpdated event,
      ) async* {
    if (cropsBloc.state is CropsLoadSuccess) {
      yield FilteredCropsLoadSuccess(
        _mapCropsToFilteredCrops(
          (cropsBloc.state as CropsLoadSuccess).crops,
          event.filter,
        ),
        event.filter,
      );
    }
  }

  Stream<FilteredCropsState> _mapCropsUpdatedToState(
      CropsUpdated event,
      ) async* {
    final filter = state is FilteredCropsLoadSuccess
        ? (state as FilteredCropsLoadSuccess).filter
        : Filter.initial();
    yield

    FilteredCropsLoadSuccess(
      _mapCropsToFilteredCrops(
        (cropsBloc.state as CropsLoadSuccess).crops,
        filter,
      ),
      filter,
    );
  }

  List<Crop> _mapCropsToFilteredCrops(
      List<Crop> crops, Filter filter) {

    return crops.where((crop) {
      if (crop.grade > filter.grade.length && crop.quantity > filter.quantity.length
       && filter.cropType.contains(crop.cropType))//&& filter.cropName.contains(crop.cropName)  ){
      {  return true;
      }
      else{
       return false;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    cropsSubscription.cancel();
    return super.close();
  }
}
