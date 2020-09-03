import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Village extends Equatable {
  final String villageName;
  final Object cropsData;


  Village(this.villageName, this.cropsData);

  /* static Crop fromSnapshot(DocumentSnapshot snap) {
    return Crop(
        snap.data['adminBlock'],
        snap.data['adminDivision'],
        snap.data['area'],
        snap.data['cropName'],
        snap.data['cropType'],
        snap.data['farmerId'],
        snap.data['grade'],
        snap.data['quantity'],
        snap.data['zipcode']);
  }*/

  Village.fromMap(Map<String, Object> json) :
        villageName = json['villageName'],
        cropsData=json['cropsData']
;

  Map<String, Object> toDocument() {
    return {
      'villageName': villageName,
      'cropsData': cropsData,

    };
  }

  @override
  List<Object> get props => [
    villageName,
    cropsData,

  ];
}
