import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/page/home_page.dart';
import 'package:hello_world/page/product_page.dart';
import 'package:hello_world/product.dart';
import 'package:http/http.dart';

import 'list_view_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage(title: "Amazone");
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'product/:id',
            builder: (BuildContext context, GoRouterState state) {
              return ProductPage(int.parse(state.params["id"]!));
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routerConfig: _router,
    );
  }
}
