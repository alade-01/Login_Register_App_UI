import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_app_ui_kit/components/shared/background.dart';

import '../../components/shared/app_button.dart';
import '../../core/utilis.dart';
import '../../core/constants.dart';
import '../core/router_generator.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  //Initially password is obscure
  bool _obscureTextFieldOne = true,
      _obscureTextFieldTwo = true,
      loading = false;


  final TextEditingController _passwordController = TextEditingController(),
      _passwordControllerConfirm = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
              Text(
                "Create new password",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: secondaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              Text(
                "Your new password must be unique from those previously used.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Color(0xFF8391A1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
              Form(
                key: formKey,
                child: Column(
                  children: [
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
                          hintText: "New Password",
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
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
              AppButton(
                callback: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, RouterGenerator.otpRoute);
                  }
                },
                label: "Reset Password",
                buttonType: ButtonType.PRIMARY,
                width: size.width,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
              RichText(
                text: TextSpan(
                  text: 'Remember Password?',
                  style:  Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                      fontSize: 15,
                      color: Color(0xFF24282C),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Login',
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
