import 'package:get/get.dart';

class AboutController extends GetxController {
  final bgOpacity = 0.0.obs;
  final contentOpacity = 0.0.obs;

  @override
  void onInit() {
    showBg();
    showContent();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  showBg() async {
    Future.delayed(Duration(milliseconds: 500), () => bgOpacity.value = 1);
  }

  showContent() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      contentOpacity.value = 1;
    });
  }
}
