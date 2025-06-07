import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tourch_app/model/torch_model.dart';
import 'package:tourch_app/providers/torch_provider.dart';

class SettingDialog extends ConsumerStatefulWidget {
  const SettingDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingDialogState();
}

class _SettingDialogState extends ConsumerState<SettingDialog> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ShadDialog(
        backgroundColor: Colors.grey.shade400,
        title: Text('Settings', style: textTheme.headlineSmall),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Select Color Mode.', style: textTheme.bodySmall),
            SizedBox(height: 16),
            ShadSelect<ColorMode>(
              placeholder: Text(
                'Select Color Mode',
                style: textTheme.bodyMedium,
              ),
              selectedOptionBuilder:
                  (context, value) =>
                      Text(value.name, style: textTheme.bodyMedium),
              options: [
                ShadOption<ColorMode>(
                  value: ColorMode.base,
                  child: Text('base', style: textTheme.bodyMedium),
                ),
                ShadOption<ColorMode>(
                  value: ColorMode.yellow,
                  child: Text('Yellow', style: textTheme.bodyMedium),
                ),
                ShadOption<ColorMode>(
                  value: ColorMode.blue,
                  child: Text('Blue', style: textTheme.bodyMedium),
                ),
                ShadOption<ColorMode>(
                  value: ColorMode.green,
                  child: Text('Green', style: textTheme.bodyMedium),
                ),
              ],

              onChanged: (value) {
                // Handle color mode change
                if (value == null) return;
                ref.read(torchProvider.notifier).setColorMode(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
