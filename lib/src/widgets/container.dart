import 'package:cince/cince.dart';

class Container extends StatelessWidget {
  const Container({
    this.width,
    this.height,
    this.color,
    this.padding = const EdgeInsets(),
    this.child,
  });

  final num? width;
  final num? height;
  final ConsoleColor? color;
  final EdgeInsets padding;
  final StatelessWidget? child;

  @override
  String build(BuildContext context) {
    var renderChild = SizedBox(
      width: width,
      height: height,
      child: child == null
          ? null
          : Padding(
              padding: padding,
              child: child!,
            ),
    ).build(context);

    if (color != null) {
      return renderChild
          .split('\n')
          .map((e) =>
              ansiSetColor(ansiBackgroundColors[color]!) + e + ansiResetColor)
          .join('\n');
    }

    return renderChild.toString();
  }
}
