import 'package:isowhiz_website/screens/entry/entry_binding.dart';
import 'package:isowhiz_website/screens/entry/entry_screen.dart';
import 'package:isowhiz_website/screens/home/home_binding.dart';
import 'package:isowhiz_website/screens/home/home_screen.dart';

import '../widgets/imports.dart';

class AppPages {
  static GetPage getPageWithTransition({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
    List<Bindings>? bindings,
    List<GetMiddleware>? middlewares,
    transition = Transition.fadeIn,
    duration = 300,
  }) => GetPage(
    name: name,
    page: page,
    binding: binding,
    bindings: bindings ?? [],
    transition: transition,
    middlewares: middlewares ?? [],
    transitionDuration: Duration(milliseconds: duration),
  );

  static final List<GetPage> pages = [
    getPageWithTransition(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),

    getPageWithTransition(
      name: AppRoutes.defaultScreen,
      page: () => const EntryScreen(),
      binding: EntryBinding(),
    ),
    // Add more here...
  ];

  static GetPage? findPage(String route) {
    return pages.firstWhereOrNull((p) => p.name == route);
  }
}

class NavigationController extends GetxController {
  final Rx<Widget> _currentPage = const EntryScreen().obs;

  Widget get currentPage => _currentPage.value;

  void changeRoute(String route) {
    switch (route) {
      case AppRoutes.home:
        _currentPage.value = const HomeScreen();
        break;
      case AppRoutes.settings:
        _currentPage.value = const SplashScreen();
        break;
      default:
        _currentPage.value = const EntryScreen();
    }
  }
}
