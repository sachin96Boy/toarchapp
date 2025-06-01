import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torch_light/torch_light.dart';
import 'package:tourch_app/model/torch_model.dart';

class TorchNotifier extends Notifier<TorchModel> {
  @override
  TorchModel build() {
    return TorchModel(
      flashLightState: FlashLightState.off,
      isFlashlightSupported: false,
      errorMessage: '',
      lightMode: LightMode.flashlight,
    );
  }

  Future<void> checkFlashlightSupported() async {
    final isSupported = state.isFlashlightSupported;

    if (!isSupported) {
      // check if flashlight is supported
      final isTorchAvailable = await TorchLight.isTorchAvailable();

      if (isTorchAvailable) {
        state = state.copyWith(isFlashlightSupported: true);
      } else {
        state = state.copyWith(
          errorMessage: 'Flashlight is not supported on this device.',
        );
      }
    }
  }

  Future<void> toggleFlashlight() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    final isTorchOn = state.flashLightState == FlashLightState.on;

    if (isTorchOn) {
      await TorchLight.disableTorch();
      state = state.copyWith(flashLightState: FlashLightState.off);
    } else {
      await TorchLight.enableTorch();
      state = state.copyWith(flashLightState: FlashLightState.on);
    }
  }

  Future<void> setLightMode(LightMode mode) async {
    if (!state.isFlashlightSupported) {
      return;
    }

    state = state.copyWith(lightMode: mode);

    switch (mode) {
      case LightMode.sos:
        // Implement SOS logic
        break;
      case LightMode.flashlight:
        await toggleFlashlight();
        break;
      case LightMode.dimlight:
        // Implement dim light logic
        break;
      case LightMode.sunset:
        // Implement sunset logic
        break;
    }
  }

  Future<void> shakeToToggle() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    // Implement shake to toggle logic
    // This is a placeholder for the actual implementation
    await toggleFlashlight();
  }
}
