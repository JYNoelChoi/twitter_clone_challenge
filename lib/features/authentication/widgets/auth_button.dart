import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final FaIcon? icon;
  final Image? image;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final bool showLeader;

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
    this.showLeader = false,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.all(Sizes.size10),
          decoration: BoxDecoration(
            color: widget.buttonColor ?? Colors.white,
            borderRadius:
                widget.borderRadius ?? BorderRadius.circular(Sizes.size32),
            border: Border.all(
              color: widget.borderColor ?? Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:
                    widget.icon ??
                    ((widget.image != null) ? widget.image : null),
              ),
              Gaps.h16,
              widget.showLeader
                  ? CupertinoActivityIndicator(color: Colors.white)
                  : Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w800,
                        color: widget.textColor ?? Colors.black87,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
