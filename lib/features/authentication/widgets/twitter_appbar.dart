import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/sizes.dart';

class TwitterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLeading;
  const TwitterAppBar({super.key, this.showLeading = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showLeading
          ? GestureDetector(
              onTap: () => {Navigator.of(context).pop()},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size16,
                  horizontal: Sizes.size16,
                ),
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black87,
                  size: Sizes.size20,
                ),
              ),
            )
          : null,
      automaticallyImplyLeading: false,

      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: FaIcon(
        FontAwesomeIcons.twitter,
        color: Color(0xFF1DA1F2),
        size: Sizes.size28,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
