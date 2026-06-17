A new shared component was just created: $ARGUMENTS

Before starting read:
- @.claude/docs/conventions.md
- @.claude/docs/design-system.md

Steps:
1. Read the component file in lib/core/widgets/$ARGUMENTS.dart
2. Identify all props, variants, and states
3. Create widgetbook/lib/components/$ARGUMENTS_stories.dart with use cases for:
   - Default state
   - All prop variations
   - All enum variants
   - Error/disabled/loading states if they exist
   - Follow story file and component export conventions from conventions.md
4. Register it in widgetbook/lib/main.dart under the correct WidgetbookFolder
5. Run flutter analyze to confirm no errors

Story file must export a single `WidgetbookComponent` named `<camelCase>Component`.
Use only design system tokens (AppColor, FontSize, AppSpace etc.) — never hardcoded values.
