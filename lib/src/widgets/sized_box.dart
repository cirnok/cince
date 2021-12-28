import 'package:cince/cince.dart';

class SizedBox extends StatelessWidget {
  const SizedBox({
    this.width,
    this.height,
    this.child,
  });

  final num? width;
  final num? height;
  final StatelessWidget? child;

  @override
  String build(BuildContext context) {
    int? widthResult =
        ((width != double.infinity ? width : context.parent.size.width) ?? -1)
            .toInt();
    int? heightResult =
        ((height != double.infinity ? height : context.parent.size.height) ??
                -1)
            .toInt();

    widthResult = widthResult < 0 ? context.parent.size.width : widthResult;
    heightResult = heightResult < 0 ? context.parent.size.height : heightResult;

    if (child != null) {
      return child!.build(
        context.copyWith(
          parent: RenderObject(
            size: Size(
              widthResult,
              heightResult,
            ),
          ),
        ),
      );
    } else {
      var result = StringBuffer();
      for (var i = 0; i < heightResult; i++) {
        if (i != 0) result.writeln();
        for (var i = 0; i < widthResult; i++) {
          result.write(' ');
        }
      }

      return result.toString();
    }
  }
}
