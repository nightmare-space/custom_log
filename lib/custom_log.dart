library custom_log;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:termare_view/termare_view.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class Log {
  static StringBuffer _buffer = StringBuffer();
  static v(Object object) {
    String data = '\x1B[1;40;37m $object \x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    print(data);
  }

  static d(Object object) {
    String data = '\x1B[1;44;37m $object \x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    print(data);
  }

  static i(Object object) {
    String data = '\x1B[1;44;37m $object \x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    print(data);
  }

  static w(Object object) {
    String data = '\x1B[1;43;37m $object \x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    print(data);
  }

  static e(Object object) {
    String data = '\x1B[1;41;37m $object \x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    print(data);
  }

  static void showLogView(BuildContext context) {
    TermareController controller = TermareController(
      theme: TermareStyles.termux.copyWith(
        cursorColor: Colors.transparent,
      ),
    );
    final Size size = window.physicalSize;
    final double screenWidth = size.width / window.devicePixelRatio;
    double screenHeight = size.height / window.devicePixelRatio;
    controller.setPtyWindowSize(
      Size(screenWidth, screenHeight),
    );
    controller.write(_buffer.toString());
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return TermareView(
          controller: controller,
        );
      }),
    );
  }
}

void main() {
  Log.d('Debug log');
  Log.i('Info log');
  Log.w('Warning log');
  Log.e('Error log');
  Log.v('Verbose log');
}
