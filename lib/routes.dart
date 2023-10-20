import 'package:get/get.dart';
import 'package:lapor_kasat/app/binding/auth/auth_binding.dart';
import 'package:lapor_kasat/app/binding/splash_screen/splash_screen_binding.dart';
import 'package:lapor_kasat/app/views/pages/auth/login_page.dart';
import 'package:lapor_kasat/app/views/pages/auth/register_page.dart';
import 'package:lapor_kasat/app/views/pages/auth/reset_password_page.dart';
import 'package:lapor_kasat/app/views/pages/menu/dashboard.dart';
import 'package:lapor_kasat/app/views/pages/splash_screen/splash_screen.dart';

final pageRoutes = [
  GetPage(
      name: '/',
      page: () => const SplashScreen(),
      binding: SplashScreenBinding()),
  GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
      binding: LoginBinding()),
  GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
      binding: RegisterBinding()),
  GetPage(
      name: '/auth/reset',
      page: () => const ResetPasswordPage(),
      binding: ResetPasswordBinding()),
  GetPage(name: '/menu/dashboard', page: () => const Dashboard())
];
