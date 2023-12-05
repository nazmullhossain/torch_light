


import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

Future<void>initiliazeServie()async{
  final service=FlutterBackgroundService();

  await service.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart, isForegroundMode: true,
      autoStart: true));
}
@pragma('vm:entry-point')
void onStart (ServiceInstance serviceInstance)async{
  DartPluginRegistrant.ensureInitialized();
  if(serviceInstance is AndroidServiceInstance){
    serviceInstance.on("setAsForeground").listen((event) {

      serviceInstance.setAsForegroundService();
    });
    serviceInstance.on("setasbackgroud").listen((event) {
      serviceInstance.setAsBackgroundService();
    });
    serviceInstance.on("stopservie").listen((event) {
      serviceInstance.stopSelf();
    });
    Timer.periodic(Duration(seconds: 1), (timer) async{ 
      if(serviceInstance is AndroidServiceInstance){
        if(await serviceInstance.isForegroundService()){
          serviceInstance.setForegroundNotificationInfo(
              title: "Script Academy", content: "sub my channnel");
        }
      }
      print("background serce running");
      //perform some operation on backgroud which in not noticable to the used
      serviceInstance.invoke("update");
    });
  }

}
