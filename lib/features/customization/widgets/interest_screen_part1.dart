import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/widgets/auth_button.dart';
import 'package:twitter_clone/features/authentication/widgets/form_button.dart';
import 'package:twitter_clone/features/authentication/widgets/twitter_appbar.dart';
import 'package:twitter_clone/features/customization/widgets/interest_button_square.dart';
import 'package:twitter_clone/features/customization/widgets/interest_screen_part2.dart';

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

class InterestScreenPart1 extends StatefulWidget {
  const InterestScreenPart1({super.key});

  @override
  State<InterestScreenPart1> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreenPart1> {
  final int _minNumInterest = 3;
  final List<String> _selectedInterests = [];
  bool _isMinInterestSelected = false;
  String textMessage = "";
  void _onPressInterest(String interest, bool isSelected) {
    if (isSelected) {
      _selectedInterests.add(interest);
    } else {
      _selectedInterests.remove(interest);
    }
    _isMinInterestSelected = (_selectedInterests.length >= _minNumInterest);
    if (!_isMinInterestSelected) {
      textMessage = "${_selectedInterests.length} of $_minNumInterest selected";
    } else {
      textMessage = "Great work 🎉";
    }
    setState(() {});
    // print("interests: $selectedInterests");
  }

  void _onTapNext() {
    if (_isMinInterestSelected) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InterestScreenPart2()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    textMessage = "${_selectedInterests.length} of $_minNumInterest selected";
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
                "What do you want to see on Twitter?",
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
                        onPressed: _onPressInterest,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 140,
        child: BottomAppBar(
          // color: Colors.white,
          child: Padding(
            padding: EdgeInsetsGeometry.only(bottom: Sizes.size24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textMessage,
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.grey.shade600,
                  ),
                ),
                GestureDetector(
                  onTap: _onTapNext,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size6,
                      horizontal: Sizes.size12,
                    ),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size28),
                        color: !_isMinInterestSelected
                            ? Colors.grey.shade300
                            : Colors.black87,
                      ),
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 300),
                        style: TextStyle(
                          color: !_isMinInterestSelected
                              ? Colors.grey.shade400
                              : Colors.white,
                        ),
                        child: Text(
                          "Next",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
