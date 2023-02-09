import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/product.dart';
import 'package:http/http.dart';

class ProductPage extends StatelessWidget {
  final int id;
  const ProductPage(this.id,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Produit"),),
      //https://fakestoreapi.com/products/1
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Response>(
          future: get(Uri.parse("https://fakestoreapi.com/products/$id")),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data?.body != null) {
              Product product = Product.fromJson(jsonDecode(snapshot.data!.body));
              return Column(
                children: [
                  Hero(
                      tag: product.id,
                      child: Image.network(product.imageUrl, height: 300.0,)),
                  Text(product.name, style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,),
                  Text(product.description),
                ],);
            }
            else return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
