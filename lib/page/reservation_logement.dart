import 'package:app_contact/BO/Logement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservationLogement extends StatefulWidget {
  final Logement logement;

  const ReservationLogement(this.logement , {Key? key}) : super(key: key);

  @override
  _ReservationLogementState createState() => _ReservationLogementState();
}

class _ReservationLogementState extends State<ReservationLogement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //body: ElevatedButton(onPressed: () {}, child: Text(widget.logement.title),)
      body:

      Center(
        child: Column(
          children: [
            Spacer(),
            Image(
              image: NetworkImage(widget.logement.url),
            ),
            Text(widget.logement.title),
            const Spacer(),
            Row(
              children: [
                Text(widget.logement.price.toString() + " /nuit"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: onPressed(), child: Text("Réserver")),
                  ),
                )
              ],
            )


          ],

        ),

      ),



         );
  }

  onPressed() {}
}
