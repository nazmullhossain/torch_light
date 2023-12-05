import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({Key? key}) : super(key: key);

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  int? i;
  void couter()async{
    for(int i =0; i<50000000; i++){
      print(i);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    couter();
    print("hlllow");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Background app"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${i}"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                FlutterBackgroundService().invoke("setAsForeground");
              }, child: Text("Forgound")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                FlutterBackgroundService().invoke("setasbackgroud");
              }, child: Text("backgroud")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()async{
                final servie=FlutterBackgroundService();
                bool isRunning=await servie.isRunning();
                if(isRunning){
                  servie.invoke("stopservie");

                }else{
                  servie.startService();
                }if(!isRunning){
                var  text="stop servie";
                print(text);
                }else{
                 var text="start service";
                 print(text);
                }
                setState((){});
              }, child: Text("stop")),
            ],
          ),
        ),
      ),
    );
  }
}
