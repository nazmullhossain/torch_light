import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bgColor = Color(0xFF2c3333);
  final textColor = Color(0xFFE7F6F2);
  bool isActive = false;
  var controller=TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Torch List",
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
                children: [
                  Container(
            child: Image.asset(
                    isActive ? "images/lightoff.jpg" : "images/lighton.jpg"),
          ),
                  SizedBox(height: 10,),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 45,
                    child: Transform.scale(
                        scale: 1.5,
                        child: IconButton(onPressed: (){
                          controller.toggle(intensity: 0.5);
                          isActive=!isActive;
                          setState(() {

                          });
                        }, icon: Icon(Icons.power_settings_new))),
                  )
                ],
              )),
          Text("Developed by Md Nazmul Hossain")
        ],
      ),
    );
  }
}
