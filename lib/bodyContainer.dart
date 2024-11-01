import 'package:flutter/material.dart';

class bodyContainer extends StatefulWidget {
  const bodyContainer({super.key});

  @override
  State<bodyContainer> createState() => _bodyContainerState();
}

class _bodyContainerState extends State<bodyContainer> {

  String value = '0';

  int totalQuestions = 0;

  String questionNumber = '1';

  String question = '';

  bool? answers;

  String playerScore = '0';

  _buttonPressed(String action){
    setState(() {
      if (action == 'next' && (int.parse(questionNumber)) < totalQuestions){
        value = (int.parse(value)+1).toString();
        int parsedDigit = int.parse(questionNumber);
        parsedDigit++;
        questionNumber = parsedDigit.toString();
      }
      if ( action == 'previous' && (int.parse(questionNumber)) > 1){
        value = (int.parse(value)-1).toString();
        int parsedDigit = int.parse(questionNumber);
        parsedDigit--;
        questionNumber = parsedDigit.toString();
      }
    });
  }

  _answerButton (String ans){
    int score = int.parse(playerScore);
    if (ans == answers.toString()){
      score++;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Correct Answer"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.green,
      ));
      if (parsedDigit < totalQuestions){
        value = (int.parse(value)+1).toString();
        parsedDigit++;
        questionNumber = parsedDigit.toString();
      }
      else{
        //do nothing
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Incorrect, Try Again"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.redAccent,
      ));
     if (parsedDigit < totalQuestions){
        value = (int.parse(value)+1).toString();
        parsedDigit++;
        questionNumber = parsedDigit.toString();
      }
      else{
        //do nothing
      }
    }
    playerScore = score.toString();
    return playerScore;
  }

  _questions() {
    Map<String, bool> questionsAndAnswers = {
      "Is the Great Wall of China visible from space?": false,
      "Does lightning strike the same place twice?": true,
      "Is Mount Everest the closest point on Earth to space?": false,
      "Do bats really fly blind?": false,
      "Can humans only use 10% of their brains?": false,
      "Is a tomato a fruit?": true,
      "Does water swirl in different directions depending on the hemisphere?": false,
      "Are sharks immune to cancer?": false,
      "Does the Eiffel Tower grow in the summer?": true,
      "Is the Sahara Desert the largest desert on Earth?": false,
      "Is Earth’s atmosphere 21% oxygen?": true,
      "Can ostriches fly?": false,
      "Do dolphins sleep with one eye open?": true,
      "Do camels store water in their humps?": false,
      "Can gold be created from other elements?": true,
      "Is Pluto still classified as a planet?": false,
      "Is the speed of light constant?": true,
      "Are all snowflakes identical?": false,
      "Do penguins live at the North Pole?": false,
      "Can some trees live for thousands of years?": true,
      "Did the Titanic sink on its maiden voyage?": true,
      "Was Julius Caesar the first emperor of Rome?": false,
      "Did the Wright brothers build the first airplane?": true,
      "Did Cleopatra rule Egypt?": true,
      "Was Napoleon Bonaparte unusually short?": false,
      "Did Albert Einstein fail math in school?": false,
      "Was the Leaning Tower of Pisa always leaning?": true,
      "Did the Berlin Wall stand for more than 50 years?": false,
      "Did Leonardo da Vinci paint the Sistine Chapel ceiling?": false,
      "Did the Black Death kill a third of Europe’s population?": true,
      "Did NASA invent Velcro?": false,
      "Can astronauts cry in space?": false,
      "Can 3D printers create human organs?": true,
      "Is the Internet older than mobile phones?": true,
      "Do smartphones have more computing power than the computers used in the Apollo missions?": true,
      "Is the sun a planet?": false,
      "Can robots learn to have emotions?": false,
      "Is Wi-Fi short for 'Wireless Fidelity'?": false,
      "Did humans land on the moon in 1969?": true,
      "Is artificial intelligence capable of human-level decision-making?": false,
    };

    totalQuestions = questionsAndAnswers.length;

    if (int.parse(value) >= 0){
      setState(() {
        question = questionsAndAnswers.keys.elementAt(int.parse(value));

        answers = questionsAndAnswers.values.elementAt(int.parse(value));
      });
    }
    else{
      //do nothing
    }

    return question;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset('lib/pictures/brain.png'),
          ),
          SizedBox(
            height: 30,
          ),
          // Container(
          //   alignment: Alignment.center,
          //   child: Text(
          //     'Score: $playerScore',
          //     style: TextStyle(
          //       fontSize: 20,
          //     ),
          //   ),
          // ),SizedBox(
          //   height: 30,
          // ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Text(
                'Question: $questionNumber out of $totalQuestions',
                style: TextStyle(),
              )),
              Container(
                child: Text('Score: $playerScore'),
              )
            ],
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              _questions(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _answerButton('true');
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey),
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'True',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _answerButton('false');
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey),
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'False',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:(){
                  setState(() {
                    _buttonPressed('previous');
                  });
                 },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Previous Question')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){_buttonPressed('next');},
                child: Container(
                  child: Row(
                    children: [
                      Text('Next Question'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
