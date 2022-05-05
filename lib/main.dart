import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/counter.dart';
import 'show_me_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp >> build');

    return MaterialApp(
      title: 'Named Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ChangeNotifierProvider<Counter>(
      //   create: (context) => Counter(),
      //   child: const MyHomePage(),
      // ),
      // routes: {
      //   '/': (context) => ChangeNotifierProvider.value(
      //         value: _counter,
      //         child: const MyHomePage(),
      //       ),
      //   '/counter': (context) => ChangeNotifierProvider.value(
      //         value: _counter,
      //         child: const ShowMeCounter(),
      //       ),
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const MyHomePage(),
              ),
            );
          case '/counter':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const ShowMeCounter(),
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                context.read<Counter>().increment();
              },
            )
          ],
        ),
      ),
    );
  }
}
