import 'dart:math';

import 'package:cince/cince.dart';

enum MainAxisSize {
  min,
  max,
}

enum MainAxisAlignment {
  start,
  end,
  center,
}

enum CrossAxisAlignment {
  start,
  end,
  center,
}

class Column extends StatelessWidget {
  const Column({
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    required this.children,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final List<Widget> children;

  @override
  String build(BuildContext context) {
    var renderedChildren =
        children.map((e) => e.build(context)).join('\n').split('\n');

    if (mainAxisSize == MainAxisSize.max) {
      renderedChildren = _verticalFlexAdaptation(
        context.parent.size.height,
        renderedChildren,
      );
    }

    var renderObject = RenderObject(
      size: Size(
        renderedChildren.map((e) => e.length).reduce(max),
        renderedChildren.length,
      ),
    );

    var result = children
        .map((e) => e.build(context.copyWith(parent: renderObject)))
        .join('\n')
        .split('\n');

    if (mainAxisSize == MainAxisSize.max) {
      result = _verticalFlexAdaptation(
        context.parent.size.height,
        result,
      );
    }

    return result.map<String>((text) {
      switch (crossAxisAlignment) {
        case CrossAxisAlignment.center:
          final padding =
              ((context.parent.size.width - text.length) / 2).round();
          return text
              .padLeft(text.length + padding)
              .padRight(context.parent.size.width);

        case CrossAxisAlignment.end:
          return text.padLeft(context.parent.size.width);
        default:
          return text.padRight(context.parent.size.width);
      }
    }).join('\n');
  }

  List<String> _verticalFlexAdaptation(
    int columnHeight,
    List<String> children,
  ) {
    if (mainAxisAlignment == MainAxisAlignment.start) {
      return children +
          List.generate(columnHeight - children.length - 1, (index) => '');
    }

    if (mainAxisAlignment == MainAxisAlignment.center) {
      return List.generate(
              (columnHeight - children.length) ~/ 2, (index) => '') +
          children +
          List.generate(
              (columnHeight - children.length) ~/ 2 - 1, (index) => '');
    }

    if (mainAxisAlignment == MainAxisAlignment.end) {
      return List.generate(columnHeight - children.length - 1, (index) => '') +
          children;
    }

    if (mainAxisAlignment == MainAxisAlignment.center) {
      return List.generate(
              (columnHeight - children.length) ~/ 2, (index) => '') +
          children +
          List.generate(
              (columnHeight - children.length) ~/ 2 - 1, (index) => '');
    }
    return children;
  }
}
