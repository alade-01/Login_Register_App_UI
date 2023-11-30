import 'package:flutter/material.dart';
import 'package:login_register_app_ui_kit/windows/login_screen.dart';
import 'package:login_register_app_ui_kit/windows/otp_screen.dart';
import 'package:login_register_app_ui_kit/windows/register_screen.dart';

import '../windows/forgot_password_screen.dart';
import '../windows/splash_screen.dart';
import '../windows/welcome_screen.dart';

class RouterGenerator {
  static const splashRoute = "/";
  static const introRoute = "/intro";
  static const loginRoute = "/login";
  static const registerRoute = "/register";
  static const forgotPasswordRoute = "/forgot-password";
  static const otpRoute = "/otp";

  // static const indexRoute = "/index";

  static Route<dynamic> navigate(RouteSettings setting) {
    debugPrint("$setting");
    switch (setting.name) {
      case RouterGenerator.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouterGenerator.introRoute:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case RouterGenerator.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RouterGenerator.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case RouterGenerator.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
        case RouterGenerator.otpRoute:
        return MaterialPageRoute(
          builder: (_) => const OtpsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
