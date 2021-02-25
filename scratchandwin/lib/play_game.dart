import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';



class PlayGame extends StatefulWidget {
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
 AudioPlayer advancedPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  AssetImage img = AssetImage('images/blank.png');
  AssetImage unlucky = AssetImage('images/sad.png');
  AssetImage lucky = AssetImage('images/money.png');

  List<String> itemArray;
  int luckyNumber;
  int count=0;
  String message=" ";


  generateRandomNumber(){
    int random=Random().nextInt(25);
    setState(() {
      luckyNumber=random;
      print(luckyNumber);
    });
  } 

  @override
  void initState() {
    super.initState();
    itemArray=List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  displayMessage(){
    setState(() {
      message="You have reached the limit";
      Delay();
    });
  }

  Delay(){
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        this.resetGame();
      });
    });
  }

  resetGame(){
    setState(() {
      itemArray = List<String>.filled(25,"Empty");
      this.message="";
      this.count=0;
    });
    generateRandomNumber();
  }

  AssetImage getImage(int index){
    String currentState = itemArray[index];
    switch (currentState){
      case "lucky":
      return lucky;
      break;
      case"unluck":
      return unlucky;
      break;

    }
    return img;
  }

  playGame(int index){
    if(luckyNumber==index){
      setState(() {
        itemArray[index]="lucky";
        audioCache.play("cash.wav");
        this.message="Yes,You got it";
        Delay();
      });
    }else if(luckyNumber!=index && count<=5){
      setState(() {
        itemArray[index]="unlucky";
        count++;
      });
      if(count==5){
        audioCache.play("aww.mp3");
        displayMessage();
      }
      if(count==4){
        this.message="last one and you are gone baby";
      }
      if(count==3){
        this.message="2 to go";
      }
      if(count==2){
        this.message="Try again";
      }
      if(count==1){
        this.message="Let's play again";
      }
    }
  }

  showAll(){
    setState(() {
      itemArray=List<String>.filled(25, "unlucky");
      itemArray[luckyNumber]="lucky";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scratch and Win Game"),
      ),
      body: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: GridView.builder(padding: const EdgeInsets.all(20.0), itemCount: 25,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10,crossAxisCount: 5,childAspectRatio: 1), itemBuilder: (context,i)=>SizedBox(width:50,height:50,child:RaisedButton(
            padding:EdgeInsets.all(1),
            onPressed:(){playGame(i);},
            child: Image(image: this.getImage(i),
            height: 40,
            width: 40,
          )
          )
          ),
        )
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          padding: EdgeInsets.fromLTRB(100,12, 100, 12), 
          color: Colors.red[400],
          child:Text(this.message)
          )
        ],
        ),
        Container(
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: RaisedButton(onPressed: (){
                  this.resetGame();
                },
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text("Reset Game",style: TextStyle(
                  color:Colors.white
               ),
               ),
                ),
              ),
              Container(
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: RaisedButton(onPressed: (){
                  this.showAll();
                },
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text("Show All",style: TextStyle(
                  color:Colors.white
                ),
                ),
                ),
              ),

            ],
          ),
        )
      ],
      ),
        ),
      ],
      )
    );
  }
}










