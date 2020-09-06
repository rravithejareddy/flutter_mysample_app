import 'package:equatable/equatable.dart';

class Crop extends Equatable {
  final String adminBlock;
  final String adminDivision;
  final String area;
  final String cropName;
  final String cropType;
  final String farmerId;
  final int grade;
  final int quantity;
  final int zipcode;

  Crop(this.adminBlock, this.adminDivision, this.area, this.cropName,
      this.cropType, this.farmerId, this.grade, this.quantity, this.zipcode);

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

  Crop.fromMap(Map<String, Object> json) :
        adminBlock = json['adminlevel1'],
        adminDivision=json['adminlevel2'],
        area=json['villageName'],
        cropName=json['cropName'],
        cropType=json['cropType'],
        farmerId=json['farmerId'],
        grade=json['grade'],
        quantity=json['quantity'],
        zipcode=json['zipcode'];

  Map<String, Object> toDocument() {
    return {
      'adminBlock': adminBlock,
      'adminDivision': adminDivision,
      'area': area,
      'cropName': cropName,
      'cropType': cropType,
      'farmerId': farmerId,
      'grade': grade,
      'quantity': quantity,
      'zipcode': zipcode,
    };
  }

  @override
  List<Object> get props => [
        area,
        adminDivision,
        adminBlock,
        cropName,
        cropType,
        farmerId,
        grade,
        quantity,
        zipcode
      ];
}
