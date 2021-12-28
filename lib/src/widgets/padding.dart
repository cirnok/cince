import 'package:cince/cince.dart';

class Padding extends StatelessWidget {
  const Padding({
    required this.padding,
    required this.child,
  });

  final EdgeInsets padding;
  final StatelessWidget child;

  @override
  String build(BuildContext context) {
    var renderChild = child.build(context);
    var result = StringBuffer();

    for (var i = 0; i < padding.top; i++) {
      for (var i = 0;
          i < padding.left + renderChild.length + padding.right;
          i++) {
        result.write(' ');
      }
      result.write('\n');
    }

    result.write((' ' * padding.left) + renderChild + ' ' * padding.right);

    for (var i = 0; i < padding.bottom; i++) {
      result.write('\n');
      for (var i = 0;
          i < padding.left + renderChild.length + padding.right;
          i++) {
        result.write(' ');
      }
    }

    var text = result.toString();

    return text;
  }
}

class EdgeInsets {
  const EdgeInsets({
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
  });

  final int left;
  final int top;
  final int right;
  final int bottom;

  factory EdgeInsets.all(int value) {
    return EdgeInsets(
      left: value,
      right: value,
      top: value,
      bottom: value,
    );
  }
}
