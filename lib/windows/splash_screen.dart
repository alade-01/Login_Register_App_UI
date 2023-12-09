import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_register_app_ui_kit/core/constants.dart';

import '../core/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool startAnimated = false;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacementNamed(RouterGenerator.introRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 120,
            right: 120,
            top: 0,
            bottom: 20,
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(seconds: 3),
              width:
                  MediaQuery.of(context).size.width * (startAnimated ? .5 : .0),
              height:
                  MediaQuery.of(context).size.width * (startAnimated ? .5 : .0),
              child: SvgPicture.asset(
                "res/logos/logo_app.svg",
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 180,
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: CircularProgressIndicator(color: primaryColor),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Welcome to ',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Fruzz ',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'digital',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
