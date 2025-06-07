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
      colorMode: ColorMode.base,
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

  Future<void> handleFlashlightBasedOnLightMode() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    switch (state.lightMode) {
      case LightMode.sos:
        // Handle SOS mode logic here
        await toggleSosLight();
        break;
      case LightMode.flashlight:
        await toggleFlashlight();
        break;
      case LightMode.dimlight:
        // Handle dim light mode logic here
        await toggleDimLight();
        break;
      case LightMode.sunset:
        // Handle sunset mode logic here
        await toggleSunset();
        break;
    }
  }

  Future<void> toggleFlashlight() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    final isTorchOn = state.flashLightState == FlashLightState.on;

    if (isTorchOn) {
      try {
        await TorchLight.disableTorch();
        state = state.copyWith(flashLightState: FlashLightState.off);
      } on DisableTorchExistentUserException catch (e) {
        // The camera is in use
        state = state.copyWith(
          errorMessage:
              'Flashlight is currently in use by another application.',
        );
      } on DisableTorchNotAvailableException catch (e) {
        // Torch was not detected
        state = state.copyWith(
          errorMessage: 'Flashlight is not available on this device.',
        );
      } on DisableTorchException catch (e) {
        // Torch could not be disabled due to another error
        state = state.copyWith(
          errorMessage:
              'An error occurred while trying to disable the flashlight.',
        );
      }
    } else {
      try {
        await TorchLight.enableTorch();
        state = state.copyWith(flashLightState: FlashLightState.on);
      } on EnableTorchExistentUserException catch (e) {
        // The camera is in use
        state = state.copyWith(
          errorMessage:
              'Flashlight is currently in use by another application.',
        );
      } on EnableTorchNotAvailableException catch (e) {
        // Torch was not detected
        state = state.copyWith(
          errorMessage: 'Flashlight is not available on this device.',
        );
      } on EnableTorchException catch (e) {
        // Torch could not be enabled due to another error
        state = state.copyWith(
          errorMessage:
              'An error occurred while trying to enable the flashlight.',
        );
      }
    }
  }

  Future<void> flashPattern(Duration duration) async {
    if (!state.isFlashlightSupported) {
      return;
    }

    await toggleFlashlight();

    await Future.delayed(duration);

    await toggleFlashlight();

    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> handlesosLight() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    // Example SOS pattern: 3 short flashes, 3 long flashes, 3 short flashes
    for (int i = 0; i < 3; i++) {
      await flashPattern(const Duration(milliseconds: 200)); // Short flash
    }
    for (int i = 0; i < 3; i++) {
      await flashPattern(const Duration(milliseconds: 600)); // Long flash
    }
    for (int i = 0; i < 3; i++) {
      await flashPattern(const Duration(milliseconds: 200)); // Short flash
    }
  }

  Future<void> toggleSosLight() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    if (state.lightMode != LightMode.sos) {
      await TorchLight.disableTorch();
      state = state.copyWith(flashLightState: FlashLightState.off);
      return;
    }

    while (state.lightMode == LightMode.sos) {
      await handlesosLight();
    }
  }

  Future<void> toggleDimLight() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    for (int i = 0; i < 3; i++) {
      // Example dim light pattern: 3 short flashes
      if (state.lightMode != LightMode.dimlight) {
        await TorchLight.disableTorch();
        state = state.copyWith(flashLightState: FlashLightState.off);
        return;
      }
      flashPattern(const Duration(milliseconds: 200));
    }
  }

  Future<void> toggleSunset() async {
    if (!state.isFlashlightSupported) {
      return;
    }

    for (int i = 0; i < 3; i++) {
      // Example dim light pattern: 3 short flashes
      if (state.lightMode != LightMode.sunset) {
        await TorchLight.disableTorch();
        state = state.copyWith(flashLightState: FlashLightState.off);
        return;
      }
      flashPattern(const Duration(milliseconds: 600));
    }
  }

  Future<void> setLightMode(LightMode mode) async {
    if (!state.isFlashlightSupported) {
      return;
    }

    state = state.copyWith(lightMode: mode);
  }

  Future<void> setColorMode(ColorMode mode) async {
    if (!state.isFlashlightSupported) {
      return;
    }

    state = state.copyWith(colorMode: mode);
  }
}

final torchProvider = NotifierProvider<TorchNotifier, TorchModel>(
  () => TorchNotifier(),
);
