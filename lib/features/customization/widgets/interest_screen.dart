import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/widgets/twitter_appbar.dart';
import 'package:twitter_clone/features/customization/widgets/interest_button_square.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  // "Daily Life",
  // "Comedy",
  // "Entertainment",
  // "Animals",
  // "Food",
  // "Beauty & Style",
  // "Drama",
  // "Learning",
  // "Talent",
  // "Sports",
  // "Auto",
  // "Family",
  // "Fitness & Health",
  // "DIY & Life Hacks",
  // "Arts & Crafts",
  // "Dance",
  // "Outdoors",
  // "Oddly Satisfying",
  // "Home & Garden",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  void _onPress(String interest) {
    print("interest: $interest");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TwitterAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: Sizes.size20,
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Text(
                "What do you wnt to see on Twitter?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v16,
              Text(
                "Select at least 3 interests to personalize your Twitter experience. "
                "They will be visible on your profile.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
              Gaps.v28,
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size16,
                  mainAxisSpacing: Sizes.size16,
                  childAspectRatio: 2.0,
                  children: [
                    for (var interest in interests)
                      InterestButtonSquare(
                        interest: interest,
                        onPressed: _onPress,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
