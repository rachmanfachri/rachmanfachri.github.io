import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/widget.dart';
import '../controllers/skills_controller.dart';

class SkillsView extends GetView<SkillsController> {
  SkillsView({super.key});
  final c = Get.put(SkillsController());
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
                'assets/images/skills-bg.jpg',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "my main expertise",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    mainExpertiseBox(),
                    SizedBox(height: 30),
                    Text(
                      "supplemental skills (learning on progress)",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.25),
                      ),
                      child: dottedList([
                        'figma',
                        'kotlin',
                        'javascript',
                        'react native',
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
          siteAppBar('skills'),
        ],
      ),
    );
  }

  Widget mainExpertiseBox() {
    final turns = 0.0.obs;
    final isHover = false.obs;

    return Obx(
      () => TextButton(
        onPressed: () {},
        onHover: (value) {
          if (value) {
            turns.value += 1;
            isHover.value = !isHover.value;
          } else {
            turns.value -= 1;
            isHover.value = !isHover.value;
          }
        },
        style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: Colors.transparent,
            padding: EdgeInsets.all(0)),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedRotation(
                turns: turns.value,
                duration: Duration(milliseconds: 500),
                child: AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: FlutterLogo(size: isHover.value ? 250 : 200),
                ),
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "flutter (and also dart)",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  AnimatedSize(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth:
                              (1920 * ((isHover.value ? 2 : 3) / 5) / 2) - 40),
                      child: Text(
                        "considered my main \"arsenal\" since my graduation in"
                        " 2020, my introduction with flutter was begin with"
                        " working on various proof-of-concept projects to hone my"
                        " understanding of this particular tech stack.\n\nstarted my"
                        " first job as flutter-based mobile app developer,"
                        " i grow my experience on the same path until now."
                        " the apps that i working on mainly developed with GetX"
                        " as its state manager. aside from"
                        " mobile app, i also expand my flutter development"
                        " skill to progressive web app (PWA).",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
