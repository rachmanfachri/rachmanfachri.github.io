import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/widget.dart';
import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  final c = Get.put(ProjectsController());

  ProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
            // thumbVisibility: true,
            trackVisibility: true,
            interactive: false,
            child: projectsBody()));
  }

  Widget projectsBody() {
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
                'assets/images/projects-bg.jpg',
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
              child: Padding(
                padding: EdgeInsets.only(top: kToolbarHeight),
                child: SingleChildScrollView(
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
                        Text(
                          "here are my projects that i can publicly share",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 30),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "hover the card to read more",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 30),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            projectCard(
                              title: "ACA Pocket\n(digital marketing app)",
                              imageSrc: 'assets/images/aca.jpg',
                              description:
                                  "my very first professional project as a fresh"
                                  " graduate. this app can only be used internally"
                                  " by ACA employee. the app covers essential workflow of"
                                  " insurance marketing officer such as reporting, handling"
                                  " insurance cover letter, asset and applicant"
                                  " survey etc. available ony in play store.",
                              maxLines: 6,
                            ),
                            projectCard(
                              title: "unreleased, in-progress job portal app",
                              imageSrc: 'assets/images/rkt.png',
                              description:
                                  "due to non-disclosure agreement, i can't giving much"
                                  " about this app aside from what it is and its basic"
                                  " functionality. it's a job portal app which is part"
                                  " of a bigger ecosystem of a jobseeking service. the"
                                  " app itself let the user to register, fill up their"
                                  " information for jobseeking purposes, and search and"
                                  " apply for the job that available.",
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          siteAppBar('projects'),
        ],
      ),
    );
  }

  Widget projectCard({
    required String title,
    required String imageSrc,
    required String description,
    required int maxLines,
  }) {
    final onHover = false.obs;

    return Obx(
      () => Card(
        // margin: const EdgeInsets.all(20),
        borderOnForeground: true,
        color: Colors.transparent,
        child: TextButton(
          onPressed: () {},
          onHover: (value) => onHover.value = value,
          style: TextButton.styleFrom(overlayColor: Colors.transparent),
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: BoxConstraints(
                maxWidth: 360,
                maxHeight: onHover.value ? double.infinity : 540),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 20),
                Image.asset(imageSrc, width: 300),
                SizedBox(height: 20),
                Text(
                  description,
                  maxLines: onHover.value ? null : maxLines,
                  overflow: onHover.value ? null : TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
