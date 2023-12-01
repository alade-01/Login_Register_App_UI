import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
                      Text(
                        "OTP Verification",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: secondaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,),
                      ),
                      const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                      Text(
                        "Enter the verification code we just sent on your email address.",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Color(0xFF8391A1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            4,
                                (index) => SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                    onChanged: (value){
                                      if(value.length == 1){
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                   // onSaved: (pin1){},
                                    decoration: InputDecoration(hintText: "0"),
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: secondaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                          )
                        ],
                      ),
                      const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
                      AppButton(
                        callback: () => Navigator.pushNamed(context, RouterGenerator.newPasswordRoute),
                        label: "Send Code",
                        buttonType: ButtonType.PRIMARY,
                        width: size.width,
                      ),
                      const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: RichText(
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
                ),
              )
            ],
          ),
        ));
  }
}
