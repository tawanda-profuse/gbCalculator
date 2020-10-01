import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/CalcButton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('GBCalculator'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textSize: 20,
                    callback: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 24,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                    textSize: 23,
                  ),
                  CalcButton(
                    text: '00',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                    textSize: 23,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFF00, //0xFFFFFFFF
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
