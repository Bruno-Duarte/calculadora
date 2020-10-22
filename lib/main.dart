import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _a;
  String _b;
  String _operator;
  var _result;
  bool _bIsAllowed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 20,
        ),
        child: Column(
          children: [
            buildDigits(),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.2),
                      bottom: BorderSide(width: 0.3),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.82,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildColumn('+'),
                      SizedBox(width: 20),
                      buildColumn('-'),
                      SizedBox(width: 20),
                      buildColumn('*'),
                      SizedBox(width: 20),
                      buildColumn('/'),
                      SizedBox(width: 20),
                      buildColumn('%'),
                    ],
                  ),
                ),
              ],
            ),
            buildDigits(),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (_operator == '+') {
                            _result = double.parse(_a) + double.parse(_b);
                          } else if (_operator == '-') {
                            _result = double.parse(_a) - double.parse(_b);
                          } else if (_operator == '*') {
                            _result = double.parse(_a) * double.parse(_b);
                          } else if (_operator == '/') {
                            _result = double.parse(_a) / double.parse(_b);
                          } else if (_operator == '%') {
                            _result = int.parse(_a) % int.parse(_b);
                          }
                        });
                      },
                      child: Text(
                        'Calcular',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      key: ValueKey('btn-calcular'),
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _a = '';
                          _b = '';
                          _operator = '';
                          _result = '';
                          _bIsAllowed = false;
                        });
                      },
                      child: Text(
                        'Zerar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      key: ValueKey('btn-zerar'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text('Operação: $_a$_operator$_b'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'Resultado: ' +
                              (_result.runtimeType == String
                                  ? ''
                                  : (_result.runtimeType == int
                                      ? _result.toString()
                                      : _result.toStringAsFixed(2))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _a = '';
    _b = '';
    _operator = '';
    _result = '';
    _bIsAllowed = false;
    super.initState();
  }

  bool isOperator(String char) {
    List<String> operators = ['+', '-', '*', '/', '%'];
    for (var op in operators) {
      if (op == char) {
        return true;
      }
    }
    return false;
  }

  Column buildDigits() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildColumn('0'),
                  SizedBox(width: 20),
                  buildColumn('1'),
                  SizedBox(width: 20),
                  buildColumn('2'),
                  SizedBox(width: 20),
                  buildColumn('3'),
                  SizedBox(width: 20),
                  buildColumn('4'),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildColumn('5'),
                  SizedBox(width: 20),
                  buildColumn('6'),
                  SizedBox(width: 20),
                  buildColumn('7'),
                  SizedBox(width: 20),
                  buildColumn('8'),
                  SizedBox(width: 20),
                  buildColumn('9'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildColumn(String char) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.1,
                color: Colors.grey,
              ),
              right: BorderSide(
                width: 0.2,
                color: Colors.grey,
              ),
              bottom: BorderSide(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
          ),
          child: FlatButton(
            padding: EdgeInsets.only(right: 3),
            child: Text(
              char,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              setState(() {
                if (_bIsAllowed) {
                  _b += char;
                } else if (!isOperator(char) && !_bIsAllowed) {
                  _a += char;
                } else if (isOperator(char)) {
                  _operator = char;
                  _bIsAllowed = true;
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
