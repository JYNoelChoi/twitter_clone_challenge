import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/widgets/form_button.dart';
import 'package:twitter_clone/features/authentication/widgets/twitter_appbar.dart';

class CustomizeExprienceScreen extends StatefulWidget {
  const CustomizeExprienceScreen({super.key});

  @override
  State<CustomizeExprienceScreen> createState() =>
      _CustomizeExprienceScreenState();
}

class _CustomizeExprienceScreenState extends State<CustomizeExprienceScreen> {
  final TextStyle _textLinkStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );

  bool _customizeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TwitterAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Text(
                "Customize your experience",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              Gaps.v28,
              Text(
                "Tracking where you see Twitter content across the web",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v28,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Twitter uses this data to personalize your experienc. "
                      "This web browsing history will never be stored with your name, "
                      "email, or phone number.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CupertinoSwitch(
                    value: _customizeEnabled,
                    onChanged: (value) {
                      setState(() {
                        _customizeEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              Gaps.v20,
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "By signing up, you agree to our"),
                    TextSpan(
                      text: "Terms, Privay Policy,",
                      style: _textLinkStyle,
                    ),
                    TextSpan(text: " and "),
                    TextSpan(text: "Cookit Use", style: _textLinkStyle),
                    TextSpan(
                      text:
                          ". Twitter may use your contact information, including your email address"
                          " and phone number for purposes outlined in our Privacy Policy.",
                    ),
                    TextSpan(text: "Lean more", style: _textLinkStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: GestureDetector(
          onTap: () => {Navigator.of(context).pop(_customizeEnabled)},
          child: FormButton(disabled: !_customizeEnabled),
        ),
      ),
    );
  }
}
