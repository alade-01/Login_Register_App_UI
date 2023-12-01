import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_app_ui_kit/core/router_generator.dart';

import '../../components/shared/app_button.dart';
import '../../core/utilis.dart';
import '../../core/constants.dart';
import '../components/item/social_network_item.dart';
import '../components/shared/background.dart';
import '../components/shared/or_divider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Initially password is obscure
  bool _obscureTextFieldOne = true,
      _obscureTextFieldTwo = true,
      loading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordControllerConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
                    Text(
                      "Hello! Register to get started",
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
                            margin: const EdgeInsets.only(top: 5, bottom: 17),
                            child: TextFormField(
                              controller: _userController,
                              style: textStyleInput,
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return "This field is required";
                                }
                                if (value != null &&
                                    value.isNotEmpty &&
                                    !StringUtil.isValidEmail(value)) {
                                  return "The Username is invalid";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  CupertinoIcons.person,
                                ),
                                hintText: "Username",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
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
                                hintText: "Email",
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
                              obscureText: _obscureTextFieldOne,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Password",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextFieldOne =
                                          !_obscureTextFieldOne;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextFieldOne
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return "This field is required";
                                }
                                if (_passwordControllerConfirm !=
                                    _passwordController) {
                                  return "Different password";
                                }
                                return null;
                              },
                              style: textStyleInput,
                              controller: _passwordControllerConfirm,
                              obscureText: _obscureTextFieldTwo,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Confirm Password",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextFieldTwo =
                                          !_obscureTextFieldTwo;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextFieldTwo
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 1.8),
                    AppButton(
                      callback: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      label: "Register",
                      buttonType: ButtonType.PRIMARY,
                      width: size.width,
                      horizontalPadding: 10,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                    OrDivider(),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE),
                    const SocialNetworkItem(),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, RouterGenerator.loginRoute),
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15,
                      color: Color(0xFF24282C),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Login Now',
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
            )
          ],
        ),
      ),
    );
  }
}
