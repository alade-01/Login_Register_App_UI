import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_app_ui_kit/components/shared/background.dart';

import '../../components/shared/app_button.dart';
import '../../core/constants.dart';
import '../../core/utilis.dart';
import '../core/router_generator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                  Text(
                    "Don't worry! It occurs. Please enter the email address linked with your account.",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: swatchColorItem,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: emailControler,
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "This field is required";
                              }
                              if (value != null &&
                                  value.isNotEmpty &&
                                  !StringUtil.isValidEmail(value)) {
                                return "The email is invalid";
                              }
                              return null;
                            },
                            style: textStyleInput,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(CupertinoIcons.at),
                              hintText: "Enter your email",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
                  AppButton(
                    callback: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, RouterGenerator.otpRoute);
                      }
                    },
                    label: "Send Code",
                    buttonType: ButtonType.PRIMARY,
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, RouterGenerator.loginRoute),
            child: RichText(
              text: TextSpan(
                text: 'Remember Password? ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 15,
                    color: const Color(0xFF24282C),
                    fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Login',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w700))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
