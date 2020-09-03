import 'dart:math';
import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample_app/blocs/firestore_api.dart';
import 'package:flutter_sample_app/models/crop.dart';

import 'crops_data.dart';



abstract class AbstractCropRepo {
  Future<List<Crop>> cropsByArea();
}

class CropsRepository {
  Future<List<Crop>> cropsByArea() async {
    List<Crop> crops;
    crops =  cropsData.map((e) => Crop.fromMap(e)).toList();
    return crops;
  }
}
