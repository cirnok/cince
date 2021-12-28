import 'package:cince/cince.dart';

abstract class Widget {
  const Widget();
  String build(BuildContext context);
}

@immutable
abstract class StatelessWidget extends Widget {
  const StatelessWidget();
}

abstract class StatefulWidget extends Widget {
  @protected
  State? _currentState;

  @protected
  @override
  String build(BuildContext context) {
    if (_currentState == null) {
      _currentState = createState();
      _currentState!._context = context;
      _currentState!._widget = this;
      _currentState!.initState();
    }

    return _currentState!.build(context);
  }

  State createState();
}

abstract class State<T extends StatefulWidget> {
  BuildContext get context => _context!;
  BuildContext? _context;

  T get widget => _widget!;
  T? _widget;

  void initState() {}

  @protected
  void setState(void Function() function) {
    function();
    context.consoleRender.update();
  }

  String build(BuildContext context);
}

class BuildContext {
  BuildContext({
    required this.parent,
    required this.consoleRender,
    required this.keyboard,
  });

  RenderObject parent;
  final ConsoleRender consoleRender;
  final Stream<String> keyboard;

  BuildContext copyWith({
    RenderObject? parent,
  }) {
    return BuildContext(
      parent: parent ?? this.parent,
      consoleRender: consoleRender,
      keyboard: keyboard,
    );
  }
}

@immutable
class RenderObject {
  RenderObject({required this.size});

  final Size size;
}

@immutable
class Size {
  Size(this.width, this.height);

  final int width;
  final int height;

  Size copyWith({
    int? width,
    int? height,
  }) {
    return Size(
      width ?? this.height,
      height ?? this.height,
    );
  }

  @override
  String toString() {
    return 'Size($width, $height)';
  }
}
