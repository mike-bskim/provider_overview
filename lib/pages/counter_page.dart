import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int myCounter = 0;

  @override
  void initState() {
    super.initState();
    // after the current frame is completed, execute callback
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<Counter>().increment();
      myCounter = context.read<Counter>().counter + 10;
    });
    // Future.delayed(const Duration(seconds: 0), () {
    //   context.read<Counter>().increment();
    //   myCounter = context.read<Counter>().counter + 10;
    // });
    // Future.microtask(() {
    //   context.read<Counter>().increment();
    //   myCounter = context.read<Counter>().counter + 10;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'counter: ${context.watch<Counter>().counter}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40.0),
            ),
            Text(
              'myCounter: $myCounter',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                myCounter = 10;
                context.read<Counter>().update(0);
              },
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
    );
  }
}
