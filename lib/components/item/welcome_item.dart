import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants.dart';

class WelcomeItem extends StatelessWidget {
  final String? title, text, image;

  const WelcomeItem({
    Key? key,
    this.title,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: SvgPicture.asset(
          image!,
          width: size.height / 0.5,
        )),
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 20),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: primaryColor, fontSize: 35, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            text!,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
