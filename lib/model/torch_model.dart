enum FlashLightState { on, off, auto }

enum LightMode { sos, flashlight, dimlight, sunset }

class TorchModel {
  final FlashLightState flashLightState;
  final bool isFlashlightSupported;
  final String errorMessage;
  final LightMode lightMode;

  TorchModel({
    required this.flashLightState,
    required this.isFlashlightSupported,
    required this.errorMessage,
    required this.lightMode,
  });

  TorchModel copyWith({
    FlashLightState? flashLightState,
    bool? isFlashlightSupported,
    String? errorMessage,
    LightMode? lightMode,
  }) {
    return TorchModel(
      flashLightState: flashLightState ?? this.flashLightState,
      isFlashlightSupported:
          isFlashlightSupported ?? this.isFlashlightSupported,
      errorMessage: errorMessage ?? this.errorMessage,
      lightMode: lightMode ?? this.lightMode,
    );
  }
}
