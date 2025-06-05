import 'dart:async';

class AccecelorometerModel {
  double x;
  double y;
  double z;

  AccecelorometerModel({required this.x, required this.y, required this.z});

  factory AccecelorometerModel.fromJson(Map<String, dynamic> json) {
    return AccecelorometerModel(
      x: json['x']?.toDouble() ?? 0.0,
      y: json['y']?.toDouble() ?? 0.0,
      z: json['z']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y, 'z': z};
  }

  AccecelorometerModel copyWith({double? x, double? y, double? z}) {
    return AccecelorometerModel(x: x ?? this.x, y: y ?? this.y, z: z ?? this.z);
  }
}

class ShakeModelData {
  final int shakeCount;
  final DateTime? lastShakeTime;
  final Timer? shakeTimer;
  final bool isCooldownActive;

  ShakeModelData({
    required this.shakeCount,
    required this.lastShakeTime,
    required this.shakeTimer,
    required this.isCooldownActive,
  });

  ShakeModelData copyWith({
    int? shakeCount,
    DateTime? lastShakeTime,
    Timer? shakeTimer,
    bool? isCooldownActive,
  }) {
    return ShakeModelData(
      shakeCount: shakeCount ?? this.shakeCount,
      lastShakeTime: lastShakeTime ?? this.lastShakeTime,
      shakeTimer: shakeTimer ?? this.shakeTimer,
      isCooldownActive: isCooldownActive ?? this.isCooldownActive,
    );
  }
}
