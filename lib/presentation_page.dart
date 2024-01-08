import 'package:core_components/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key, required this.title});

  final String title;

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Switch(
              value: Provider.of<ThemeModel>(context).currentTheme == ThemeData.light(),
              onChanged: (value) {
                Provider.of<ThemeModel>(context, listen: false).toggleTheme();
              },
            ),
            const Text('Dark Mode'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
