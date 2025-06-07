import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/components/bulboverlay/dots_painter.dart';
import 'package:tourch_app/model/torch_model.dart';
import 'package:tourch_app/providers/torch_provider.dart';
import 'package:tourch_app/utils/util_funcs.dart';

class AnimatedDots extends ConsumerStatefulWidget {
  const AnimatedDots({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnimatedDotsState();
}

class _AnimatedDotsState extends ConsumerState<AnimatedDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final int dotCount = 40;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final torch = ref.watch(torchProvider);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: DotsPainter(
                animationValue: _animation.value,
                dotCount: dotCount,
                color:
                    torch.flashLightState == FlashLightState.on
                        ? handleItemColorByColorMode(torch.colorMode)
                        : Colors.grey,
              ),
              size: Size(200, 200),
            ),
            CustomPaint(
              painter: DotsPainter(
                animationValue: _animation.value,
                dotCount: dotCount,
                color:
                    torch.flashLightState == FlashLightState.on
                        ? handleItemColorByColorMode(torch.colorMode)
                        : Colors.grey,
              ),
              size: Size(300, 300),
            ),
            CustomPaint(
              painter: DotsPainter(
                animationValue: _animation.value,
                dotCount: dotCount,
                color:
                    torch.flashLightState == FlashLightState.on
                        ? handleItemColorByColorMode(torch.colorMode)
                        : Colors.grey,
              ),
              size: Size(400, 400),
            ),
          ],
        );
      },
    );
  }
}
