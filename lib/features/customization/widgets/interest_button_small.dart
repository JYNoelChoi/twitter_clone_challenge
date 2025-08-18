import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class InterestButtonSmall extends StatefulWidget {
  final String interest;
  final void Function(String, bool) onPressed;
  const InterestButtonSmall({
    super.key,
    required this.interest,
    required this.onPressed,
  });

  @override
  State<InterestButtonSmall> createState() => _InterestButtonSmallState();
}

class _InterestButtonSmallState extends State<InterestButtonSmall> {
  bool _isSelected = false;

  void _onTap() {
    widget.onPressed(widget.interest, !_isSelected);
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          left: Sizes.size14,
          right: Sizes.size14,
          top: Sizes.size8,
          bottom: Sizes.size6,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Color(0xFF1DA1F2) : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size40),
          border: Border.all(
            color: Colors.black.withAlpha(25),
            width: Sizes.size2,
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
