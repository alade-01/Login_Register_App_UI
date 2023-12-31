import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/shared/app_button.dart';
import '../core/constants.dart';
import '../core/router_generator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("res/images/welcomeImg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SvgPicture.asset(
                "res/logos/logo_app.svg",
                width: 58,
                height: 58,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              SvgPicture.asset(
                "res/logos/logo_text.svg",
                width: 141.13,
                height: 26.03,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              AppButton(
                callback: () =>
                    Navigator.pushNamed(context, RouterGenerator.loginRoute),
                label: "Login",
                buttonType: ButtonType.PRIMARY,
                width: size.width * 0.9,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              AppButton(
                callback: () =>
                    Navigator.pushNamed(context, RouterGenerator.registerRoute),
                label: "Register",
                color: secondaryColor,
                solid: false,
                buttonType: ButtonType.SECONDARY,
                width: size.width * 0.9,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 5.5),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, RouterGenerator.registerRoute),
                child: Text(
                  "Continue as a guest",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: primaryColor),
                ),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 3.5),
            ],
          ),
        ),
      ),
    );
  }
}
