import 'package:cince/cince.dart';

class RenderDebug extends StatelessWidget {
  const RenderDebug();

  @override
  String build(BuildContext context) {
    return Text(
      'RenderDebug(${context.parent.size})',
    ).build(context);
  }
}

class KeyboardDebug extends StatefulWidget {
  @override
  _KeyboardDebugState createState() => _KeyboardDebugState();
}

class _KeyboardDebugState extends State<KeyboardDebug> {
  String data = 'not detected';

  @override
  void initState() {
    context.keyboard.listen((event) {
      setState(() => data = event);
    });
  }

  @override
  String build(BuildContext context) {
    return Text(
      'KeyboardDebug($data)',
    ).build(context);
  }
}
