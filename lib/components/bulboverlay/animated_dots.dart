import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/components/bulboverlay/dots_painter.dart';

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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: DotsPainter(
            animationValue: _animation.value,
            dotCount: dotCount,
          ),
          size: Size(200, 200),
        );
      },
    );
  }
}
