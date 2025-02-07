import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:on_boarding/Pages/forgot_password_page.dart';
import 'package:on_boarding/Pages/language.dart';
import 'package:on_boarding/Pages/location_permission_page.dart';
import 'package:on_boarding/Pages/login_page.dart';
import 'package:on_boarding/Pages/profile_page.dart';
import 'package:on_boarding/Pages/signup_page.dart';
import 'package:on_boarding/Pages/splash_screen.dart';
import 'package:on_boarding/Pages/verification_page.dart';
import 'package:on_boarding/Pages/welcome_page.dart';

List<GetPage> appRoutes = [

        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/forgot_password', page: () => ForgotPasswordPage()),
        GetPage(name: '/language', page: () => LanguagePage()),
        GetPage(name: '/location', page: () => LocationPermissionPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/verification', page: () => VerificationPage()),
        GetPage(name: '/welcome', page: () => WelcomePage()),
];