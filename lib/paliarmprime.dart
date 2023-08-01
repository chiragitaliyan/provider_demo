import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/paliarmprime_provider.dart';

class CheckNumber extends StatefulWidget {
  const CheckNumber({super.key});

  @override
  State<CheckNumber> createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<CheckNumberProvider>(
                builder: (context, obj, child) => TextField(
                  controller: obj.txtNumbersController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: Text('Please enter Number')),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<CheckNumberProvider>(
                builder: (context, obj, child) => MaterialButton(
                  onPressed: () {
                    context
                        .read<CheckNumberProvider>()
                        .palindrom(int.parse(obj.txtNumbersController.text));
                  },
                  color: Colors.blue,
                  child: const Text(' Check palindrom nummber'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<CheckNumberProvider>(
                builder: (context, obj, child) => MaterialButton(
                  onPressed: () {
                    context
                        .read<CheckNumberProvider>()
                        .amstrong(int.parse(obj.txtNumbersController.text));
                  },
                  color: Colors.blue,
                  child: const Text('Check amstrong number'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<CheckNumberProvider>(
                builder: (context, obj, child) => MaterialButton(
                  onPressed: () {
                    context
                        .read<CheckNumberProvider>()
                        .prime(int.parse(obj.txtNumbersController.text));
                  },
                  color: Colors.blue,
                  child: const Text('check prime number'),
                ),
              ),
              Consumer<CheckNumberProvider>(
                builder: (context, obj, child) => Column(
                  children: [
                    Text(obj.resultpalindrom),
                    Text(obj.resultamstrong),
                    Text(obj.resultprinme),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
