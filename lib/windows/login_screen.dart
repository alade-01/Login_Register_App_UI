import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/shared/app_button.dart';
import '../../core/router_generator.dart';
import '../../core/utilis.dart';
import '../../core/constants.dart';
import '../components/item/social_network_item.dart';
import '../components/shared/background.dart';

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
                    Text(
                      "Login here",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 2.5),
                    Text(
                      "Welcome back you’ve \n been missed!",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 4.5),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: TextFormField(
                              controller: _emailController,
                              // style: textStyleInput,
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
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Password",
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
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      RouterGenerator.forgotPasswordRoute);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Forgot your password?",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 2.8),
                    AppButton(
                      callback: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      label: "Sign in",
                      buttonType: ButtonType.PRIMARY,
                      width: size.width,
                      horizontalPadding: 10,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouterGenerator.registerRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Create new account",
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
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 7),
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
                    const SizedBox(height: BUTTON_SEPARATION_SPACE),
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
