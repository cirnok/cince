import 'package:cince/cince.dart';

abstract class Page {
  const Page();

  Widget render(PageContext context);
}

@immutable
class PageContext {
  const PageContext({required this.screenSize});

  final Size screenSize;
}
