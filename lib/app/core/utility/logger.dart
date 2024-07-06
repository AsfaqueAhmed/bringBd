import 'dart:convert';
import 'dart:developer';

import 'package:bring_me_bd/env.dart';
import 'package:flutter/foundation.dart';

abstract class Logger {
  static printLog(dynamic message) {
    if (kDebugMode || !EnvConfig.isProduction) {
      if (message is String) {
        log(message);
      } else if (message is Map || message is List) {
        try {
          log(jsonEncode(message));
        } catch (e, s) {
          if (kDebugMode) {
            print(e);
            print(s);
          }
        }
      } else if (message is StackTrace) {
        if (kDebugMode) {
          print(message);
        }
      } else {
        log(message.toString());
      }
    }
  }
}
