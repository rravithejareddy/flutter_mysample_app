import 'dart:async';
import 'package:flutter_sample_app/models/crop.dart';

import 'crops_data.dart';

abstract class AbstractCropRepo {
  Future<List<Crop>> cropsByArea();
}

class CropsRepository {
  Future<List<Crop>> cropsByArea() async {
    List<Crop> crops;
    crops = cropsData.map((e) => Crop.fromMap(e)).toList();
    return crops;
  }
}
