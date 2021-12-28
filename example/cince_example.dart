import 'package:cince/cince.dart';

import 'pages/home_page.dart';

void main() {
  ConsoleApp(
    printDelay: Duration(milliseconds: 10),
    routes: {
      '/': HomePage(),
    },
    initialRoute: '/',
  ).start();
}
