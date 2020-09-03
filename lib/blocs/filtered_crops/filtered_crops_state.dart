import 'package:equatable/equatable.dart';
import 'package:flutter_sample_app/models/filter.dart';
import 'package:flutter_sample_app/models/crop.dart';

abstract class FilteredCropsState extends Equatable {
  const FilteredCropsState();

  @override
  List<Object> get props => [];
}

class FilteredCropsLoadInProgress extends FilteredCropsState {}

class FilteredCropsLoadSuccess extends FilteredCropsState {
  final List<Crop> filteredCrops;
  final Filter filter;

  const FilteredCropsLoadSuccess(
      this.filteredCrops,
      this.filter,
      );

  @override
  List<Object> get props => [filteredCrops, filter];

  @override
  String toString() {
    return 'FilteredTodosLoadSuccess { filteredTodos: $filteredCrops, activeFilter: $filter }';
  }


}

class FilteredCropsFailed extends FilteredCropsState {
  final String message;

  const FilteredCropsFailed(this.message);

  @override
  List<Object> get props => [message];
}
