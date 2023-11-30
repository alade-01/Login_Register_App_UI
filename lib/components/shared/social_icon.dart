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
        margin: const EdgeInsets.only(left: 10),
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        decoration: const BoxDecoration(
            color: Color(0xFFECECEC),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SvgPicture.asset(
          iconSrc!,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
