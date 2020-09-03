import 'package:equatable/equatable.dart';
import 'package:flutter_sample_app/models/crop.dart';

abstract class CropsState extends Equatable {
  const CropsState();
}

class GetCropsByAreaIntial extends CropsState {
  const GetCropsByAreaIntial();

  @override
  List<Object> get props => [];
}

class GetCropsLoading extends CropsState {
  @override
  List<Object> get props => [];
}

class CropsLoadSuccess extends CropsState {
  final  List<Crop> crops;

  const CropsLoadSuccess(this.crops);

  @override
  List<Object> get props => [crops];
}

class GetCropsFailed extends CropsState {
  final String message;

  const GetCropsFailed(this.message);

  @override
  List<Object> get props => [message];
}
