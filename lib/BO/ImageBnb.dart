/* String url;*/

class ImageBnb {

  String url;

  ImageBnb(this.url);

  void ChangeUrl(){

    this.url = this.url.replaceAll("/uploads/", "https://flutter-learning.mooo.com/uploads/thumbnail_");

  }
}