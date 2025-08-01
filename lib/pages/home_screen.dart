import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/components/bottom_batbar.dart';
import 'package:tourch_app/components/bulb_section.dart';
import 'package:tourch_app/components/custom_switch.dart';
import 'package:tourch_app/components/topbar.dart';
import 'package:tourch_app/providers/shake_provider.dart';
import 'package:tourch_app/providers/torch_provider.dart';
import 'package:tourch_app/utils/util_funcs.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(torchProvider.notifier).checkFlashlightSupported();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(torchProvider.select((value) => value.errorMessage), (
      previous,
      next,
    ) {
      if (next.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next), duration: const Duration(seconds: 2)),
        );
      }
    });

    ref.watch(shakeProvider);

    final torch = ref.watch(torchProvider);

    return Scaffold(
      backgroundColor: handleBgColorByColorMode(torch.colorMode),
      body: SafeArea(
        child: Column(
          children: [TopBar(), Expanded(child: BulbSection()), CustomSwitch()],
        ),
      ),
      bottomNavigationBar: const BottomTabBar(),
    );
  }
}
