import 'package:fire_core_components/src/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sample/navigation_controller_sample.dart';
import 'sample/page_content_builder_impl.dart';


void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeModel()),
            ChangeNotifierProvider(create: (context) => PageContentBuilderImpl())
          ],
          builder: ((context, child) => const MyApp())
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeModel>(context).currentTheme,
        // home: const PresentationPage(title: 'Flutter Demo Home Page'),
        home: const SafeArea(child: NavigationControllerSample())
    );
  }
}