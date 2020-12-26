import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


void main() {
  runApp(cal());
}

class cal extends StatefulWidget {
  @override
  _calState createState() => _calState();
}

class _calState extends State<cal> {

  String exp = "";
  String newexp = "";
  String r = "";
  Color color = Colors.white;

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
  void add(String x)
  {
    color = Colors.white;

    setState(() {



      if(exp.isNotEmpty && !isNumeric(exp[exp.length-1]) && !isNumeric(x))
        {
          return ;
        }
      exp+=x;


      newexp = exp.replaceAll('/', '÷');
      newexp = newexp.replaceAll('*', 'x');

      try {
        double.parse(exp);
        return;
      }catch(e)
      {

      }
            try{
        Expression expression = Expression.parse(exp);
        final evaluator = const ExpressionEvaluator();
        var res = evaluator.eval(expression, Map()).toString();
        print(res);
        r = res;
      }catch(e)
      {

      }



    });

  }
  void update()
  {

    setState(() {


      try{
        Expression expression = Expression.parse(exp);
        final evaluator = const ExpressionEvaluator();
        var res = evaluator.eval(expression, Map()).toString();
        print(res);

        r = res;
        exp = newexp= r;
        r = '';
      }catch(e)
      {

        r = 'invalid';
        color = Colors.red;
      }


    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Calculator',
          textAlign: TextAlign.center,),
        ),
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom:0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text('$newexp',
                                  textAlign : TextAlign.end,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  letterSpacing: 2
                                ),),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('$r',
                              style: TextStyle(
                                color: color,
                                fontSize: 20,
                              ),),
                          ],
                        ),
                      ),
                    )
                    ,
                    Container(
                      color: Colors.grey[800],
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              onPressed: (){

                                setState(() {
                                  exp = "";
                                  r = "";
                                  newexp="";

                                });

                              },
                              child: Text('AC',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                setState(() {
                                  exp = exp.substring(0,exp.length-1);
                                  add('');

                                });

                              },
                              child: Icon(Icons.backspace,
                                color: Colors.white,


                              )
                            ),
                            FlatButton(
                              onPressed: (){

                                add('%');

                              },
                              child: Text('%',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add("/");

                                },
                              child: Text('÷',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.yellow.shade800,
                                  fontWeight: FontWeight.bold,
                                ),),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[800],
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              onPressed: (){

                                add('7');


                              },
                              child: Text('7',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('8');


                              },
                              child: Text('8',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('9');


                              },
                              child: Text('9',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('*');


                              },
                              child: Text('x',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.yellow.shade800,
                                  fontWeight: FontWeight.bold,
                                ),),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[800],
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              onPressed: (){

                                add('4');


                              },
                              child: Text('4',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('5');


                              },
                              child: Text('5',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('6');


                              },
                              child: Text('6',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('-');


                              },
                              child: Text('-',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.yellow.shade800,
                                  fontWeight: FontWeight.bold,
                                ),),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[800],
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              onPressed: (){

                                add('1');


                              },
                              child: Text('1',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('2');


                              },
                              child: Text('2',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('3');


                              },
                              child: Text('3',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('+');


                              },
                              child: Text('+',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.yellow.shade800,
                                  fontWeight: FontWeight.bold,
                                ),),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[800],
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              onPressed: (){

                                add('.');


                              },
                              child: Text('.',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('0');


                              },
                              child: Text('0',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                add('(');


                              },
                              onLongPress: ()
                              {

                                add(')');

                              },
                              child: Text('(  )',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            FlatButton(
                              onPressed: (){

                                  update();

                              },
                              child: Text('=',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.yellow.shade800,
                                  fontWeight: FontWeight.bold,
                                ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],

                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}


