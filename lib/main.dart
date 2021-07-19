import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorBrightness: Brightness.light,
      ),
      home: MyHomePage(title: 'Reaction Time Challenge'),
    );
  }
}

class CirclePainter extends CustomPainter{
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 250, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // @override
  // _MyHomePageState createState() => _MyHomePageState();
  @override
  MyRoundButton createState() => MyRoundButton();
}

class MyRoundButton extends State<MyHomePage>{
  int counter = 0;
  var past = DateTime.now();
  var timePassed;

  void increaseCounter(){
    setState(() {
      counter++;
      timePassed = DateTime.now().millisecondsSinceEpoch - past.millisecondsSinceEpoch;
      past = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 25,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You have pressed this button:",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "$counter\n",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButton(
              child: Text(
                "",
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(100)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                  ),
              ),
              onPressed: increaseCounter,
            ),
            Text(
              "\nThis much time has passed in between your button presses:",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "\n$timePassed",
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          child: Center(
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          ),
        ),
      ),
    );
  }
}
