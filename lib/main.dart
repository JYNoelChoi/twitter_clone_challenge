import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
// TODO: To clean up import lines later after finished
import 'package:twitter_clone/features/authentication/widgets/initial_screen.dart';
import 'package:twitter_clone/features/customization/widgets/interest_screen_part1.dart';

void main() {
  // runApp(const TwitterApp());
  // TODO: for dev only
  runApp(TwitterApp());
}

class TwitterApp extends StatelessWidget {
  TwitterApp({super.key});

  // TODO: for dev only
  final Map<String, String> formData = {
    "email": "adsfdsa@dsafds.com",
    "password": "asdfdasfadsfdsaf",
    "birdthday": "2003-01-01",
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 100,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // TODO: for dev only. To replace.
      // home: InitialScreen(),
      home: InterestScreenPart1(),
    );
  }
}
