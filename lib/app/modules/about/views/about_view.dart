import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../global/widget.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  final c = Get.put(AboutController());
  AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: aboutBody());
  }

  Widget aboutBody() {
    return Obx(
      () => Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: AnimatedOpacity(
              opacity: c.bgOpacity.value,
              duration: Duration(milliseconds: 500),
              child: Image.asset(
                'assets/images/myself.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.65),
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: c.contentOpacity.value,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(30),
                constraints: BoxConstraints(maxWidth: 1920 / 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 75,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: Image.asset('assets/images/portrait.png')),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "hi, i'm fachri rachmanda!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "based in south jakarta. i am undergraduate degree from"
                      " universitas brawijaya majoring in informatics"
                      " engineering, i specified in mobile app engineering.\n\n"
                      "i've been working with flutter since 2020 and"
                      " going strong. experienced working"
                      " in various business types of it industries e.g. insurance,"
                      " superapp, job portal, etc.\n\n"
                      "i keen to visual geometry, colour tones, and usability of user interface. mainly working on mobile app's development for user interface and functionality.",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          siteAppBar('about'),
        ],
      ),
    );
  }
}
