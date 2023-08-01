import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/counter_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('i m rebuild');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter : ',
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<CounterProvider>(
              builder: (context, obj, child) {
                // ignore: avoid_print
                print('text re build');
                return Text(obj.count.toString());
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Provider.of<CounterProvider>(context).increment();
          context.read<CounterProvider>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
