import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InterestButtonSquare extends StatefulWidget {
  final String interest;
  final void Function(String) onPressed;

  const InterestButtonSquare({
    super.key,
    required this.interest,
    required this.onPressed,
  });

  @override
  State<InterestButtonSquare> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButtonSquare> {
  bool _isSelected = false;

  void _onTap() {
    widget.onPressed(widget.interest);
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        alignment: Alignment.bottomLeft,
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          left: Sizes.size12,
          right: Sizes.size10,
          top: Sizes.size10,
          bottom: 0,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Color(0xFF1DA1F2) : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size10),
          border: Border.all(
            color: Colors.black.withAlpha(25),
            width: Sizes.size2,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FaIcon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Colors.white,
                  size: Sizes.size16,
                ),
              ],
            ),
            Gaps.v14,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.interest,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
