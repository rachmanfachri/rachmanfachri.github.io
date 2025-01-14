import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/contacts/bindings/contacts_binding.dart';
import '../modules/contacts/views/contacts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/projects/bindings/projects_binding.dart';
import '../modules/projects/views/projects_view.dart';
import '../modules/skills/bindings/skills_binding.dart';
import '../modules/skills/views/skills_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.ABOUT,
        page: () => AboutView(),
        binding: AboutBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.PROJECTS,
        page: () => ProjectsView(),
        binding: ProjectsBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.SKILLS,
        page: () => SkillsView(),
        binding: SkillsBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.CONTACTS,
        page: () => ContactsView(),
        binding: ContactsBinding(),
        transition: Transition.fadeIn),
  ];
}
