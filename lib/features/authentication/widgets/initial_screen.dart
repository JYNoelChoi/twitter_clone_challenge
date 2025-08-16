import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/widgets/auth_button.dart';
import 'package:twitter_clone/features/authentication/widgets/create_account_screen.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => CreateAccountScreen()));
  }

  final TextStyle _textLinkStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Appbar")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.twitter, color: Color(0xFF1DA1F2)),
                ],
              ),
              Gaps.v96,
              Gaps.v96,
              Text(
                "See what's happening in the world right now",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              Gaps.v96,
              AuthButton(
                text: "Continue with Google",
                image: Image.network(
                  "https://www.gstatic.com/marketing-cms/assets/images/d5/dc/cfe9ce8b4425b410b49b7f2dd3f3/g.webp=s48-fcrop64=1,00000000ffffffff-rw",
                  width: Sizes.size24,
                ),
                onPressed: null,
              ),
              Gaps.v12,
              AuthButton(
                text: "Continue with Apple",
                icon: FaIcon(
                  FontAwesomeIcons.apple,
                  color: Colors.black,
                  size: Sizes.size32,
                ),
                onPressed: null,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      thickness: Sizes.size1,
                    ),
                  ),
                  Gaps.h16,
                  Text(
                    "or",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      color: Colors.black45,
                    ),
                  ),
                  Gaps.h16,
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      thickness: Sizes.size1,
                    ),
                  ),
                ],
              ),
              Gaps.v12,
              AuthButton(
                text: "Create acount",
                onPressed: () => _onCreateAccountTap(context),
                buttonColor: Colors.black,
                textColor: Colors.white,
              ),
              Gaps.v12,
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
                    TextSpan(text: "."),
                  ],
                ),
              ),
              Gaps.v44,
              Row(
                children: [
                  Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "Have a account already? "),
                        TextSpan(text: "Log in", style: _textLinkStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
