import 'package:cince/cince.dart';

class Text extends StatelessWidget {
  const Text(this.content);

  final String content;

  @override
  String build(BuildContext context) {
    return content;
  }
}
