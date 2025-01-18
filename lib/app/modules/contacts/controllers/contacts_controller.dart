import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsController extends GetxController {
  final bgOpacity = 0.0.obs;
  final contentOpacity = 0.0.obs;

  late Uri emailLaunchUri;

  @override
  void onInit() {
    initMailTo();
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
    Future.delayed(Duration(milliseconds: 1250), () {
      contentOpacity.value = 1;
    });
  }

  initMailTo() {
    emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  openUrl(Uri url) async {
    await launchUrl(
      url,
      webOnlyWindowName: "_blank",
    );
  }

  copyToClipboard(String value, String label) async {
    await Clipboard.setData(ClipboardData(text: value)).then((_) {
      Get.snackbar('done', '$label has been copied to your clipboard',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white);
    });
  }
}
