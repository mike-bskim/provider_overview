import 'package:flutter/material.dart';

import 'pages/chgnotiprov_chgnotiproxyprov.dart';
import 'pages/chgnotiprov_proxyprov.dart';
import 'pages/proxyprov_create_update.dart';
import 'pages/proxyprov_proxyprov.dart';
import 'pages/proxyprov_update.dart';
import 'pages/why_proxyprov.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProxyProvider Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    debugPrint('${_size.width} ${_size.height}');

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0.0, 60.0)),
                child: const Text(
                  'Why\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WhyProxyProv(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0.0, 60.0)),
                child: const Text(
                  'ProxyProvider\nupdate',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProvUpdate(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0.0, 60.0)),
                child: const Text(
                  'ProxyProvider\ncreate/update',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProvCreateUpdate(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0.0, 60.0)),
                child: const Text(
                  'ProxyProvider\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProvProxyProv(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0.0, 60.0)),
                child: const Text(
                  'ChangeNotifierProvider\nChangeNotifierProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChgNotiProvChgNotiProxyProv(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0.0, 60.0)),
                child: const Text(
                  'ChangeNotifierProvider\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChgNotiProvProxyProv(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
