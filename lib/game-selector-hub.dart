import 'package:boxgame/Khochoc.dart';
import 'package:boxgame/KhochocTimed.dart';
import 'package:boxgame/RoffSkets.dart';
import 'package:boxgame/ah-pusing.dart';
import 'package:boxgame/flutter-box2D.dart';
import 'package:boxgame/main.dart';
import 'package:boxgame/notFoundError.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'KhochocHighscore.dart';

/*
* Game Selector
* Select Game!
*
* List of Tired to credit idk man:
* https://medium.com/flutter-community/games-in-flutter-flame-box2d-part-1-4c23a1cbc102
* https://medium.com/flutter-community/games-in-flutter-flame-box2d-part-2-142282a4856f
* https://medium.com/@suragch/a-complete-guide-to-flutters-listtile-597a20a3d449
* https://medium.com/flutter-community/flutter-listview-and-scrollphysics-a-detailed-look-7f0912df2754
* https://flutter.dev/docs/cookbook/design/drawer
* https://www.developerlibs.com/2019/09/flutter-drop-down-menu-list-example.html
* https://stackoverflow.com/q/50441168/9079640
* https://github.com/mkbreuer/view3d_snapset/releases
* https://stackoverflow.com/q/51679269/9079640
* https://jap.alekhin.io/setup-widget-tree-flame-flutter-game
 */

class GameHubScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Game!'),
        backgroundColor: Colors.green,
      ),
      body: GameList(),
    );
  }
}


class DaftarGame{
  const DaftarGame(this.ikon, this.nama);
  final IconData ikon;
  final String nama;
}

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  List<DaftarGame> daftarGame = [
    DaftarGame(Icons.check_box_outline_blank, 'Kotak ON/OFF'),
    DaftarGame(Icons.map, 'Maze Ball'),
    DaftarGame(Icons.error, 'Invoke 404 Not Found error Now!'),
    DaftarGame(Icons.all_inclusive, 'Achak Achak'),
    DaftarGame(Icons.vibration, 'Khochoc Khochoc!'),
    DaftarGame(Icons.vibration, 'Khochoc Timed!'),
    DaftarGame(Icons.score, 'Khochoc Highscore'),
    DaftarGame(Icons.redeem, 'OurWear Roff Skets'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: daftarGame.length,
        itemBuilder: (context,position){
          return ListTile(
            onTap: (){
              Navigator.pop(context);
              // https://stackoverflow.com/questions/59766770/how-to-navigate-to-next-page-in-dynamic-list-view-flutter

              Navigator.push(context, MaterialPageRoute(builder: (context){
                switch(position){
                  case 0:
                    return containsScaffold();
                    break;
                  case 1:
                    return MazeBallScaffold();
                    break;
                  case 2:
                    return NotFoundError();
                    break;
                  case 3:
                    return AchakAchak();
                    break;
                  case 4:
                    return Khochoc();
                    break;
                  case 5:
                    return KhochocTimed();
                    break;
                  case 6:
                    return KhochocHighScore();
                    break;
                  case 7:
                    return OurWearRoffSkets();
                    break;
                  default:
                    return NotFoundError();
                    break;
                }
              })
              );
            },
            title: Row(
              children: <Widget>[
                // https://api.flutter.dev/flutter/widgets/Icon-class.html
                // https://api.flutter.dev/flutter/material/Icons-class.html
                Icon(daftarGame[position].ikon),
                Text('${daftarGame[position].nama}')
              ],
            ),
          );
        },
    );
  }
}
