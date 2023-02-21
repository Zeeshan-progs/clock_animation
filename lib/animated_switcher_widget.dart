import 'package:clock_animation/main.dart';

import 'package:flutter/widgets.dart';

class AnimatedSwitcherWidget extends StatelessWidget {
  const AnimatedSwitcherWidget({
    super.key,
    required this.time,
  });
  final String time;
  @override
  Widget build(BuildContext context) {
    // adding some basic animation
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 400,
      ),
      child: Text(
        time,
        style: textStyle(
          fontWeight: FontWeight.w700,
          fontSize: 56,
        ),
        // add key for animation to work
        key: ValueKey<String>(time),
      ),
    );
  }
}
