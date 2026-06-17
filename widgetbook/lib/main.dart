import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: const [],
      addons: [
        ViewportAddon([
          Viewports.none,
          ...IosViewports.all,
          ...AndroidViewports.all,
        ]),
        InspectorAddon(),
      ],
    );
  }
}
