import 'dart:async';
import 'dart:convert';

import 'package:app_contact/BO/Utilisateur.dart';
import 'package:app_contact/BO/Ville.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class ListPage extends StatefulWidget {



   ListPage({Key? key}) : super(key: key){



  }

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

   List<Utilisateur> maListe = List.empty(growable: true);

  List<Ville> listeGlobal = List.empty(growable: true);

   late StreamController<List<Ville>> _streamControllerListVilles;
   late Stream<List<Ville>> _streamVilles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("liste de villes")),
      body: _buildList()

    );
  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    /*
    * _streamControllerListMessages = new StreamController<List<Message>>();
    _streamMsgs = _streamControllerListMessages.stream;
    * */
    _streamControllerListVilles = new StreamController<List<Ville>>();
    _streamVilles = _streamControllerListVilles.stream;

     fetchVilles(context);


  }

  //itemCount : maListe.length,


   StreamBuilder<List<Ville>> _buildList() {
     return StreamBuilder<List<Ville>>(
         stream: _streamVilles,


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


                 child: ListTile(
                   // leading:  SizedBox(child: Image.asset('assets/img.png')),
                   // Image.netWork("lien vers une image")
                   title: Row(

                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(snapshot.data![index].name),
                        Image(
                         image: NetworkImage(snapshot.data![index].url),
                       )

                     ],
                   ),// Check l appareil photo pour changer ce champ si c est une image
                   //subtitle: Text('${snapshot.data![index].content}')





                 ),
               ),

             );
           }
         }
     );
   }
  void fetchVilles(BuildContext context) async{
    Future<Response> resVilles = get(

        Uri.parse("https://flutter-learning.mooo.com/villes")

    );
    resVilles.then(

            (value) async {
              if (value.statusCode == 200) {
                String jsonBody = value.body;
                List<Ville> lsVilles = List.empty(growable: true);

                for (Map<String, dynamic> vil in jsonDecode(jsonBody)) {



                  var name = vil['name'];
                  Map<String, dynamic> pic = vil['pic'];
                  Map<String, dynamic> formats = pic['formats'];
                  Map<String, dynamic> thumbnail = formats['thumbnail'];
                  String url = thumbnail['url'];
                  Ville villeDansBoucle = new Ville(name,url) ;
                  villeDansBoucle.fromBadUrlToGood();
                  lsVilles.add(villeDansBoucle);

                }

                _streamControllerListVilles.sink.add(lsVilles);


                //  listToProvideToSink = lsVilles;
                // Future<Ville> x =  Future.value(lsVilles);



              }
            }


    );

    // return    Future.delayed(const Duration(seconds: 0), () => listToProvideToSink);


  }
}
