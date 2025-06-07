import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/model/torch_model.dart';
import 'package:tourch_app/providers/torch_provider.dart';
import 'package:tourch_app/utils/util_funcs.dart';

class CustomSwitch extends ConsumerStatefulWidget {
  const CustomSwitch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends ConsumerState<CustomSwitch> {
  void handleButtonToggle() {
    ref.read(torchProvider.notifier).handleFlashlightBasedOnLightMode();
  }

  @override
  Widget build(BuildContext context) {
    final torch = ref.watch(torchProvider);

    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
          WidgetState.selected: handleItemColorByColorMode(
            torch.colorMode,
          ).withOpacity(0.2),
          WidgetState.disabled: Colors.grey.shade400,
        });

    const WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color>{
          WidgetState.selected: Colors.amber,
        });

    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: handleItemColorByColorMode(torch.colorMode),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Shake", style: TextStyle(color: Colors.orange, fontSize: 16)),
            SizedBox(width: 8),
            Switch(
              value: torch.flashLightState == FlashLightState.on ? true : false,
              overlayColor: overlayColor,
              trackColor: trackColor,
              thumbColor: const WidgetStatePropertyAll<Color>(Colors.white),
              onChanged: (_) {
                handleButtonToggle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
