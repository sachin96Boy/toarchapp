import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/model/torch_model.dart';
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
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                indicatorColor: handleItemColorByColorMode(torch.colorMode),
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.withOpacity(0.5),
                ),

                onTap: (index) {
                  // Handle tab change if needed
                  switch (index) {
                    case 0:
                      ref
                          .read(torchProvider.notifier)
                          .setLightMode(LightMode.sos);
                      break;
                    case 1:
                      ref
                          .read(torchProvider.notifier)
                          .setLightMode(LightMode.flashlight);
                      break;
                    case 2:
                      ref
                          .read(torchProvider.notifier)
                          .setLightMode(LightMode.dimlight);
                      break;
                    case 3:
                      ref
                          .read(torchProvider.notifier)
                          .setLightMode(LightMode.sunset);
                      break;
                    default:
                      ref
                          .read(torchProvider.notifier)
                          .setLightMode(LightMode.flashlight);
                      break;
                  }
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
