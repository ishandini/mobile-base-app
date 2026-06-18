A new shared component was just created: $ARGUMENTS

Before starting read:
- @.claude/docs/conventions.md
- @.claude/docs/design-system.md

Steps:
1. Read the component file in `lib/core/widgets/$ARGUMENTS.dart`
2. Identify all props, variants, and states
3. Determine the category folder (buttons / inputs / cards / layout / other)
4. Create `widgetbook/lib/components/<category>/<component>_section.dart`:
   - Export a single `StatelessWidget` named `<ComponentName>Section`
   - `const` constructor with `super.key`
   - `build()` returns a `Column` with `CatalogVariantLabel` + widget variants
   - Cover: default state, all prop/enum variants, boolean flag combinations, disabled/loading/error states
   - Use only design system tokens (AppColor, FontSize, AppSpace etc.) — never hardcoded values
   - Do NOT use `const` on variants that require callbacks — pass `() {}` for onPressed etc.
5. Register in `widgetbook/lib/main.dart`:
   - Add import at the top
   - Add `CatalogSectionHeader(title: '<Category>')` if the category has no header yet
   - Add `<ComponentName>Section()` under that header
6. Run `flutter analyze widgetbook/lib/` — fix any errors before finishing

Section file template:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/<component_name>.dart';
import '../../catalog_section.dart';

class <ComponentName>Section extends StatelessWidget {
  const <ComponentName>Section({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CatalogVariantLabel('Default'),
        // default variant widget here
        const CatalogVariantLabel('Disabled'),
        // disabled variant widget here
      ],
    );
  }
}
```
