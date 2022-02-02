import 'package:app_contact/BO/Utilisateur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {



   ListPage({Key? key}) : super(key: key){



  }

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<Utilisateur> maListe = List.empty(growable: true);
  // List<Message> lsMsgs = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("liste de contacts")),
      body: buildLaList()

    );
  }

  @override
  void initState() {
    // TODO: implement initState

    Utilisateur u1 = new Utilisateur("antoine", "bernard", "065432123");
    Utilisateur u2 = new Utilisateur("toto", "tata", "065432123");
    Utilisateur u3 = new Utilisateur("xxxx", "yyyy", "065432123");

   maListe.add(u1);
    maListe.add(u2);
    maListe.add(u3);




    super.initState();
  }

  //itemCount : maListe.length,

  Widget buildLaList(){

    return ListView.builder(
      itemCount: maListe.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              Text(maListe[index].prenom + " "),
              Text(maListe[index].nom + " ")
            ],
          ),

        );
      },
    );
  }
}
