import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/components/bulboverlay/animated_dots.dart';
import 'package:tourch_app/constants/app_constants.dart';
import 'package:tourch_app/model/torch_model.dart';
import 'package:tourch_app/providers/torch_provider.dart';
import 'package:tourch_app/utils/util_funcs.dart';

class BulbSection extends ConsumerWidget {
  const BulbSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double scHight = MediaQuery.of(context).size.height;

    final torch = ref.watch(torchProvider);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 2,
              height: scHight * 0.23,
              color: Colors.white,
            ),
          ),
          Image.asset(
            AppConstants.bulbOffPath,
            color: handleItemColorByColorMode(torch.colorMode),
            opacity:
                torch.flashLightState == FlashLightState.off
                    ? const AlwaysStoppedAnimation(0.5)
                    : const AlwaysStoppedAnimation(1.0),
            colorBlendMode: handleBlendModeByColorMode(
              torch.colorMode,
              torch.flashLightState,
            ),
            height: 150,
          ),
          AnimatedDots(),
        ],
      ),
    );
  }
}
