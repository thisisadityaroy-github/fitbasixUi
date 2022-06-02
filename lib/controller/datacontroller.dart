import 'package:get/get.dart';

class DataController extends GetxController {
  var waterCons = 0.0.obs;
  var Username = "NothingFound".obs;
  waterConsIncrement(value) {
    waterCons + value;
  }

  updateUn(value) async {
    Username = value;
  }
}
