import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ShapeWidget(),
    ),
  ));
}

class ShapeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends State<ShapeWidget> {
  Random rnd;
  Color containerOneColor = Colors.cyan;
  Color containerTwoColor = Colors.pink;
  Color containerThreeColor = Colors.green;
  Color containerFourColor = Colors.lime;
  Color containerFiveColor = Colors.deepPurple;
  Color containerSixColor = Colors.red;
  Color containerSevenColor = Colors.blue;
  Color chooseColor = Colors.red;
  var winLoss = "";
  var game = false;
  var seconds = 0;
  Timer timer;
  List colors = [Colors.red,Colors.pink,Colors.yellow,Colors.brown];
  updateTime(){
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer){
      setState(() {
        game = true;
        seconds = seconds +1;
        if(seconds>=30){
          game = false;
          print("You loose");
          timer.cancel();
          seconds=0;
          notifier(false);
          resetColors();
          chooseColor = randomNumber();
        }
        if(containerOneColor == chooseColor &&
            containerTwoColor == chooseColor &&
            containerThreeColor == chooseColor &&
            containerFourColor == chooseColor &&
            containerFiveColor == chooseColor &&
            containerSixColor == chooseColor &&
            containerSevenColor == chooseColor){
             game = false;
             timer.cancel();
             print("You won");
             resetColors();
             seconds=0;
             notifier(true);
             chooseColor = randomNumber();
        }
        print(seconds);
      });
    }
    );
  }

  resetColors(){
    containerOneColor = Colors.cyan;
    containerTwoColor = Colors.pink;
    containerThreeColor = Colors.green;
    containerFourColor = Colors.lime;
    containerFiveColor = Colors.deepPurple;
    containerSixColor = Colors.red;
    containerSevenColor = Colors.blue;
    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //updateTime();
  }
  Color randomNumber(){
    rnd = new Random();
    int r = 0 + rnd.nextInt(4);
    print(colors[r]);
    return colors[r];
  }

  void notifier (winLoss) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        if (winLoss) {
          return AlertDialog(
            title: Text("WOOOHOOOO",style: TextStyle(fontSize: 30.0),),
            content: Text("Winner!",style: TextStyle(fontSize: 30.0),),
            actions: <Widget>[
              FlatButton(
                child: Text("Close",style: TextStyle(fontSize: 30.0),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
        return AlertDialog(
          title: Text("Time Over",style: TextStyle(fontSize: 30.0),),
          content: Text("Don't Loose Heart, Try Again",style: TextStyle(fontSize: 30.0),),
          actions: <Widget>[
            FlatButton(
              child: Text("Close",style: TextStyle(fontSize: 30.0),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    color: Colors.orange,
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.access_time),
                        Text(seconds.toString(),style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration:
                    BoxDecoration(color: chooseColor, shape: BoxShape.rectangle),
                    height: 40,
                    width: 40,
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        if(!game){
                          Timer.run(updateTime());
                        }
                      });
                    },
                    color: Colors.orange,
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.play_arrow),
                        Text("Run")
                      ],
                    ),
                  ),
                ],
              ),
              FirstRow(),
              SecondRow(),
              ThirdRow(),
            ],
          )),
    );
  }

  Row ThirdRow() {
    return Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(game) {
                          setState(() {
                            containerFiveColor = randomNumber();
                          });
                        }
                      },
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: containerFiveColor,
                      ),
                    )),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(game) {
                          setState(() {
                            containerSixColor = randomNumber();
                          });
                        }
                      },
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: containerSixColor,
                      ),
                    )),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(game) {
                          setState(() {
                            containerSevenColor = randomNumber();
                          });
                        }
                      },
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: containerSevenColor,
                      ),
                    ))
              ],
            );
  }

  Expanded SecondRow() {
    return Expanded(
              child: GestureDetector(
                onTap: (){
                  if(game) {
                    setState(() {
                      containerFourColor = randomNumber();
                    });
                  }
                },
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: containerFourColor,),
                ));
  }

  Row FirstRow() {
    return Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(game) {
                          setState(() {
                            containerOneColor = randomNumber();
                          });
                        }
                      },
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: containerOneColor,
                      ),
                    )),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      if(game) {
                        setState(() {
                          containerTwoColor = randomNumber(); //action to be taken should be written inside setstate.
                        });
                      }
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: containerTwoColor,
                    ),
                    )),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      if(game) {
                        setState(() {
                          containerThreeColor = randomNumber();
                        });
                      }
                    },
                    child: Container(
                        height: 100.0, width: 100.0,
                        color: containerThreeColor),
                  ))
              ],
            );
  }

}