import 'package:bombermen/buttons.dart';
import 'package:bombermen/levels.dart';
import 'package:bombermen/net_level_provider.dart';
import 'package:bombermen/nextLevel.dart';
import 'package:bombermen/pixel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
 /* @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
*/  /*int squares;
  int playerPosition, bombPosition;
  List<int> barriers;
  List<int> boxes;
  List<int> bomb;*/


/*

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    bomb = [-1];
    boxes = boxesLevel1;
    barriers = barriersLevel1;
    squares = 110;
    playerPosition = 0;
    bombPosition = -1;
  }
*/

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NextLevelProvider>(
      create: (context) => NextLevelProvider(),
     child: Builder(builder: (context){
      var textFactor = MediaQuery.of(context).textScaleFactor;
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[800],
          body: Consumer<NextLevelProvider>(
              builder: (context, provider, child){
                return Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Container(
                            child: GridView.builder(
                                itemCount: provider.squares,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
                                itemBuilder: (context, index){
                                  if(provider.bomb.contains(index)){
                                    return Pixels(
                                      innerColor: Colors.red,
                                      outerColor: Colors.red[900],
                                    );
                                  }else if(provider.bombPosition == index){
                                    return Pixels(
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Image.asset("images/bomb.png"),
                                      ),
                                    );
                                  }else if(provider.playerPosition == index){
                                    return Pixels(
                                      innerColor: Colors.green,
                                      outerColor: Colors.green[900],
                                      child: Image.asset("images/bomberman.jpg"),
                                    );
                                  }else if(provider.barriers.contains(index)){
                                    return Pixels(
                                      innerColor: Colors.black,
                                      outerColor: Colors.black,
                                      //  child: Text(index.toString()),
                                    );
                                  }else if(provider.boxes.contains(index)){
                                    return Pixels(
                                      innerColor: Colors.brown,
                                      outerColor: Colors.brown[900],
                                      // child: Text(index.toString()),
                                    );
                                  } else
                                    return Pixels(
                                      innerColor: Colors.green,
                                      outerColor: Colors.green[900],
                                      //  child: Text(index.toString()),
                                    );
                                }),
                          )
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Buttons(),
                                  Buttons(color: Colors.green,child: IconButton(
                                      icon: Icon(Icons.keyboard_arrow_up),
                                      onPressed: (){
                                          if(provider.playerPosition >= 10 && !provider.barriers
                                              .contains(provider.playerPosition-10) && !provider.boxes.contains(provider.playerPosition-10))
                                            provider.moveUp();
                                      }),
                                  ),
                                  Buttons(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Buttons(
                                    color: Colors.green,child: IconButton(
                                      icon: Icon(Icons.keyboard_arrow_left),
                                      onPressed: (){
                                          if(provider.playerPosition>0 && !provider.barriers
                                              .contains(provider.playerPosition-1) && !provider.boxes.contains(provider.playerPosition-1))
                                            provider.moveLeft();
                                      }),
                                  ),
                                  Buttons(
                                    child: GestureDetector(
                                      onTap: provider.placeBomb,
                                      child: Image(
                                        fit: BoxFit.contain,
                                        image: AssetImage("images/bomb.png"),
                                      ),
                                    ),
                                  ),
                                  Buttons(color: Colors.green,child: IconButton(
                                      icon: Icon(Icons.keyboard_arrow_right),
                                      onPressed: (){
                                          if(provider.playerPosition <provider.squares-1 && !provider.barriers
                                              .contains(provider.playerPosition+1) && !provider.boxes.contains(provider.playerPosition+1))
                                            provider.moveRight();
                                      }),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Buttons(),
                                  Buttons(color: Colors.green, child: IconButton(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      onPressed: (){
                                          if(provider.playerPosition < provider.squares-10 && !provider.barriers.contains(provider.playerPosition+10) && !provider.boxes.contains(provider.playerPosition+10))
                                            provider.moveDown();

                                      }),
                                  ),
                                  Buttons(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  provider.playerPosition == provider.squares-1 ?
                  Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 3,
                        child: Center(
                          child: Image.asset("images/won.png"),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'Congratulations!',
                            textScaleFactor: textFactor < 1
                                ? textFactor * 4
                                : textFactor * 3.5,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.white,
                                  offset: Offset(5.0, 5.0),
                                ),
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),

                        ),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 3,
                        child: Center(
                          child: Image.asset("images/emoji.png"),
                        ),
                      ),
                      ColoredButton(func: () {
                        provider.clear();
                        provider.nextLevel(boxesLevel2, barriersLevel2, 110, 0, -1, [-1]);
                      },
                      ),
                    ],
                  ):Container(),
                ]
            );
              }
          ),
        ),
      );
    }),
    );
  }
}
