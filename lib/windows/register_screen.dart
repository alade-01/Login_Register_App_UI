import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/shared/app_button.dart';
import '../../core/router_generator.dart';
import '../../core/utilis.dart';
import '../../core/constants.dart';
import '../components/item/social_network_item.dart';
import '../components/shared/background.dart';

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

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordControllerConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Create Account",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 1.5),
                    Text(
                      "Create an account so you can explore "
                      "all the existing jobs",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5),
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
                            margin: const EdgeInsets.symmetric(vertical: 23),
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
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 4.8),
                    AppButton(
                      callback: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      label: "Sign up",
                      buttonType: ButtonType.PRIMARY,
                      width: size.width,
                      horizontalPadding: 0,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 3.5),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouterGenerator.loginRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Already have an account",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontSize: 14,
                                  color: const Color(0xFF494949),
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 6.5),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or continue with",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontSize: 14,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600),
                        )),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                    const SocialNetworkItem(),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
