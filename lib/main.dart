import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/class_crud_provider.dart';
import 'package:provider_demo/counter_increment_dec_ex1.dart';
import 'package:provider_demo/counter_provider.dart';
import 'package:provider_demo/paliarmprime_provider.dart';
import 'package:provider_demo/radio_cheackbox_provider.dart';
import 'package:provider_demo/textfield_dropdown_slider_switch_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RadioCheckBoxProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextFieldDropDownSliderSwitchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CrudProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckNumberProvider(),
        )
      ],
      child: const MaterialApp(
        home: CounterIncrementDecreamentEx1Demo(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
