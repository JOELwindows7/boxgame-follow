import 'package:boxgame/Scaffoldings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'box-game.dart';
//import 'package:flutter/gestures.dart';

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

  runApp(StartPoint());
}

class StartPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScaffold(),
    );
  }
}

class StartScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Burning Flame'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => containsScaffold()
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_arrow),
                  Text('Play Game'),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                // https://stackoverflow.com/questions/45109557/flutter-how-to-programmatically-exit-the-app
                // https://api.flutter.dev/flutter/services/SystemNavigator/pop.html
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  Text('Quit Game'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
                    Navigator.pop(context);
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
    );
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
