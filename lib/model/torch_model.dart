enum FlashLightState { on, off, auto }

enum LightMode { sos, flashlight, dimlight, sunset }

enum ColorMode { base, yellow, blue, green }

class TorchModel {
  final FlashLightState flashLightState;
  final bool isFlashlightSupported;
  final String errorMessage;
  final LightMode lightMode;
  final ColorMode colorMode;

  TorchModel({
    required this.flashLightState,
    required this.isFlashlightSupported,
    required this.errorMessage,
    required this.lightMode,
    required this.colorMode,
  });

  TorchModel copyWith({
    FlashLightState? flashLightState,
    bool? isFlashlightSupported,
    String? errorMessage,
    LightMode? lightMode,
    ColorMode? colorMode,
  }) {
    return TorchModel(
      flashLightState: flashLightState ?? this.flashLightState,
      isFlashlightSupported:
          isFlashlightSupported ?? this.isFlashlightSupported,
      errorMessage: errorMessage ?? this.errorMessage,
      lightMode: lightMode ?? this.lightMode,
      colorMode: colorMode ?? this.colorMode,
    );
  }
}
