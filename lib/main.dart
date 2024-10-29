import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  static const platform = MethodChannel("com.example.sms/chat");

  Future<void> setDefaultSMSApp() async {
    try {
      platform.invokeMethod('setDefaultSms');
    } on PlatformException catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    setDefaultSMSApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Container(
        decoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}
