import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ajout extends StatelessWidget {

  late TextEditingController tecNom;
  late TextEditingController tecPrenom;
  late TextEditingController tecTel;


   Ajout({Key? key}) : super(key: key){

    this.tecNom = new TextEditingController();
    this.tecPrenom = new TextEditingController();
    this.tecTel = new TextEditingController();


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton:
    FloatingActionButton(
      onPressed: _enregistrer,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    )
      ,
      appBar: AppBar(title: const Text("Ajout")),
      body: Center(
        child: Column(
          children: [
            TextFormField(controller: tecNom),
            TextFormField(controller: tecPrenom),
            TextFormField(controller: tecTel),

          ],
        ),
      ),

    );
  }

  void _enregistrer() {

     String nom = tecNom.text;
     String prenom = tecPrenom.text;
     String tel = tecTel.text;
  }
}
