import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:on_boarding/Pages/permission_page.dart';
import 'package:on_boarding/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 1, 1),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      initialRoute: '/',
      getPages: appRoutes,
      home: PermissionPage(),
    );
  }
}
