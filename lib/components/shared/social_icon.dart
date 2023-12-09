import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalIcon extends StatelessWidget {
  final String? iconSrc;
  final Function? press;

  const SocalIcon({
    Key? key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 42, right: 42),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: const Color(0xFFE8ECF4)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: SvgPicture.asset(
          iconSrc!,
          height: 24,
          width: 12,
        ),
      ),
    );
  }
}
