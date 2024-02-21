import 'package:fire_core_components/src/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sample/navigation_controller_sample.dart';
import 'sample/page_content_builder_impl.dart';


Future<void> main() async {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeModel()),
            ChangeNotifierProvider(create: (context) => PageContentBuilderImpl())
          ],
          builder: ((context, child) => MyApp())
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FIRE Core Components',
        theme: Provider.of<ThemeModel>(context).currentTheme,
        home: SafeArea(child: NavigationControllerSample())
    );
  }
}