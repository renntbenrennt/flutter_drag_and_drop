import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Drag drop demo'),
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
  bool showDraggable = true;

  bool dropSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.lightBlueAccent,
              height: 300,
              width: 300,
            ),
            Visibility(
              visible: showDraggable,
              child: Draggable(
                feedback: Container(
                  height: 50,
                  width: 50,
                  color: Colors.tealAccent,
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.tealAccent,
                ),
                childWhenDragging: Visibility(
                  visible: false,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.tealAccent,
                  ),
                ),
                onDragStarted: () {
                  print('starting');
                },
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: DragTarget(
                builder: (context, candidateData, rejectData) {
                  if (!dropSuccess) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                    );
                  } else {
                    return Container(
                      height: 50,
                      width: 50,
                      color: Colors.tealAccent,
                    );
                  }
                },
                onAccept: (data) {
                  print('Fuck them');
                  setState(() {
                    showDraggable = false;
                    dropSuccess = true;
                  });
                },
                onWillAccept: (data) => true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
