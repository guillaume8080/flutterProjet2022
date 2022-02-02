
import 'ImageBnb.dart';

class Ville{

  late String name;

  late String url;

  Ville(this.name, this.url );

  void fromBadUrlToGood(){

    String uriBad = this.url;
    String finalUri = uriBad.replaceAll("/uploads/", "https://flutter-learning.mooo.com/uploads/");
    this.url = finalUri;

  }





  /*fromJsonIteration(Map<String, dynamic> json , int i ){

    this.name = json['[' +  i.toString() + ']' + 'name'];
    this.Uripic = json[ i.toString() + 'pic.formats.thumbnail.url'];

  }*/




  


  /*Uri fromStringToUri(){

    return this.UriDefinitive = Uri.parse(this.Uripic);

  }*/



}