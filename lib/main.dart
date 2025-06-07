import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tourch_app/pages/home_screen.dart';
import 'package:tourch_app/styles/app_theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return ShadApp.custom(
      appBuilder: (context, theme) {
        return MaterialApp(
          title: 'Flashlight by Sachin',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: HomeScreen(),
          builder: (context, child) {
            return child!;
          },
        );
      },
    );
  }
}
