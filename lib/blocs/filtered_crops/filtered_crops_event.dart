import 'package:equatable/equatable.dart';
import 'package:flutter_sample_app/models/crop.dart';
import 'package:flutter_sample_app/models/filter.dart';

abstract class FilteredCropsEvent extends Equatable {
  const FilteredCropsEvent();
}

class FilterUpdated extends FilteredCropsEvent {
  final Filter filter;

  const FilterUpdated(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'FilterUpdated { filter: $filter }';
}

class CropsUpdated extends FilteredCropsEvent {
  final List<Crop> crops;

  const CropsUpdated(this.crops);

  @override
  List<Object> get props => [crops];

  @override
  String toString() => 'CropsUpdated { crops: $crops }';
}