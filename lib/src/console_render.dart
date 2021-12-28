import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cince/cince.dart';

class ConsoleRender {
  ConsoleRender({this.printDelay = Duration.zero});
  final Duration printDelay;

  final Console _console = Console()..rawMode = true;
  Widget? _currentPage;

  Stream<String>? __keyboardStream;
  Stream<String> get _keyboardStream {
    __keyboardStream ??= stdin.transform(utf8.decoder).asBroadcastStream();

    return __keyboardStream!;
  }

  void clearScreen() {
    _console.clearScreen();
    _console.resetCursorPosition();
  }

  void render(Page page) {
    clearScreen();
    _console.hideCursor();

    _currentPage = page.render(
      PageContext(
        screenSize: Size(
          _console.windowWidth,
          _console.windowHeight,
        ),
      ),
    );

    update();
  }

  void update() {
    if (_currentPage == null) {
      throw Exception(); // todo
    }

    _console.resetCursorPosition();

    var text = _currentPage!.build(
      BuildContext(
        consoleRender: this,
        keyboard: _keyboardStream,
        parent: RenderObject(
          size: Size(
            _console.windowWidth,
            _console.windowHeight,
          ),
        ),
      ),
    );

    for (var line in text.split('\n')) {
      _console.writeLine(line);
      sleep(printDelay);
    }
  }
}

abstract class KeyCode {
  static const String ansiEscape = '\x1b[';

  static const String up = '${ansiEscape}A';
  static const String down = '${ansiEscape}B';
  static const String right = '${ansiEscape}C';
  static const String left = '${ansiEscape}D';

  static const String home = '${ansiEscape}H';
  static const String end = '${ansiEscape}F';

  static const String f1 = '${ansiEscape}M';
  static const String f2 = '${ansiEscape}N';
  static const String f3 = '${ansiEscape}O';
  static const String f4 = '${ansiEscape}P';
  static const String f5 = '${ansiEscape}Q';
  static const String f6 = '${ansiEscape}R';
  static const String f7 = '${ansiEscape}S';
  static const String f8 = '${ansiEscape}T';
  static const String f9 = '${ansiEscape}U';
  static const String f10 = '${ansiEscape}V';
  static const String f11 = '${ansiEscape}W';
  static const String f12 = '${ansiEscape}X';

  static const String ins = '${ansiEscape}2~';
  static const String del = '${ansiEscape}3~';
  static const String pageUp = '${ansiEscape}5~';
  static const String pageDown = '${ansiEscape}6~';

  static const String space = ' ';

  static const String esc = '\u001b';
  static const String enter = '\u000a';
}
