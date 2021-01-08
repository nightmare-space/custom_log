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
    String data = '\x1B[1;40;37m $object \x1B[0m\n';
    _buffer.write(data);
    print(data);
  }

  static d(Object object) {
    String data = '\x1B[1;34m $object \x1B[0m';
    _buffer.write(data);
    print(data);
  }

  static i(Object object) {
    String data = '\x1B[1;42;37m $object \x1B[0m\n';
    _buffer.write(data);
    print(data);
  }

  static w(Object object) {
    String data = '\x1B[1;43;37m $object \x1B[0m\n';
    _buffer.write(data);
    print(data);
  }

  static e(Object object) {
    String data = '\x1B[1;41;37m $object \x1B[0m';
    _buffer.write(data);
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
