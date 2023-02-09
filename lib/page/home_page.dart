
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../list_view_product.dart';
import '../product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final listProducts = [
  //  Product("Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches)", "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", 15.0),
  //  Product("Mens Casual Premium Slim Fit T-Shirts ", "Slim-fitting style, contrast raglan long sleeve, th", "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", 350.0),
  //];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<Response>(
            future: get(Uri.parse("https://fakestoreapi.com/products")),
            builder: (context, snapshot) {
              if(snapshot.hasData && snapshot.data?.body != null){
                List<dynamic> listProductsJSON = jsonDecode(snapshot.data!.body);
                List<Product> listProducts = [];
                for (var element in listProductsJSON) {
                  listProducts.add(Product.fromJson(element));
                }
                return ListViewProducts(listProducts);
              }else if(snapshot.hasError){
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error,size: 64.0,),
                    Text("Erreur de connexion. Vérifiez votre Wi-fi")
                  ],
                ));
              }else{
                return Center(child: const CircularProgressIndicator());
              }
            }
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
