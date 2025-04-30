import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomTabBar extends ConsumerStatefulWidget {
  const BottomTabBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends ConsumerState<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorColor: Colors.orangeAccent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "S.O.S Signal"),
              Tab(text: "Flashlight"),
              Tab(text: "Dim Light"),
              Tab(text: "Sunset"),
            ],
          ),
        ],
      ),
    );
  }
}
