import 'package:cince/cince.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.selected,
  });

  final String text;
  final bool selected;

  @override
  String build(BuildContext context) {
    if (selected) {
      return '> [$text] <';
    } else {
      return '  [$text]  ';
    }
  }
}

class ButtonItem {
  const ButtonItem(this.text, this.onSelected);

  final String text;
  final void Function() onSelected;
}
