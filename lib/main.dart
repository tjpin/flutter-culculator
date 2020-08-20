import 'package:culc/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQust = '';
  var userAns = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQust,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAns,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Mybuttons(
                          buttonTapped: () {
                            setState(() {
                              userQust = '';
                              userAns = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.white10,
                          textColor: Colors.green,
                        );
                      } else if (index == 1) {
                        return Mybuttons(
                          buttonTapped: () {
                            setState(() {
                              userQust =
                                  userQust.substring(0, userQust.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.white10,
                          textColor: Colors.red,
                        );
                      } else if (index == 18) {
                        return Mybuttons(
                          buttonText: buttons[index],
                          color: Colors.white10,
                          textColor: Colors.green,
                        );
                      } else if (index == buttons.length - 1) {
                        return Mybuttons(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.white10,
                          textColor: Colors.red,
                        );
                      } else {
                        return Mybuttons(
                          buttonTapped: () {
                            setState(() {
                              userQust += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.amber[800]
                              : Colors.white10,
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black,
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == '*' || x == '+' || x == '=' || x == '-') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQust;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAns = eval.toString();
  }
}
