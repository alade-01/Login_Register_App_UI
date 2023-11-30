import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/shared/app_button.dart';
import '../core/router_generator.dart';
import '../core/constants.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
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
              Text(
                "Password Changed! ",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: secondaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              Text(
                "Your password has been changed successfully.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Color(0xFF8391A1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2.5),
              SvgPicture.asset(
                "res/images/successmark.svg",
                width: 141.13,
                height: 26.03,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2.5),
              AppButton(
                callback: () =>
                    Navigator.pushNamed(context, RouterGenerator.loginRoute),
                label: "Back to Login",
                buttonType: ButtonType.PRIMARY,
                width: size.width * 0.9,
                //horizontalPadding: 12.0
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 3.5),
            ],
          ),
        ),
      ),
    );
  }
}
