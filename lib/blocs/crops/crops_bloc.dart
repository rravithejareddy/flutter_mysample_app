import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_sample_app/blocs/crops/crops_repository.dart';
import './crops.dart';

class CropsBloc extends Bloc<CropsEvent, CropsState>{
  final CropsRepository cropsRepository;

   CropsBloc(this.cropsRepository) : super(GetCropsByAreaIntial());

  @override
  Stream<CropsState> mapEventToState(
      CropsEvent event,
      ) async* {
    yield GetCropsLoading();
    if (event is CropsLoaded) {
      try {
        final crops = await this.cropsRepository.cropsByArea();
        yield CropsLoadSuccess(crops);
      } on Error catch(ex){
        print(ex);
        yield GetCropsFailed("Couldn't fetch weather. Is the device online?");
      }
    }
    else{
      yield GetCropsLoading();
    }
  }

}
