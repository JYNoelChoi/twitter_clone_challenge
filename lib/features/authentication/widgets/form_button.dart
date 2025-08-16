import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;

  const FormButton({super.key, required this.disabled});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size28),
          color: disabled ? Colors.grey.shade300 : Colors.black,
        ),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 500),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
          ),
          child: Text(
            "Next",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: Sizes.size16,
            ),
          ),
        ),
      ),
    );
  }
}
