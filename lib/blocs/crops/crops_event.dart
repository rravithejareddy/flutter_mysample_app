import 'package:equatable/equatable.dart';

abstract class CropsEvent extends Equatable{
  const CropsEvent();
}
class CropsLoaded extends CropsEvent {
  CropsLoaded();
  @override
  List<Object> get props => [];
}
class GetCropsByArea extends CropsEvent{
  final String area;

  const GetCropsByArea(this.area);

  @override
  List<Object> get props => [area];
}