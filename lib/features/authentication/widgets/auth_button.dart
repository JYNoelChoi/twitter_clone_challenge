import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;
  final Image? image;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? textColor;
  final BorderRadius? borderRadius;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.borderColor,
    this.borderRadius,
    this.image,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.all(Sizes.size10),
          decoration: BoxDecoration(
            color: buttonColor ?? Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(Sizes.size32),
            border: Border.all(
              color: borderColor ?? Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: icon ?? ((image != null) ? image : null)),
              Gaps.h16,
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w800,
                  color: textColor ?? Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
