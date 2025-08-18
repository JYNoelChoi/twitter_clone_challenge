import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/widgets/twitter_appbar.dart';
import 'package:twitter_clone/features/customization/widgets/interest_button_small.dart';
import 'package:twitter_clone/features/customization/widgets/interst_list.dart';

class InterestScreenPart2 extends StatefulWidget {
  const InterestScreenPart2({super.key});

  @override
  State<InterestScreenPart2> createState() => _InterestScreenPart2State();
}

class _InterestScreenPart2State extends State<InterestScreenPart2> {
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
      appBar: TwitterAppBar(showLeading: true),
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
                "Interests are used to personalize your experience and will "
                "be visible on your profile.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
              Gaps.v20,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Music",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: Sizes.size20,
                      ),
                    ),
                    Gaps.v10,
                    Expanded(
                      flex: 1,
                      child: MasonryGridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: musicGenres.length,
                        itemBuilder: (context, index) {
                          return InterestButtonSmall(
                            interest: musicGenres[index],
                            onPressed: _onPressInterest,
                          );
                        },
                      ),
                    ),

                    Gaps.v20,
                    Text(
                      "Entertainment",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.v10,
                    Expanded(
                      child: MasonryGridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: entertainmentGenres.length,
                        itemBuilder: (context, index) {
                          return InterestButtonSmall(
                            interest: entertainmentGenres[index],
                            onPressed: _onPressInterest,
                          );
                        },
                      ),
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text(
                //   textMessage,
                //   style: TextStyle(
                //     fontSize: Sizes.size14,
                //     color: Colors.grey.shade600,
                //   ),
                // ),
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
