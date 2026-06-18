import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/data_base/database_helper.dart';
import 'package:flutter_app_template/core/di/injection.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_bloc.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_event.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_state.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import component sections here as they are created, e.g.:
// import 'components/buttons/primary_button_section.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.init();
  await configureDependencies();
  runApp(const CatalogApp());
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ColorBloc>()..add(const SyncColorsEvt()),
        ),
        BlocProvider(create: (_) => sl<ThemeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Component Catalog',
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, colorState) {
            if (colorState is! ColorLoaded) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            return const CatalogPage();
          },
        ),
      ),
    );
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  // Add entries to this list as components are created. Example:
  //   const CatalogSectionHeader(title: 'Buttons'),
  //   const PrimaryButtonSection(),
  //   const CatalogSectionHeader(title: 'Inputs'),
  //   const TextFieldSection(),
  List<Widget> _sections() => [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Component Catalog')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: _sections(),
      ),
    );
  }
}
