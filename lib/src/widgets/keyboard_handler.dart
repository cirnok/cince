import 'package:cince/cince.dart';

class KeyboardHandler extends StatefulWidget {
  KeyboardHandler({
    required this.onEvent,
    required this.child,
  });

  final void Function(String data) onEvent;
  final Widget child;

  @override
  _KeyboardHandlerState createState() => _KeyboardHandlerState();
}

class _KeyboardHandlerState extends State<KeyboardHandler> {
  @override
  void initState() {
    context.keyboard.listen(widget.onEvent);
  }

  @override
  String build(BuildContext context) {
    return widget.child.build(context);
  }
}
