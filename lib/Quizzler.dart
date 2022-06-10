import 'package:flutter/material.dart';
import 'package:quizzler/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class quizzler extends StatefulWidget {
  quizzler({Key? key}) : super(key: key);

  @override
  _quizzlerState createState() => _quizzlerState();
}

class _quizzlerState extends State<quizzler> {
  List<Icon> score = [];

  void checkanswer(ans) {
    if (isfinish() == true) {
      Alert(context: context, title: "FINISH", desc: "You Completed the Quiz.")
          .show();
      reset();
      score = [];
    } else {
      if (ans == showanswer()) {
        score.add(Icon(Icons.check, color: Colors.green));
        nextquestion();
        setState(() {});
      } else {
        score.add(Icon(Icons.close, color: Colors.red));
        nextquestion();
        setState(() {});
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(showquestion()),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    bool correctanswer = true;
                    checkanswer(correctanswer);
                  },
                  child: Text('True'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    bool correctanswer = false;
                    checkanswer(correctanswer);
                  },
                  child: Text('False'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                ),
              ),
            ),
            Row(
              children: score,
            )
          ],
        ),
      ),
    );
  }
}
