import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mokhtar_e_store/models/product.dart';
import 'package:mokhtar_e_store/viewmodels/cart_vm.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartVM>(context, listen: false);
    Product p = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(p.name),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/cart",
                  arguments: cart.items);
            },
            child: Container(
              child: Badge(
                  child: Icon(Icons.shopping_cart),
                  label: Text("${cart.items.length}")),
              margin: EdgeInsets.only(top: 10, right: 10),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(p.image),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                children: p.thumbnails
                    .map((e) => Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[300]),
                          child: Center(
                            child: Image.network(e),
                          ),
                        ))
                    .toList(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(p.brand),
                  Text(p.price.toString()),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(p.description)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cart.addItem(p);
          });
          Fluttertoast.showToast(
              msg: "product added to cart ",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
