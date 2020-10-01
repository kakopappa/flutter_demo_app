import 'package:flutter/material.dart';
import 'package:test_app/reverse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final myController = TextEditingController();

  String reversedString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                key: new Key('textFieldInput'),
                controller: myController,
              ),
              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('$reversedString', key: new Key('reverseText'), )
              ),
              
              FlatButton (
                key: new Key('reverseButton'),
                onPressed : () {
                    setState(() {
                      reversedString = Reverse.doit(myController.text);
                    });      
                },
                child :  Text (
                'Reverse' ,
                )),
            ],
          ),
        ),
      ),
        
    );
  }
}
