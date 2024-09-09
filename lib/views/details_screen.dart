import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mokhtar_e_store/models/product.dart';
import 'package:mokhtar_e_store/viewmodels/products_vm.dart';

class DetailsScreen extends StatefulWidget {
  late Product p;
  DetailsScreen({Key? key, required this.p}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String imgPath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //p= ModalRoute.of(context)!.settings.arguments as Product;
    imgPath = widget.p.image;
  }

  @override
  Widget build(BuildContext context) {
    print("the image is ${widget.p.thumbnails[0]}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.p.name),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/cart",
                  arguments: ProductsVM.cartItems);
            },
            child: Container(
              child: Badge(
                  child: Icon(Icons.shopping_cart),
                  label: Text("${ProductsVM.cartItems.length}")),
              margin: EdgeInsets.only(top: 10, right: 10),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imgPath),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                children: widget.p.thumbnails
                    .map((e) => InkWell(
                          onTap: () {
                            imgPath = e;
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[300]),
                            child: Center(
                              child: Image.network(e),
                            ),
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
                  Text(widget.p.brand),
                  Text(widget.p.price.toString()),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(widget.p.description)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ProductsVM.addToCart(p: widget.p, qty: 1);
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
