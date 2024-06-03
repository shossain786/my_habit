import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:my_habit/main.dart';

import '../screens/data_entry.dart';

class MyFloatingActionBtn extends StatefulWidget {
  const MyFloatingActionBtn({super.key});

  @override
  State<MyFloatingActionBtn> createState() => _MyFloatingActionBtnState();
}

class _MyFloatingActionBtnState extends State<MyFloatingActionBtn>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButtonLocation.endDocked;
    return FloatingActionBubble(
      items: <Bubble>[
        Bubble(
          title: "Add Activities",
          iconColor: kColorScheme.onSecondary,
          bubbleColor: kColorScheme.onPrimaryContainer,
          icon: Icons.work_history_rounded,
          titleStyle: TextStyle(fontSize: 16, color: kColorScheme.onSecondary),
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DataEntryScreen(),
              ),
            );
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "My Muta'la",
          iconColor: kColorScheme.onSecondary,
          bubbleColor: kColorScheme.onPrimaryContainer,
          icon: Icons.note_add_rounded,
          titleStyle: TextStyle(fontSize: 16, color: kColorScheme.onSecondary),
          onPress: () {
            _animationController.reverse();
          },
        ),
      ],

      animation: _animation,
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      iconColor: kColorScheme.onSecondary,
      iconData: Icons.add,
      backGroundColor: kColorScheme.onPrimaryContainer.withOpacity(0.6),
    );
  }
}
