import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/components/bulboverlay/animated_dots.dart';

class BulbSection extends ConsumerWidget {
  const BulbSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double scHight = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 2,
              height: scHight * 0.3,
              color: Colors.white,
            ),
          ),
          Image.asset('assets/bulbs/bulb_on.png', height: 150),
          AnimatedDots(),
        ],
      ),
    );
  }
}
