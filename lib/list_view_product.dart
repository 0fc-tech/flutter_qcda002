import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/product.dart';

class ListViewProducts extends StatelessWidget {
  final List<Product> listProducts;
  const ListViewProducts(this.listProducts,{super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(thickness: 2.0,),
      itemCount: listProducts.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => context.go("/product/${listProducts[index].id}"),
        leading: Hero(
          tag: listProducts[index].id,
          child: Image.network(
            listProducts[index].imageUrl,
            width: 80.0,
            height: 80.0,
          ),
        ),
        title: Text(listProducts[index].name),
      ),
    );
  }
}
