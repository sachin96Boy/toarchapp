import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSwitch extends ConsumerStatefulWidget {
  const CustomSwitch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends ConsumerState<CustomSwitch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
          WidgetState.selected: Colors.amber.withOpacity(0.54),
          WidgetState.disabled: Colors.grey.shade400,
        });

    const WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color>{
          WidgetState.selected: Colors.amber,
        });

    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Shake", style: TextStyle(color: Colors.orange, fontSize: 16)),
          SizedBox(width: 8),
          Switch(
            value: light,
            overlayColor: overlayColor,
            trackColor: trackColor,
            thumbColor: const WidgetStatePropertyAll<Color>(Colors.white),
            onChanged: (value) {
              setState(() {
                light = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
