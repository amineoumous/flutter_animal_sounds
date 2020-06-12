import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(animalsound());

class animalsound extends StatefulWidget {
  @override
  _animalsoundState createState() => _animalsoundState();
}

class _animalsoundState extends State<animalsound> {
  Container buildKey(int animalNumber) {
    return Container(
      color: Colors.blue[100],
      child: FlatButton(
        child: Image.asset('assets/animal$animalNumber.png'),
        onPressed: () {
          final player = AudioCache();
          player.play('animal$animalNumber.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Animal Sounds')),
        ),
        body: SafeArea(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[for (var i = 0; i < 8; i++) buildKey(i + 1)],
          ),
        ),
      ),
    );
  }
}
