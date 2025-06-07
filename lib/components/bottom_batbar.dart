import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/providers/torch_provider.dart';
import 'package:tourch_app/utils/util_funcs.dart';

class BottomTabBar extends ConsumerStatefulWidget {
  const BottomTabBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends ConsumerState<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    final torch = ref.watch(torchProvider);
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TabBar(
                physics: const BouncingScrollPhysics(),
                enableFeedback: true,
                splashFactory: InkSplash.splashFactory,
                splashBorderRadius: BorderRadius.circular(100),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                indicatorColor: handleItemColorByColorMode(torch.colorMode),
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                onTap: (index) {
                  // Handle tab change if needed
                },

                tabs: [
                  Tab(text: "S.O.S Signal"),
                  Tab(text: "Flashlight"),
                  Tab(text: "Dim Light"),
                  Tab(text: "Sunset"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
