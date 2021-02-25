import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:scratchandwin/play_game.dart';
import 'package:scratchandwin/rules_page.dart';
import 'package:transparent_image/transparent_image.dart';


class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {

  static AudioPlayer advancedPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(fixedPlayer: advancedPlayer);

  String two='2.mp3';

  @override
  void initState() {
    super.initState();
    audioCache.play(two);
      }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Scratch and Win",
        ),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height:30
            ),
            Container(
              height: 256,
              width: 256,
              child: Stack(
                children:[
                  Center(child:CircularProgressIndicator() ,
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:'https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595320705/readme%20images/scratch%20and%20win%20game%20flutter/download_wpl1yb.png',
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(
              height:96.0,
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                RaisedButton(
                  child: Text("Play Game"),
                  color:Colors.red[500],
                  padding:EdgeInsets.fromLTRB(50,20,50,20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: (){
                    setState(() {
                      advancedPlayer.pause();
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayGame()));
                  },
                ),
              ]
            ),
            SizedBox(
              height:40
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                RaisedButton(
                  child: Text("Game Rules"),
                  color:Colors.red[500],
                  padding:EdgeInsets.fromLTRB(50,20,50,20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: (){
                    setState(() {
                      advancedPlayer.stop();
                      audioCache.play('dice.wav');
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Rulespage()));
                  },
                ),
              ]
            ),
          ],
          ),
      ),
      
    );
  }
} 