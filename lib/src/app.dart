import 'dart:io';

import 'package:cince/cince.dart';

@immutable
class ConsoleApp {
  const ConsoleApp({
    required this.routes,
    required this.initialRoute,
    this.printDelay = Duration.zero,
  });

  final Map<String, Page> routes;
  final String initialRoute;
  final Duration printDelay;

  void start() {
    if (bool.fromEnvironment('dart.vm.product')) {
      stdin.echoMode = false;
      stdin.lineMode = false;
    }

    var console = ConsoleRender(printDelay: printDelay);
    console.render(routes[initialRoute]!);
  }
}
