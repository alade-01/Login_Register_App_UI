import 'package:flutter/material.dart';

import '../shared/social_icon.dart';

class SocialNetworkItem extends StatelessWidget {
  const SocialNetworkItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: "res/images/google.svg",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "res/images/facebook.svg",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "res/images/apple.svg",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
