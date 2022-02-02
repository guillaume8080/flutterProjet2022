class Logement {

  late String title;

  late String url;

  late int price ;

  Logement(this.title, this.url , this.price);

  void fromBadUrlToGood(){

    String uriBad = this.url;
    String finalUri = uriBad.replaceAll("/uploads/", "https://flutter-learning.mooo.com/uploads/");
    this.url = finalUri;

  }
}