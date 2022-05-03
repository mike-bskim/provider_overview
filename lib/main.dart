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
  final Dog dog08 = Dog(name: 'dog08', breed: 'breed08', age: 3);

  @override
  Widget build(BuildContext context) {
    debugPrint('Myapp >> build');

    return ChangeNotifierProvider<Dog>(
      create: (context) => dog08,
      child: MaterialApp(
        title: 'Provider 08 master',
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
        title: const Text('Provider 08 master'),
      ),
      body: Consumer<Dog>(
        builder: (context, Dog dog, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                const SizedBox(height: 10.0),
                Text(
                  '- name: ${dog.name}',
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

    return Consumer(builder: (_, Dog dog, __){
      return Column(
        children: [
          Text(
            '- breed: ${dog.breed}',
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 10.0),
          const Age(),
        ],
      );
    });
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Age >> build');

    return Consumer(builder: (_, Dog dog, __) {
      return Column(
        children: [
          Text(
            // "context.watch<Dog>()" 하면 context 를 사용하므로
            // "debugPrint('Age >> build');" 출력함
            // '- age: ${context.watch<Dog>().age}',
            '- age: ${dog.age}',
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            // "context.read<Dog>()" 하면 context 를 사용하므로
            // "debugPrint('Age >> build');" 출력함
            // onPressed: () => context.read<Dog>().grow(),
            onPressed: () => dog.grow(),
            child: const Text(
              'Grow',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      );
    });
  }
}
