import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';
class ticScreen extends StatefulWidget {
  const ticScreen({Key? key}) : super(key: key);

  @override
  State<ticScreen> createState() => _ticScreenState();
}

class _ticScreenState extends State<ticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       const Text(
                          'Player X',
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          xScore.toString(),
                          style:const TextStyle(fontSize: 20,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Player O', style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                        ),
                        Text(
                          oScore.toString(),
                          style: const TextStyle(fontSize: 20,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          displayElements[index],
                          style: const TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.indigo[50],
                    textColor: Colors.black,
                    onPressed: _clearScoreBoard,
                    child: Text("Clear Score Board"),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (onTab && displayElements[index] == '') {
        displayElements[index] = 'O';
        fillBoxes++;
      } else if (!onTab && displayElements[index] == '') {
        displayElements[index] = 'X';
        fillBoxes++;
      }

      onTab = !onTab;
      _checkWinner();
    });
  }

  void _checkWinner() {

    // Checking rows
    if (displayElements[0] == displayElements[1] &&
        displayElements[0] == displayElements[2] &&
        displayElements[0] != '') {
      _showWinDialog(displayElements[0]);
    }
    if (displayElements[3] == displayElements[4] &&
        displayElements[3] == displayElements[5] &&
        displayElements[3] != '') {
      _showWinDialog(displayElements[3]);
    }
    if (displayElements[6] == displayElements[7] &&
        displayElements[6] == displayElements[8] &&
        displayElements[6] != '') {
      _showWinDialog(displayElements[6]);
    }

    // Checking Column
    if (displayElements[0] == displayElements[3] &&
        displayElements[0] == displayElements[6] &&
        displayElements[0] != '') {
      _showWinDialog(displayElements[0]);
    }
    if (displayElements[1] == displayElements[4] &&
        displayElements[1] == displayElements[7] &&
        displayElements[1] != '') {
      _showWinDialog(displayElements[1]);
    }
    if (displayElements[2] == displayElements[5] &&
        displayElements[2] == displayElements[8] &&
        displayElements[2] != '') {
      _showWinDialog(displayElements[2]);
    }

    // Checking Diagonal
    if (displayElements[0] == displayElements[4] &&
        displayElements[0] == displayElements[8] &&
        displayElements[0] != '') {
      _showWinDialog(displayElements[0]);
    }
    if (displayElements[2] == displayElements[4] &&
        displayElements[2] == displayElements[6] &&
        displayElements[2] != '') {
      _showWinDialog(displayElements[2]);
    } else if (fillBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner!!!"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElements[i] = '';
      }
    });

    fillBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        displayElements[i] = '';
      }
    });
    fillBoxes = 0;
  }
}
