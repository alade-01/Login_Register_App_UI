import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/shared/app_button.dart';
import '../../core/constants.dart';
import '../../core/router_generator.dart';
import '../../core/utilis.dart';
import '../components/item/social_network_item.dart';
import '../components/shared/background.dart';
import '../components/shared/or_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Initially password is obscure
  bool _obscureText = true, loading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

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
                children: [
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
                  Text(
                    "Welcome back! Glad to see you, Again!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: secondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 0),
                          child: TextFormField(
                            controller: _emailController,
                            style: textStyleInput,
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
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                CupertinoIcons.at,
                              ),
                              hintText: "Enter your email",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 17),
                          child: TextFormField(
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "This field is required";
                              }
                              return null;
                            },
                            style: textStyleInput,
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CupertinoIcons.lock,
                              ),
                              hintText: "Enter your password",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, RouterGenerator.forgotPasswordRoute),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  "Forgot password?",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          color: const Color(0xFF6A707C),
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
                  AppButton(
                    callback: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    label: "Login",
                    buttonType: ButtonType.PRIMARY,
                    width: size.width,
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                  const OrDivider(),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE),
                  const SocialNetworkItem(),
                ],
              ),
            )),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, RouterGenerator.registerRoute),
              child: RichText(
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15,
                      color: const Color(0xFF24282C),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Register Now',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontSize: 15,
                                color: primaryColor,
                                fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
