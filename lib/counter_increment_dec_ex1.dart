import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/counter_provider.dart';

class CounterIncrementDecreamentEx1Demo extends StatefulWidget {
  const CounterIncrementDecreamentEx1Demo({super.key});

  @override
  State<CounterIncrementDecreamentEx1Demo> createState() =>
      _CounterIncrementDecreamentEx1DemoState();
}

class _CounterIncrementDecreamentEx1DemoState
    extends State<CounterIncrementDecreamentEx1Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().decreament();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 20,
                ),
                Selector<CounterProvider, int>(
                  builder: (context, value, child) {
                    // ignore: avoid_print
                    print('count by 1');
                    return Text(value.toString());
                  },
                  selector: (context, obj) => obj.count,
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().increment();
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().decreament1();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 20,
                ),
                Selector<CounterProvider, int>(
                    builder: (context, value, child) {
                      // ignore: avoid_print
                      print('count by 2');
                      return Text(value.toString());
                    },
                    selector: (context, obj) => obj.count1),
                // Consumer<CounterProvider>(
                //   builder: (context, obj, child) {
                //     // ignore: avoid_print
                //     print('count by 2');
                //     return Text(obj.count1.toString());
                //   },
                // ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().increment1();
                  },
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
