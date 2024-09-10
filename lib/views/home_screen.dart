import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/models/product.dart';
import 'package:mokhtar_e_store/viewmodels/products_vm.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsVM pVM = ProductsVM();
  IconData fav = Icons.favorite_border;
  late List<Product> allProducts;
  @override
  void initState() {
    allProducts = pVM.loadAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          title: Text("Home Screen"),
        ),
        body: ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/details",
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
                            left: -10,
                            top: 5,
                            child: IconButton(
                                onPressed: () {
                                  allProducts[index].isFav =
                                      !allProducts[index].isFav ? true : false;
                                  setState(() {});
                                },
                                icon: Icon(
                                  allProducts[index].isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                )),
                          ),
                          Positioned(
                            top: 10,
                            right: -30,
                            child: Container(
                            padding: EdgeInsets.all(10),
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                            ),child: Text('20%',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ))
                        ],
                      ),
                      // Image.network("https://storage.googleapis.com/pod_public/1300/168838.jpg"),
                      ListTile(
                        leading: InkWell(
                          onTap: () {
                            ProductsVM.addToCart(p: allProducts[index]);
                            setState(() {});
                            print(
                                "the length is ${ProductsVM.cartItems.length}");
                          },
                          child: Icon(Icons.add_shopping_cart),
                        ),
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
