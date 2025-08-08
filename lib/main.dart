import 'package:isowhiz_website/widgets/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IsoWhiz Website',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Light mode
      darkTheme: AppTheme.darkTheme, // Dark mode
      themeMode: ThemeMode.system, // Auto switch based on system setting
      home: const SplashScreen(), // Start here
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: "", // leave empty, we will use CustomAppBar instead
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawerContent: ListView(
        children: const [
          DrawerHeader(child: Text("Menu")),
          ListTile(title: Text("Home")),
          ListTile(title: Text("Settings")),
        ],
      ),
      sideMenuItems: [
        SideMenuItem(icon: Icons.dashboard, label: "Dashboard", onTap: () {}),
        SideMenuItem(icon: Icons.settings, label: "Settings", onTap: () {}),
        SideMenuItem(icon: Icons.report, label: "Reports", onTap: () {}),
      ],
      body: const Center(child: Text("Welcome to the Dashboard")),
    );
  }
}
