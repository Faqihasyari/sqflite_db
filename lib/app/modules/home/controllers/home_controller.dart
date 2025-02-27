import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  RxInt data = 0.obs;

  void decrement() {
    data--;
    simpan();
  }

  void increment() {
    data++;
    simpan();
  }

  void simpan() async {
    print('SIMPAN DATA');
    if (box.read('angkaTerakhir') != null) {
      await box.remove('angkaTerakhir');
    }

    await box.write('angkaTerakhir', data.value);
  }

  void bacaData() async {
    if (box.hasData('angkaTerakhir')) {
      data.value = box.read('angkaTerakhir')! as int;
    }
  }

  void resetData() async {
    if (box.read('angkaTerakhir') != null) {
      await box.remove('angkaTerakhir');
      data.value = 0;
    }
  }

  @override
  void onInit() {
    bacaData();
    super.onInit();
  }
}
