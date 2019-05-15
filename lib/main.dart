import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _snackBarIsDisplayed = false;

  Widget _buildScaffoldBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 8.0,
            child: Padding(
              child: Text(
                'Touch the coal to receive it\'s wisdom!',
                style: TextStyle(color: Colors.white),
              ),
              padding: const EdgeInsets.all(8.0),
            ),
            color: Colors.deepPurple,
          ),
          GestureDetector(
            onTap: () {
              final snackBar = SnackBar(
                backgroundColor: Colors.purple,
                content: Text(
                    'You\'re not poor! Rich or poor is not about money, but about a state of mind!'),
              );

              if (!_snackBarIsDisplayed) {
                _scaffoldKey.currentState
                    .showSnackBar(snackBar)
                    .closed
                    .then((reason) {
                  _snackBarIsDisplayed = false;
                });
                _snackBarIsDisplayed = true;
              } else {
                _scaffoldKey.currentState.removeCurrentSnackBar();
                _snackBarIsDisplayed = false;
              }
            },
            child: Image(
              image: AssetImage('images/icons8-coal-100.png'),
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purpleAccent[100],
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Am I Poor?'),
          backgroundColor: Colors.deepPurple,
        ),
        body: _buildScaffoldBody(),
      ),
    );
  }
}
