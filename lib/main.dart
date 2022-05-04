import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('-----------------------------------');
    debugPrint('MyApp >> build');

    return MaterialApp(
      title: 'Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
    debugPrint('===================================');
    debugPrint('MyHomePage >> build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.blue[100],
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'MyHomePage',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              const SizedBox(height: 20.0),
              const CounterA(),
              const SizedBox(height: 20.0),
              const Middle(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {
  const CounterA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('CounterA >> build');

    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            '${Provider.of<Counter>(context).counter}',
            style: const TextStyle(fontSize: 48.0),
          ),
          ElevatedButton(
            onPressed: Provider.of<Counter>(context).increment,
            child: const Text(
              'Increment',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Middle >> build');

    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          CounterB(),
          SizedBox(width: 20.0),
          Sibling(),
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  const CounterB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('CounterB >> build');

    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10.0),
      child: Text(
        // '${Provider.of<Counter>(context).counter}',
        '${context.watch<Counter>().counter}',
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Sibling >> build');

    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10.0),
      child: const Text(
        'Sibling',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
