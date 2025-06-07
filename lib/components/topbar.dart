import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tourch_app/components/setting_dialog.dart';
import 'package:tourch_app/providers/torch_provider.dart';
import 'package:tourch_app/utils/util_funcs.dart';

class TopBar extends ConsumerWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final torch = ref.watch(torchProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShadButton(
            backgroundColor: Colors.grey.shade800,
            decoration: ShadDecoration(shape: BoxShape.circle),
            onPressed: () {
              showShadDialog(
                context: context,
                builder: (context) {
                  return SettingDialog();
                },
              );
            },
            child: Icon(Icons.settings, color: Colors.white),
          ),
          ShadButton(
            backgroundColor: Colors.grey.shade800,
            decoration: ShadDecoration(shape: BoxShape.circle),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: handleItemColorByColorMode(torch.colorMode),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: handleItemColorByColorMode(torch.colorMode),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
