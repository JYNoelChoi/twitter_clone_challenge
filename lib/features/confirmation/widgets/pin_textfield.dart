import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PinTextfield extends StatelessWidget {
  final FocusNode focusNode;
  final FocusNode? prevFocus;
  final FocusNode? nextFocus;
  final TextEditingController controller;
  final int index;
  final void Function(int, String) onInputChanged;

  const PinTextfield({
    super.key,
    this.prevFocus,
    this.nextFocus,
    required this.focusNode,
    required this.controller,
    required this.index,
    required this.onInputChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.size32,
      height: Sizes.size52,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: Sizes.size24,
          color: Colors.black87,
          fontWeight: FontWeight.w900,
        ),
        autofocus: index == 0 ? true : false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        focusNode: focusNode,
        onChanged: (value) {
          if (value.length == 1) {
            nextFocus?.requestFocus();
          } else if (value.isEmpty) {
            prevFocus?.requestFocus();
          }
          onInputChanged(index, value);
        },
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: Sizes.size4,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87, width: Sizes.size4),
          ),
        ),
      ),
    );
  }
}
