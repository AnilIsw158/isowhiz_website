import 'package:isowhiz_website/screens/home/home_controller.dart';
import 'package:isowhiz_website/widgets/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testingLoader();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Home Screen",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        );
      },
    );
  }

  void testingLoader() {
    CustomLoader.show(context);
    Future.delayed(const Duration(seconds: 3), () {
      CustomLoader.hide();
    });
  }
}
