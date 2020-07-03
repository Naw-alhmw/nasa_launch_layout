import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: buildHomePage('NASA'),
    );
  }

  Widget buildHomePage(String title) {
    final titleText = Container(
      color: Color(0xFFFF222222),
      //padding: EdgeInsets.all(20),
      child: Text(
        'NASA',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    final subTitle = Text(
      'The National Aeronautics and Space Administration is an independent agency of the United States Federal Government responsible for the civilian space program,'
      'as well as aeronautics and space research.',
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Verdana',
        color: Colors.white,
        fontSize: 25,
      ),
    );

    var myIcons = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle, color: Colors.blue[500]),
        Icon(Icons.check_circle, color: Colors.blue[500]),
        Icon(Icons.check_circle, color: Colors.blue[500]),
        Icon(Icons.check_circle, color: Colors.white),
        Icon(Icons.check_circle, color: Colors.white),
      ],
    );

    final ratings = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myIcons,
          Text(
            '48 Astronauts ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

    final descTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        color: Color(0xFFFF222222),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.airplanemode_active, color: Colors.red[500]),
                Text('Duration'),
                Text('2 years'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.local_drink, color: Colors.red[500]),
                Text('Water'),
                Text('1 oz'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.red[500]),
                Text('Food'),
                Text('50 kg'),
              ],
            ),
          ],
        ),
      ),
    );

    final leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    final mainImage = Image.asset(
      'images/nasa.jpg',
      //TODO: uncomment the fit property
      //fit: BoxFit.cover,
    );

    return Scaffold(
      backgroundColor: Color(0xFFFF222222),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFFFF222222),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            color: Color(0xFFFF222222),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFFF222222),
                  width: 440,
                  child: leftColumn,
                ),
                Expanded(
                  //fixed an error with the documentation
                  child: mainImage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
