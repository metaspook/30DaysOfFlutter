import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  // State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = 'AlterLink';
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // final catalogJson =
    // await rootBundle.loadString('assets/files/catalog.json');
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      // backgroundColor: Theme.of(context).canvasColor, // without VelocityX
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _, __) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red500,
            size: 22,
            count: _cart.items.length,
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
