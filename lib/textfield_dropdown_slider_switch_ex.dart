import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/textfield_dropdown_slider_switch_provider.dart';

class TextFieldDropDownSliderSwitchEx extends StatefulWidget {
  const TextFieldDropDownSliderSwitchEx({super.key});

  @override
  State<TextFieldDropDownSliderSwitchEx> createState() =>
      _TextFieldDropDownSliderSwitchExState();
}

class _TextFieldDropDownSliderSwitchExState
    extends State<TextFieldDropDownSliderSwitchEx> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('I am Re-Build');
    return Scaffold(
        body: Center(
            child: Column(children: [
      Consumer<TextFieldDropDownSliderSwitchProvider>(
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
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<TextFieldDropDownSliderSwitchProvider>(
                    builder: (context, obj, child) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Gender : '),
                            Radio(
                              value: obj.male,
                              groupValue: obj.gender,
                              onChanged: (value) {
                                context
                                    .read<
                                        TextFieldDropDownSliderSwitchProvider>()
                                    .checkGender(value!);
                              },
                            ),
                            const Text('Male'),
                            Radio(
                              value: obj.female,
                              groupValue: obj.gender,
                              onChanged: (value) {
                                context
                                    .read<
                                        TextFieldDropDownSliderSwitchProvider>()
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
                Selector<TextFieldDropDownSliderSwitchProvider, bool>(
                    selector: (context, obj) => obj.isCricket,
                    builder: (context, isCricket, child) {
                      return Checkbox(
                        value: isCricket,
                        onChanged: (value) {
                          context
                              .read<TextFieldDropDownSliderSwitchProvider>()
                              .checkCricket(value!);
                        },
                      );
                    }),
                const Text('Cricket'),
                Selector<TextFieldDropDownSliderSwitchProvider, bool>(
                    selector: (context, obj) => obj.isFootBall,
                    builder: (context, isFootball, child) => Checkbox(
                          value: isFootball,
                          onChanged: (value) {
                            context
                                .read<TextFieldDropDownSliderSwitchProvider>()
                                .checkFootball(value!);
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
                Consumer<TextFieldDropDownSliderSwitchProvider>(
                  builder: (context, obj, child) => Column(
                    children: [
                      DropdownButton(
                        hint: const Text('Streams'),
                        items: List.generate(
                            obj.streams.length,
                            (index) => DropdownMenuItem(
                                  value: obj.streams[index],
                                  child: Text(obj.streams[index]),
                                )),
                        onChanged: (value) {
                          obj.selectedStream = value.toString();
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
                Consumer<TextFieldDropDownSliderSwitchProvider>(
                    builder: (context, obj, child) => Slider(
                          divisions: int.tryParse('10'),
                          min: 0,
                          max: 10,
                          value: obj.age,
                          onChanged: (value) {
                            obj.age = value;
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
                Consumer<TextFieldDropDownSliderSwitchProvider>(
                    builder: (context, obj, child) => Switch(
                          value: obj.isSwitchOn,
                          onChanged: (value) {
                            obj.isSwitchOn = value;
                          },
                        ))
              ],
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                context
                    .read<TextFieldDropDownSliderSwitchProvider>()
                    .showData();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<TextFieldDropDownSliderSwitchProvider>(
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
