import 'package:boxgame/Scaffoldings.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'box-game.dart';
import 'package:flutter/gestures.dart';

// https://jap.alekhin.io/create-mobile-game-flutter-flame-beginner-tutorial
// https://jap.alekhin.io/2d-casual-mobile-game-tutorial-flame-flutter-part-1
// https://jap.alekhin.io/setup-widget-tree-flame-flutter-game

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);


//  BoxGame game = BoxGame();
//  TapGestureRecognizer tapper = TapGestureRecognizer();
//  tapper.onTapDown = game.onTapDown;
//  runApp(game.widget);
//  flameUtil.addGestureRecognizer(tapper);

  runApp(containsGame());
}

class containsScaffold extends StatelessWidget {
  BoxGame game = BoxGame();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text('Burning Scaff'),
//        ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: game.onTapDown,
              child: game.widget,
            ),
          ),
          Positioned.fill(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    print('Press Accesibility');

                  },
                  child: Icon(Icons.accessibility),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('Press Menu');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Staffolding()),
          );
        },
        child: Icon(Icons.restaurant_menu),
      ),
    );;
  }
}



class containsGame extends StatefulWidget {
  @override
  _containsGameState createState() => _containsGameState();
}

class _containsGameState extends State<containsGame> {
//  Util flameUtil = Util();
//  flameUtil.fullScreen();
//  flameUtil.setOrientation(DeviceOrientation.portraitUp);
//
//  BoxGame game = BoxGame();
//  TapGestureRecognizer tapper = TapGestureRecognizer();
//  tapper.onTapDown = game.onTapDown;
//  runApp(game.widget);
//  flameUtil.addGestureRecognizer(tapper);
  String winText = 'Hasn\'t won';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flame Fluttershy',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: containsScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
