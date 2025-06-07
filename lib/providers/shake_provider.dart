import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/model/acceleometer_model.dart';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:tourch_app/providers/torch_provider.dart';

class ShakeNoifier extends Notifier<ShakeModelData> {
  @override
  ShakeModelData build() {
    startListening();

    // TODO: implement build
    return ShakeModelData(
      shakeCount: 0,
      lastShakeTime: null,
      shakeTimer: null,
      isCooldownActive: false,
    );
  }

  Stream<AccecelorometerModel> getaccecelorometerStream() {
    return accelerometerEventStream().map((event) {
      return AccecelorometerModel(x: event.x, y: event.y, z: event.z);
    });
  }

  double calculateAcceleration(AccecelorometerModel model) {
    return (model.x * model.x + model.y * model.y + model.z * model.z) /
        (9.8 * 9.8);
  }

  void handleShake() {
    final currentTime = DateTime.now();
    final timeSinceLastShake = currentTime.difference(
      state.lastShakeTime ?? DateTime.fromMillisecondsSinceEpoch(0),
    );

    if (state.isCooldownActive || timeSinceLastShake.inSeconds < 1) {
      return; // Ignore shake if cooldown is active or not enough time has passed
    }

    final newShakeCount = state.shakeCount + 1;

    if (newShakeCount == 1) {
      state = state.copyWith(
        shakeCount: newShakeCount,
        lastShakeTime: currentTime,
        isCooldownActive: false,
      );
    } else if (newShakeCount == 2) {
      state = state.copyWith(
        shakeCount: newShakeCount,
        lastShakeTime: currentTime,
        isCooldownActive: true,
      );
      // Trigger flashlight toggle or any other action
      ref.read(torchProvider.notifier).toggleFlashlight();

      // Optional: cooldown for X seconds
      Future.delayed(const Duration(seconds: 1), () {
        state = state.copyWith(isCooldownActive: false);
      });
    } else {
      state = state.copyWith(
        shakeCount: 0,
        lastShakeTime: currentTime,
        isCooldownActive: false,
      );
    }
  }

  void startListening() {
    getaccecelorometerStream().listen((accecelorometerModel) {
      final acceleration = calculateAcceleration(accecelorometerModel);

      if (acceleration > 2 && !state.isCooldownActive) {
        // Adjust threshold as needed
        handleShake();
      }
    });
  }
}

final shakeProvider = NotifierProvider<ShakeNoifier, ShakeModelData>(
  () => ShakeNoifier(),
);
