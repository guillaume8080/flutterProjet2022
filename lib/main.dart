import 'package:app_contact/BO/Logement.dart';
import 'package:app_contact/page/ajout.dart';
import 'package:app_contact/page/list_contact.dart';
import 'package:app_contact/page/list_logement.dart';
import 'package:app_contact/page/reservation_logement.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
        onGenerateRoute: (settings){

          if(settings.name == "/to_Logements"){

            return MaterialPageRoute(builder: (context) =>

            //settings.arguments as LatLng
            ListLogement(settings.arguments as int)

            );

          }else if(settings.name == "/to_Logement"){

            return MaterialPageRoute(builder: (context) =>

            //settings.arguments as LatLng
            ReservationLogement(settings.arguments as Logement)

            );

          }


        },
      routes: <String , WidgetBuilder>{

        '/': (BuildContext context) => ListPage(),
        '/ajout': (BuildContext context) => Ajout(),




      }
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/