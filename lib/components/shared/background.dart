import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
    this.topImage = "res/images/back_arrow.svg",
  }) : super(key: key);

  final String topImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 60,
              left: 19,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: const Color(0xFFE8ECF4)),
                    borderRadius: BorderRadius.circular(13.0),
                    // borderRadius : BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset(
                    topImage,
                    width: 25,
                    //height: 35,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Image.asset(bottomImage, width: 120),
            // ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
