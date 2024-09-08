import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mokhtar_e_store/models/product.dart';
import 'package:mokhtar_e_store/viewmodels/cart_vm.dart';
import 'package:mokhtar_e_store/viewmodels/products_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsVM pVM = ProductsVM();
  List<int> fav = [];
  bool f = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartVM>(context);
    List<Product> allProducts = pVM.loadAllProducts();
    return Scaffold(
        // drawer: Drawer(),
        appBar: AppBar(
          // automaticallyImplyLeading: false,

          actions: [
            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, "/cart", arguments: cart.items),
              child: Container(
                child: Badge(
                    child: Icon(Icons.shopping_cart),
                    label: Text("${cart.items.length}")),
                margin: EdgeInsets.only(top: 10, right: 10),
              ),
            ),
          ],
          title: Text("Home Screen"),
        ),
        body: ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(ctx, "/details",
                      arguments: allProducts[index]);
                  // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(),settings: RouteSettings(arguments: allProducts[index])));
                },
                child: Card(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.network(allProducts[index].image),
                          Positioned(
                              right: -30,
                              top: 20,
                              child: Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.horizontal(
                                            start: Radius.circular(20)),
                                    color: Colors.red),
                                child: Center(
                                  child: Text(
                                    '20%',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Positioned(
                              left: -20,
                              top: 20,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (f) {
                                      f = false;
                                    } else {
                                      f = true;
                                    }
                                    if (f) {
                                      fav.add(index);
                                    } else {
                                      fav.remove(index);
                                    }
                                  });
                                },
                                icon: fav.contains(index)
                                    ? Icon(
                                      
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                      ),
                              ))
                        ],
                      ),
                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              setState(() {
                                cart.addItem(allProducts[index]);
                              });
                              Fluttertoast.showToast(
                                  msg: "product added to cart ",
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                            },
                            icon: Icon(Icons.add_shopping_cart)),
                        subtitle: Text(allProducts[index].brand),
                        title: Text(allProducts[index].name),
                        trailing: Text("${allProducts[index].price}"),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
