import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/components/bulboverlay/animated_dots.dart';

class BulbSection extends ConsumerWidget {
  const BulbSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedDots(),
          Image.asset('assets/buld_on.png', height: 150),
          Positioned(
            top: 0,
            child: Container(width: 2, height: 100, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
