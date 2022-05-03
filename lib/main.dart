import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Dog dog10 = Dog(name: 'dog10', breed: 'breed10', age: 3);

  @override
  Widget build(BuildContext context) {
    debugPrint('Myapp >> build');

    return ChangeNotifierProvider<Dog>(
      create: (context) => dog10,
      child: MaterialApp(
        title: 'Provider 10 master',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('_MyHomePageState >> build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 10 master'),
      ),
      body: Selector<Dog, String>(
        selector: (context, Dog dog) => dog.name,
        builder: (context, String name, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                const SizedBox(height: 10.0),
                Text(
                  '- name: $name',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                const BreedAndAge(),
              ],
            ),
          );
        },
        child: const Text(
          'I like dogs very much',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('BreedAndAge >> build');

    return Selector<Dog, String>(
      selector: (context, Dog dog) => dog.breed,
      builder: (_, String breed, __) {
        return Column(
          children: [
            Text(
              '- breed: $breed',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            const Age(),
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Age >> build');

    return Selector<Dog, int>(
      selector: (context, Dog dog) => dog.age,
      builder: (_, int age, __) {
        return Column(
          children: [
            Text(
              // "context.watch<Dog>()" 하면 context 를 사용하므로
              // "debugPrint('Age >> build');" 출력함
              // '- age: ${context.watch<Dog>().age}',
              '- age: $age',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              // "context.read<Dog>()" 하면 context 를 사용하므로
              // "debugPrint('Age >> build');" 출력함
              // onPressed: () => context.read<Dog>().grow(),
              onPressed: () => context.read<Dog>().grow(),
              child: const Text(
                'Grow',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
