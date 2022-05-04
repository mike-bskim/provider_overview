import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Counter with ChangeNotifier {
  String titleCounterA = 'Counter A';
  String titleCounterB = 'Counter B';
  String titleMiddle = 'Middle';
  String titleSibling = 'Sibling';

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
    debugPrint('MyHomePage >> build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: Center(
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('MyHomePage', style: TextStyle(fontSize: 24.0)),
                SizedBox(height: 20.0),
                CounterA(),
                SizedBox(height: 20.0),
                Middle(),
              ],
            ),
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
    debugPrint('===================================');
    debugPrint('CounterA >> build');

    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(Provider.of<Counter>(context).titleCounterA),
          Text(
            '${Provider.of<Counter>(context).counter}',
            style: const TextStyle(fontSize: 48.0),
          ),
          ElevatedButton(
            onPressed: Provider.of<Counter>(context, listen: false).increment,
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
      child: Column(
        children: [
          // Text(Provider.of<Counter>(context, listen: false).titleMiddle),
          Text(context.read<Counter>().titleMiddle),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              CounterB(),
              SizedBox(width: 20.0),
              Sibling(),
            ],
          ),
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

    return Consumer<Counter>(
      builder: (BuildContext context, Counter cnt, Widget? child) {
        return Container(
          color: Colors.yellow[100],
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(Provider.of<Counter>(context).titleCounterB),
              Text(
                // '${Provider.of<Counter>(context).counter}',
                // '${context.watch<Counter>().counter}',
                '${cnt.counter}',
                style: const TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Sibling >> build');

    return Consumer<Counter>(
      builder: (BuildContext context, Counter cnt, Widget? child) {
        return Container(
          color: Colors.orange[100],
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Text(Provider.of<Counter>(context).titleSibling),
              // Text(Provider.of<Counter>(context, listen: false).titleSibling),
              // Text(context.read<Counter>().titleSibling),
              Text(cnt.titleSibling),
              const Text(
                'Sibling',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
