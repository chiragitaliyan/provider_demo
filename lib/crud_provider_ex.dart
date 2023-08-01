import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/class_crud_provider.dart';

class CrudProvideEx extends StatefulWidget {
  const CrudProvideEx({super.key});

  @override
  State<CrudProvideEx> createState() => _CrudProvideExState();
}

class _CrudProvideExState extends State<CrudProvideEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Consumer<CrudProvider>(
        builder: (context, obj, child) => Column(
          children: [
            TextField(
              controller: obj.txtNameController,
              decoration: const InputDecoration(label: Text('Name')),
            ),
            TextField(
              controller: obj.txtDivController,
              decoration: const InputDecoration(label: Text('Div')),
            ),
            TextField(
              controller: obj.txtRollController,
              decoration: const InputDecoration(label: Text('Roll')),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<CrudProvider>(
                    builder: (context, obj, child) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Gender : '),
                            Radio(
                              value: obj.male,
                              groupValue: obj.gender,
                              onChanged: (value) {
                                context
                                    .read<CrudProvider>()
                                    .checkGender(value!);
                              },
                            ),
                            const Text('Male'),
                            Radio(
                              value: obj.female,
                              groupValue: obj.gender,
                              onChanged: (value) {
                                context
                                    .read<CrudProvider>()
                                    .checkGender(value!);
                              },
                            ),
                            const Text('Female')
                          ],
                        )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hobby:'),
                Selector<CrudProvider, bool>(
                    selector: (context, obj) => obj.isCricker,
                    builder: (context, isCricket, child) {
                      return Checkbox(
                        value: isCricket,
                        onChanged: (value) {
                          context.read<CrudProvider>().checkCricket(value!);
                        },
                      );
                    }),
                const Text('Cricket'),
                Selector<CrudProvider, bool>(
                    selector: (context, obj) => obj.isFootBall,
                    builder: (context, isFootball, child) => Checkbox(
                          value: isFootball,
                          onChanged: (value) {
                            context.read<CrudProvider>().checkFootBall(value!);
                          },
                        )),
                const Text('FootBall')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CrudProvider>(
                  builder: (context, obj, child) => Column(
                    children: [
                      DropdownButton(
                        hint: const Text('Streams'),
                        items: List.generate(
                            obj.streams.length,
                            (index) => DropdownMenuItem(
                                  value: obj.streams[index],
                                  child: Text(obj.streams[index].toString()),
                                )),
                        onChanged: (value) {
                          obj.selectedStream = value as String;
                          context.read<CrudProvider>().checkStream(value);
                        },
                        value: obj.selectedStream,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Age : '),
                Consumer<CrudProvider>(
                    builder: (context, obj, child) => Slider(
                          divisions: int.tryParse('10'),
                          min: 0,
                          max: 10,
                          value: obj.age,
                          onChanged: (value) {
                            obj.age = value;
                            context
                                .read<CrudProvider>()
                                .isslider(value.toInt());
                          },
                        ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Switch'),
                Consumer<CrudProvider>(
                    builder: (context, obj, child) => Switch(
                          value: obj.isSwitchOn,
                          onChanged: (value) {
                            obj.isSwitchOn = value;
                            context.read<CrudProvider>().isswitchOn(value);
                            context.read<CrudProvider>().isswitchOff(value);
                          },
                        ))
              ],
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                context.read<CrudProvider>().showData();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<CrudProvider>(
              builder: (context, obj, child) => obj.isShowData == true
                  ? Container(
                      padding: const EdgeInsets.all(25),
                      height: 200,
                      width: 200,
                      color: Colors.grey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('First Name: ${obj.txtNameController.text}'),
                          Text('Division: ${obj.txtDivController.text}'),
                          Text('Roll no: ${obj.txtRollController.text}'),
                          Text(obj.gender),
                          Text(obj.hobby.toString()),
                          Text(obj.selectedStream.toString()),
                          Text('Age: ${obj.age.toString()}'),
                          Text(
                            'Switch: ${obj.isSwitchOn}',
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 60),
          ],
        ),
      )
    ])));
  }
}
