import 'package:cince/cince.dart';

class AutoCounter extends StatefulWidget {
  @override
  _AutoCounterState createState() => _AutoCounterState();
}

class _AutoCounterState extends State<AutoCounter> {
  int value = 0;

  @override
  void initState() {}

  @override
  String build(BuildContext context) {
    return Container(
      child: Text(value.toString()),
    ).build(context);
  }
}
