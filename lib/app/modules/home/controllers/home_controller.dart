import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  Timer? timer;
  List<String> photos = [
    'assets/images/home_carousel/1.jpg',
    'assets/images/home_carousel/2.jpg',
    'assets/images/home_carousel/3.jpg',
    'assets/images/home_carousel/4.jpg',
    'assets/images/home_carousel/5.jpg',
    'assets/images/home_carousel/6.jpg',
    'assets/images/home_carousel/7.jpg',
    'assets/images/home_carousel/8.jpg',
  ];

  final prompt = ''.obs;
  List<String> prompts = [
    'hello world, i am fachri',
    'welcome to my site',
    'this website is built entirely with flutter',
    'enjoy these film photos that i took',
    'know me more by visiting other pages of this site',
  ];

  @override
  void onInit() {
    photos.shuffle();
    prompt.value = prompts[0];
    timer = Timer.periodic(Duration(milliseconds: 4500), (t) {
      count.value = (count.value + 1) % prompts.length;
      prompt.value = prompts[count.value];
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timer!.cancel();
    timer = null;
    super.onClose();
  }
}
