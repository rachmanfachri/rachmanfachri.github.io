import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/global/widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final c = Get.put(HomeController());
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: homeBody(),
    );
  }

  Widget homeBody() {
    return Obx(
      () => Stack(
        children: [
          ImageSlideshow(
            width: double.infinity,
            height: double.infinity,
            autoPlayInterval: 5000,
            indicatorRadius: 0,
            isLoop: true,
            disableUserScrolling: true,
            children: [
              for (int i = 0; i < c.photos.length; i++)
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    c.photos[i],
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.65),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Text(
                  c.prompt.value,
                  key: ValueKey<String>(c.prompt.value),
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          siteAppBar('/'),
        ],
      ),
    );
  }
}
