import '../../widgets/imports.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());

    return ResponsiveScaffold(
      title: "",
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawerContent: ListView(
        children: const [DrawerHeader(child: Text("Menu"))],
      ),
      sideMenuItems: [
        SideMenuItem(
          icon: Icons.dashboard,
          label: "Dashboard",
          onTap: () => navController.changeRoute(AppRoutes.home),
        ),
        SideMenuItem(
          icon: Icons.settings,
          label: "Settings",
          onTap: () => navController.changeRoute(AppRoutes.settings),
        ),
      ],
      body: Obx(() => navController.currentPage),
    );
  }
}
