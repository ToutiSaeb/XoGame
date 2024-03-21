import 'package:flutter/material.dart';

class PlayerName extends StatefulWidget {
  final TextEditingController?tc;
   PlayerName({super.key,this.tc});

  @override
  State<PlayerName> createState() => _PlayerNameState();
}

class _PlayerNameState extends State<PlayerName> {
  
 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(right: 50,left: 50,top: 10,bottom: 20),
                child: TextFormField(
                  controller: widget.tc,
               decoration: InputDecoration(
                iconColor: const Color.fromARGB(255, 86, 212, 90),
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                  
                ),
                hintText: "Enter your name"
               ),
               validator: (val){
                if(val!.isEmpty){
                  return "!";
                }
               },
              
              ),
              
              );
  }
}