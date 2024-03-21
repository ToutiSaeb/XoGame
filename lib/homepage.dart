import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xogame/PlayerName.dart';
import 'package:xogame/game.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}


class _homepageState extends State<homepage> {
  GlobalKey<FormState>fk=new GlobalKey();
  TextEditingController tc1=new TextEditingController();
  TextEditingController tc2=new TextEditingController();
  String?name1;
  String?name2;
  List<String> names=[];
  @override
  
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fk,
        child: Center(
          
          child: SingleChildScrollView(
            child: Column(
              children: [
              
                Padding(padding:EdgeInsets.all(30)),
                   Text("Liva Xo game",style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 9, 190, 45)),),
                 Padding(padding:EdgeInsets.all(50)),
                 Text("player 1",style: TextStyle(fontSize: 20,color:  Color.fromARGB(255, 9, 190, 45)),textAlign: TextAlign.start,),
                 PlayerName(tc: tc1,),
                   Text("player 2",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 9, 190, 45)),textAlign: TextAlign.start,),
                   PlayerName(tc: tc2,),
                 Padding(
                  padding: EdgeInsets.only(right: 80,left: 80,top: 30,bottom: 250),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    
                    children: [
                        MaterialButton(
                      color: Color.fromARGB(222, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text("Start",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 9, 141, 33)),textAlign: TextAlign.start,),
                      onPressed: (){
                       if(fk.currentState!.validate()){
                         name1=tc1.text;
                         name2=tc2.text;
                         names.addAll(["$name1","$name2"]);
                         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>game(data: names)),(route) => false,);
                   
                       }
                       
                 
                   
                      },
                     ),
                       MaterialButton(
                      color: Color.fromARGB(222, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text("Exit",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 9, 141, 33)),textAlign: TextAlign.start,),
                      onPressed: (){
                      if(Platform.isAndroid){
                      SystemNavigator.pop();
                      }
                     
                   
                      },
                     )
                    ],
                   ),
                 )
                
              ],
            ),
          ),
          
      ),
      )

    );
  }
}