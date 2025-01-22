import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget siteAppBar(String routeName) {
  final isHover = false.obs;
  return Container(
    width: double.infinity,
    height: kToolbarHeight,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        Obx(
          () => TextButton(
            onPressed: () => Get.offNamed('/hello'),
            onHover: (hover) => isHover.value = hover,
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlue[isHover.value ? 300 : 100],
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size(kToolbarHeight * 3 / 4, kToolbarHeight * 3 / 4),
              padding: EdgeInsets.all(0),
            ),
            child: Image.asset(
              'assets/images/pacrii.png',
              height: kToolbarHeight * 3 / 4,
            ),
          ),
        ),
        const Spacer(),
        appBarActionButton('hello', 'hello', routeName),
        appBarActionButton('about', 'about', routeName),
        appBarActionButton('projects', 'projects', routeName),
        appBarActionButton('skills', 'skills', routeName),
        appBarActionButton('contacts', 'contacts', routeName),
      ],
    ),
  );
}

Widget appBarActionButton(String label, String endpoint, String currentRoute) {
  final isHover = false.obs;

  return Obx(
    () => TextButton(
      onPressed: endpoint == currentRoute
          ? null
          : () =>
              Get.offNamedUntil('/$endpoint', ModalRoute.withName('/hello')),
      child: isHover.value || endpoint == currentRoute
          ? RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '[',
                      style: GoogleFonts.poppins(
                          fontWeight:
                              endpoint == currentRoute ? FontWeight.bold : null,
                          color: endpoint == currentRoute
                              ? Colors.amber[700]
                              : Colors.lightBlueAccent[100])),
                  TextSpan(
                      text: label,
                      style: GoogleFonts.poppins(color: Colors.white)),
                  TextSpan(
                    text: ']',
                    style: GoogleFonts.poppins(
                        fontWeight:
                            endpoint == currentRoute ? FontWeight.bold : null,
                        color: endpoint == currentRoute
                            ? Colors.amber[700]
                            : Colors.lightBlueAccent[100]),
                  ),
                ],
              ),
            )
          : Text(
              label,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
      onHover: (hover) => isHover.value = hover,
    ),
  );
}

Widget dottedList(List<String> items) {
  return Wrap(
    spacing: 30,
    children: [
      for (int i = 0; i < items.length; i++)
        Text(
          "• ${items[i]}",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
        ),
    ],
  );
}
