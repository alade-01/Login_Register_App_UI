import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/otp_form_field.dart';
import '../components/shared/app_button.dart';
import '../components/shared/background.dart';
import '../core/constants.dart';
import '../core/router_generator.dart';

class OtpsScreen extends StatefulWidget {
  const OtpsScreen({super.key});

  @override
  State<OtpsScreen> createState() => _OtpsScreenState();
}

class _OtpsScreenState extends State<OtpsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Background(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
              Text(
                "Forgot Password?",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: secondaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Color(0xFF8391A1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              OtpFormField(length: 35,),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
              AppButton(
                callback: () => Navigator.pushNamed(context, RouterGenerator.newPasswordRoute),
                label: "Send Code",
                buttonType: ButtonType.PRIMARY,
                width: size.width,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
              RichText(
                text: TextSpan(
                  text: 'Didn’t received code?',
                  style:  Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                      fontSize: 15,
                      color: Color(0xFF24282C),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Resend',
                        style:  Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w700)
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
