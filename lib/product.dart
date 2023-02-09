class Product{
  int id;
  String name;
  String description;
  String imageUrl;
  num price = 0;


  Product(this.id,this.name, this.description, this.imageUrl, this.price);

  String showPrice() => '$price €';

  Product.fromJson(Map<String,dynamic> json)
      : name = json["title"],
        description = json["description"],
        imageUrl = json["image"],
        id = json["id"],
        price = json["price"];
}