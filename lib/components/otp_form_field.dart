import 'dart:math';

import 'package:flutter/material.dart';

import '../core/constants.dart';

class OtpFormField extends StatefulWidget {
  final int length;
  final double padding;

  const OtpFormField({Key? key, required this.length, this.padding = 0})
      : super(key: key);

  @override
  State<OtpFormField> createState() => OtpFormFieldState();
}

class OtpFormFieldState extends State<OtpFormField>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late List<FocusNode> myFocusNodes;
  late List<TextEditingController> codeControllers;

  late AnimationController animationController;
  late Animation<double> offsetAnimation;

  double MARGE = 0.0;

  bool codeError = false;

  get otp => codeControllers.map((e) => e.text).join("");

  bool validate() {
    if (formKey.currentState!.validate()) return true;
    codeError = true;
    animationController.forward(from: 0.0);
    return false;
  }

  void cleanAll() {
    for (int i = 0; i < codeControllers.length; i++) {
      codeControllers[i].clear();
    }
    myFocusNodes[0].requestFocus();
  }

  @override
  void initState() {
    super.initState();
    myFocusNodes = List.generate(widget.length, (index) => FocusNode());
    codeControllers =
        List.generate(widget.length, (index) => TextEditingController());

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500), value: 0);
    offsetAnimation = Tween(begin: 0.0, end: 2.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double width = _size.width * .8 - (2 * widget.padding);
    return Form(
      key: formKey,
      child: SizedBox(
        width: _size.width * .8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.length,
                  (index) => AnimatedBuilder(
                animation: offsetAnimation,
                builder: (context, child) {
                  return Container(
                    height: width / widget.length,
                    width: min(
                        width / widget.length,
                        (width -
                            (widget.length * 3) -
                            (widget.length * MARGE)) /
                            widget.length),
                    padding: EdgeInsets.only(
                        left: offsetAnimation.value + 2.0,
                        right: 2.0 - offsetAnimation.value),
                    child: TextFormField(
                      cursorColor: Colors.black38,
                      style: textStyleInput,
                      //enabled: !_loading,
                      focusNode: myFocusNodes[index],
                      textAlign: TextAlign.center,
                      controller: codeControllers[index],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        errorStyle: const TextStyle(fontSize: 0),
                        fillColor: codeError
                            ? Colors.red.shade50
                            : Theme.of(context).inputDecorationTheme.fillColor,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < (widget.length - 1)) {
                          myFocusNodes[index + 1].requestFocus();
                        } else {
                          if (value.isEmpty && index > 0) {
                            myFocusNodes[index - 1].requestFocus();
                          }
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}