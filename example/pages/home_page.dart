import 'dart:io';

import 'package:cince/cince.dart';

import '../widgets/game_logo.dart';

class HomePage extends Page {
  const HomePage();

  @override
  Widget render(PageContext context) {
    return KeyboardHandler(
      onEvent: (data) {
        if (data == KeyCode.esc) exit(0);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GameLogo(),
          Padding(
            padding: EdgeInsets(top: 1, bottom: 2),
            child: Text('version 1.0.0'),
          ),
          GameMenu(),
        ],
      ),
    );
  }
}

class GameMenu extends StatefulWidget {
  @override
  _GameMenuState createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  late List<ButtonItem> variants;

  var counter = 0;
  var selectedIndex = LimitedInt(0, min: 0, max: 1);

  @override
  void initState() {
    variants = [
      ButtonItem('Добавить', () => counter++),
      ButtonItem('Убрать', () => counter--),
    ];

    context.keyboard.listen((event) {
      setState(() {
        if (event == KeyCode.up) {
          selectedIndex--;
        } else if (event == KeyCode.down) {
          selectedIndex++;
        } else if ([KeyCode.space, KeyCode.enter].contains(event)) {
          variants[selectedIndex()].onSelected();
        }
      });
    });
  }

  @override
  String build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
            Text('Счетчик: $counter'),
          ] +
          List.generate(
            variants.length,
            (index) => Button(
              text: variants[index].text,
              selected: index == selectedIndex(),
            ),
          ),
    ).build(context);
  }
}
