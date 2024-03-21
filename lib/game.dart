import 'package:flutter/material.dart';
import 'package:xogame/homepage.dart';

class game extends StatefulWidget {
  final data;
  const game({super.key,required this.data});

  @override
  State<game> createState() => _gameState();
}
  enum xo{x,o}

class _gameState extends State<game> {
  List<xo?>items=[null,null,null,null,null,null,null,null,null,];
  int play1=5;
  int play2=4;
  int ord=1;
List Winner=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
List player1=[];
List player2=[];
int n=9;
bool state=false;
bool state1=false;
String turnName="";





  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      children: [
         Padding(padding:EdgeInsets.all(29)),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [
              Text("player1",
          textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
            Text("${widget.data[0]}",
          textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.green
        ),),
            ],),
        Column(children: [
              Text("player2",
          textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
            Text("${widget.data[1]}",
          textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.red
        ),),
            ],),
          ],
         ),
        Expanded(
          child: Padding(
            child:cube(items: items,
            onclick: (i,State){
              setState(() {
               if(state==false&&state1==false){
                 if(play1>0&&ord==1){
                  items[i]=xo.x;
                  player1.add(i);
                  ord++;
                  play1--;
                  turnName="${widget.data[1]}";
                  
                }
                else if(play2>0&&ord==2){
                  items[i]=xo.o;
                  player2.add(i);
                  ord--;
                  play2--;
                  turnName="${widget.data[0]}";
                }
               }
               
                
                
              });
              n--;
                print(n);
               
               for(int k=0;k<Winner.length;k++){
                 if(n==0&&player1.where((element) => !Winner[k].contains(element)).toList().length<=2||n==4&&player1.where((element) => !Winner[k].contains(element)).toList().length==0||n==2&&player1.where((element) => !Winner[k].contains(element)).toList().length<=1){
                  state=true;
                }
                 if(n==0&&player2.where((element) => !Winner[k].contains(element)).toList().length<=1||n==3&&player2.where((element) => !Winner[k].contains(element)).toList().length==0||n==1&&player2.where((element) => !Winner[k].contains(element)).toList().length<=1){
                  state1=true;
                }
                
                
               }
                print(state);
                if(state==true){
                  
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                   builder: (context)=>AlertDialog(
                    
                    title:Column(
                      children: [
                         Text("Game Over",
                    textAlign: TextAlign.center,),
                     Text("${widget.data[0]} win",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.green 
                    ),
                    ),
                      ],
                    ),
                    
                    
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>game(data:widget.data)),(route) => false,);}, child: Text("Restart",style: TextStyle(color: Colors.green),),),
                      TextButton(onPressed: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>homepage()),(route) => false,);}, child: Text("Home",style: TextStyle(color: Colors.red),)),
                    ],
                    

                   )
                   );
           
                }
                else if(state1==true){
              showDialog(
                    barrierDismissible: false,
                    context: context,
                   builder: (context)=>AlertDialog(
                    
                    title:Column(
                      children: [
                         Text("Game Over",
                    textAlign: TextAlign.center,),
                     Text("${widget.data[1]} win",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.red 
                    ),
                    ),
                      ],
                    ),
                    
                    
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>game(data:widget.data)),(route) => false,);}, child: Text("Restart",style: TextStyle(color: Colors.green),)),
                      TextButton(onPressed: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>homepage()),(route) => false,);}, child: Text("Home",style: TextStyle(color: Colors.red),)),
                    ],
                    

                   )
                   );
                  
                }
                 else if(state1==false&&state==false&&n==0){
              showDialog(
                    barrierDismissible: false,
                    context: context,
                   builder: (context)=>AlertDialog(
                    
                    title:Column(
                      children: [
                         Text("Game Over",
                    textAlign: TextAlign.center,),
                     Text("Draw",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.grey[500],
                    ),
                    ),
                      ],
                    ),
                    
                    
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>game(data:widget.data)),(route) => false,);}, child: Text("Restart",style: TextStyle(color: Colors.green),)),
                      TextButton(onPressed: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>homepage()),(route) => false,);}, child: Text("Home",style: TextStyle(color: Colors.red),)),
                    ],
                    

                   )
                   );
                  
                }
                
                
            },
            

            ),
            padding: EdgeInsets.all(10),
          ),
        ),
        Column(
          children: [
            Text("____Turn____",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white

        ),
        ),
         Text(state==true||state1==true||n==0?"Game Over":"$turnName",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: turnName == widget.data[0] ? Colors.green : Colors.red,

        ),
        ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 100)),

        
      ],
     ),
    );
  }
}
class cube extends StatelessWidget {
  final List<xo?>items;
    final void Function(int, bool)onclick;
  const cube({super.key, required this.items, required this.onclick,});
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
            itemCount: items.length,
            itemBuilder: (context,i) => InkWell(
              child: Container(
                height: 50,
                color: Colors.white,
                child: applique(item: items[i],),
              ),
              onTap: (){
                onclick(i,false);
              },
            )
            );
  }
}
class applique extends StatelessWidget {
  final xo?item;

  const applique({super.key, this.item, });

  @override
  Widget build(BuildContext context) {
    if(item==null)return SizedBox();
    return Center(
      child: Text("${item!.name}",
      style: TextStyle(fontSize: 50,
      color: item == xo.x ? Colors.green : Colors.red,
      ),
      ),
    );
  }
}

