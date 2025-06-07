import 'package:flutter/material.dart';
import 'package:tourch_app/model/torch_model.dart';
import 'package:tourch_app/styles/app_custom_colors.dart';

Function handleBgColorByColorMode =
    (ColorMode colorMode) => (switch (colorMode) {
      ColorMode.base => AppCustomColors.defaultBgColor,
      ColorMode.yellow => AppCustomColors.defaulYellowtBgColor,
      ColorMode.blue => AppCustomColors.defaultBlueBgColor,
      ColorMode.green => AppCustomColors.defaultGreenBgColor,
    });
Function handleItemColorByColorMode =
    (ColorMode colorMode) => (switch (colorMode) {
      ColorMode.base => AppCustomColors.lampOfflightColor,
      ColorMode.yellow => AppCustomColors.lamponYellowlightColor,
      ColorMode.blue => AppCustomColors.lamponBluelightColor,
      ColorMode.green => AppCustomColors.lamponGreenlightColor,
    });

Function handleBlendModeByColorMode =
    (ColorMode colorMode, FlashLightState flashLightState) =>
        (switch (colorMode) {
          ColorMode.base =>
            (flashLightState == FlashLightState.off
                ? BlendMode.modulate
                : BlendMode.dstIn),
          ColorMode.yellow =>
            (flashLightState == FlashLightState.off
                ? BlendMode.dstIn
                : BlendMode.modulate),
          ColorMode.blue =>
            (flashLightState == FlashLightState.off
                ? BlendMode.dstIn
                : BlendMode.modulate),
          ColorMode.green =>
            (flashLightState == FlashLightState.off
                ? BlendMode.dstIn
                : BlendMode.modulate),
        });
