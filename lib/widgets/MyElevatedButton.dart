import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:online_check_in/core/utils/String_utilites.dart';

import '../core/constants/ui.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    Key? key,
    required this.height,
    required this.width,
    required this.buttonText,
    required this.bgColor,
    this.fgColor = MyColors.black,
    required this.function,
    this.textColor = MyColors.white,
    this.isDisable = false,
    this.fontSize = 15,
    this.borderRadius = 0,
    this.borderColor = Colors.transparent,
    this.child,
    this.isLoading = false,
  }) : super(key: key);

  final double height;
  final double width;
  final String buttonText;
  final Color bgColor;
  final Color fgColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback? function;
  final bool isDisable;
  final bool isLoading;
  final double fontSize;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        // borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: isLoading || isDisable ? null : function,
        style: isDisable
            ? ElevatedButton.styleFrom(
                foregroundColor: fgColor.withOpacity(0.2),
                backgroundColor: bgColor.withOpacity(0.2),
                textStyle: TextStyle(color: textColor.withOpacity(0.2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              )
            : ElevatedButton.styleFrom(
                foregroundColor: fgColor,
                backgroundColor: bgColor,
                textStyle: TextStyle(color: textColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
            : child ??
                Text(
                  // buttonText.translate(context),
                  buttonText,
                  style: TextStyle(fontSize: fontSize),
                ),
      ),
    );
  }
}
