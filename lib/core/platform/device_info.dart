import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DeviceInfo {
  DeviceInfo._();

  static DeviceType deviceType(BuildContext context) {
    if (kIsWeb) {
      return DeviceType.web;
    } else if (Platform.isIOS || Platform.isAndroid) {
      if (context.isPhone) {
        return DeviceType.phone;
      } else {
        return DeviceType.tablet;
      }
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return DeviceType.desktop;
    }
    return DeviceType.phone;
  }
}

enum DeviceType { phone, tablet, desktop, web }

extension DeviceTypeExt on DeviceType {
  bool get isPhone => this == DeviceType.phone;

  bool get isTablet => this == DeviceType.tablet;

  bool get isDesktop => this == DeviceType.desktop;

  bool get isWeb => this == DeviceType.web;
}
