import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lightapp/pages/background_page.dart';
import 'package:lightapp/pages/home_pages.dart';
import 'package:lightapp/pages/test_pages.dart';
import 'package:lightapp/service/background_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:torch_controller/torch_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value){
    if(value){
      Permission.notification.request();
    }
  });
  // await initiliazeServie();
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BackgroundPage(),
    );
  }
}
