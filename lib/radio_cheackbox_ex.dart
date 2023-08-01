import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/radio_cheackbox_provider.dart';

class RadioCheckBoxEx extends StatefulWidget {
  const RadioCheckBoxEx({super.key});

  @override
  State<RadioCheckBoxEx> createState() => _RadioCheckBoxExState();
}

class _RadioCheckBoxExState extends State<RadioCheckBoxEx> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('I am Re-Build');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<RadioCheckBoxProvider>(
                builder: (context, obj, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Gender : '),
                        Radio(
                          value: obj.male,
                          groupValue: obj.gender,
                          onChanged: (value) {
                            context
                                .read<RadioCheckBoxProvider>()
                                .checkGender(value!);
                          },
                        ),
                        const Text('Male'),
                        Radio(
                          value: obj.female,
                          groupValue: obj.gender,
                          onChanged: (value) {
                            context
                                .read<RadioCheckBoxProvider>()
                                .checkGender(value!);
                          },
                        ),
                        const Text('Female')
                      ],
                    )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hobby:'),
                Selector<RadioCheckBoxProvider, bool>(
                    selector: (context, obj) => obj.isCricket,
                    builder: (context, isCricket, child) {
                      return Checkbox(
                        value: isCricket,
                        onChanged: (value) {
                          context
                              .read<RadioCheckBoxProvider>()
                              .checkCricket(value!);
                        },
                      );
                    }),
                const Text('Cricket'),
                Selector<RadioCheckBoxProvider, bool>(
                    selector: (context, obj) => obj.isFootBall,
                    builder: (context, isFootball, child) => Checkbox(
                          value: isFootball,
                          onChanged: (value) {
                            context
                                .read<RadioCheckBoxProvider>()
                                .checkFootball(value!);
                          },
                        )),
                const Text('FootBall')
              ],
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                context.read<RadioCheckBoxProvider>().showData();
              },
              child: const Text('Submit'),
            ),
            Consumer<RadioCheckBoxProvider>(
              builder: (context, obj, child) => obj.isShowData == true
                  ? Container(
                      height: 200,
                      width: 200,
                      color: Colors.cyan,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(obj.gender),
                          Text(obj.hobby.toString()),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
