import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 09 master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class Foo with ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('_MyHomePageState >> build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 09 master'),
      ),
      body: ChangeNotifierProvider<Foo>(
        create: (_) {
          return Foo();
        },
        child: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'value: ${context.watch<Foo>().value}',
                    style: const TextStyle(fontSize: 40.0),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<Foo>().changeValue();
                    },
                    child: const Text(
                      'Change value',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
