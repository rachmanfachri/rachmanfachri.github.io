import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global/widget.dart';
import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  final c = Get.put(ContactsController());

  ContactsView({super.key});
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
                'assets/images/contacts-bg.jpg',
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
                      "don't be shy, say hello!",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "you can contact me through email below:",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Material(
                      color: Colors.transparent,
                      child: Tooltip(
                        message: "click to copy",
                        child: InkWell(
                          onTap: () => c.copyToClipboard(
                              "rachmanfachri@rocketmail.com", "email"),
                          hoverColor: Colors.white70,
                          child: Text(
                            "rachmanfachri@rocketmail.com",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "i'd prefer communication through email, but if you"
                      " prefer to contact me through text message or phone"
                      " you're welcome to ask my phone number.",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "social media",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 26),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.lightBlue[100],
                          child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/87/87390.png",
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "@rachmanfachri",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/174/174857.png",
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Fachri Rachmanda",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          siteAppBar('contacts'),
        ],
      ),
    );
  }
}
