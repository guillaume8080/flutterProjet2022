import 'dart:async';
import 'dart:convert';

import 'package:app_contact/BO/Logement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ListLogement extends StatefulWidget {


  final int idVille;
   const ListLogement(this.idVille , {Key? key}) : super(key: key);

  @override
  _ListLogementState createState() => _ListLogementState();
}

class _ListLogementState extends State<ListLogement> {

  late StreamController<List<Logement>> _streamControllerListLogements;
  late Stream<List<Logement>> _streamLogements;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text("liste de logements")),
        body: _buildList()

    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _streamControllerListLogements = new StreamController<List<Logement>>();
    _streamLogements = _streamControllerListLogements.stream;
    fetchLogements(context);

  }

  StreamBuilder<List<Logement>> _buildList() {
    return StreamBuilder<List<Logement>>(
        stream: _streamLogements,


        builder: (context, snapshot) {
          // en cas de prb
          if (snapshot.hasError) {
            return const Icon(Icons.error);
          }
          if (!snapshot.hasData) {
            //rond tournant
            return Center(child: const CircularProgressIndicator());
          }
          else {
            return ListView.separated(


              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context,
                  int index) => const Divider(/*thickness: 1.5,*/),

              // signifie qu on va boucler
              itemBuilder: (context, index) =>


              // Tu net set pas un message mais tputes la ListTile
              InkWell(

                // la reoturne la fonction
                //TODO : rediriger on onTap: () => _launchUrl(snapshot.data![index].content),
                //Ne peut rien renoyer oDoutleTap attend un argumenbt
                // onDoubleTap: _launchUrl(snapshot.data![index].content),

                // la cree une fonction , entre les crochets , qui va appeller lauchurl
                // onTap: ()  {_launchUrl(snapshot.data![index].content)},
                onTap: () => goToLogement(snapshot.data![index]),

                child: ListTile(
                  // leading:  SizedBox(child: Image.asset('assets/img.png')),
                  // Image.netWork("lien vers une image")
                  title: Center(
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(snapshot.data![index].url),
                        ),
                        Text(snapshot.data![index].title),
                        Text(snapshot.data![index].price.toString() + "/ nuit"),

                      ],
                    ),
                  ),





                ),
              ),

            );
          }
        }
    );
  }

  void fetchLogements(BuildContext context) async {
    String uriToFetch = "https://flutter-learning.mooo.com/logements?place=" +
        widget.idVille.toString();
    Future<Response> resLogements = get(

        Uri.parse(uriToFetch)

    );
    resLogements.then(

            (value) async {
          if (value.statusCode == 200) {
            String jsonBody = value.body;
            List<Logement> listLogements = List.empty(growable: true);

            for (Map<String, dynamic> arrayLogements in jsonDecode(jsonBody)) {
              

              String title = arrayLogements['title'];
              int price = arrayLogements['price'];
              Map<String, dynamic> illustrations = arrayLogements['illustrations'];
              Map<String, dynamic> formats = illustrations['formats'];
              Map<String, dynamic> thumbnail = formats['thumbnail'];
              String url = thumbnail['url'];
              Logement logement = new Logement(title, url, price);
              logement.fromBadUrlToGood();
              listLogements.add(logement);



            }


            _streamControllerListLogements.sink.add(listLogements);

          }
        }


    );
  }



  goToLogement(Logement log) {



    Navigator.of(context).pushNamed(
        "/to_Logement",

         arguments: log

    );

  }
}