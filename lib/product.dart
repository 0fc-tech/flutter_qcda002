class Product{
  String name;
  String description;
  String imageUrl;
  num price = 0;


  Product(this.name, this.description, this.imageUrl, this.price);

  String showPrice() => '$price €';

  Product.fromJson(Map<String,dynamic> json)
      : name = json["title"],
        description = json["description"],
        imageUrl = json["image"],
        price = json["price"];
}