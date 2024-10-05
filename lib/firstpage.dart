import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:tic_tac_toe/homepage.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              'TIC TAC TOE',
              style: TextStyle(
                  fontFamily: 'Silkscreen',
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(
              flex: 4,
            ),
            Container(
              child: AvatarGlow(
                glowCount: 3,
                duration: Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                startDelay: Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 90.0,
                    backgroundColor: Colors.grey[900],
                    child: Container(
                      child: Image.asset(
                        'image/video_game_play-09-512.webp',
                        color: Colors.white,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Text('Omar Khaled 💻',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Silkscreen',
                    ),),
            Spacer(
              flex: 2,
            ),
               ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 50),
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black54, width: 3),
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Homepage();
                    }));
                  },
                  child: Text(
                    'Play Game',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Silkscreen',
                    ),
                  )),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
