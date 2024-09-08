import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/models/product.dart';
import 'package:mokhtar_e_store/viewmodels/cart_vm.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int x = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartVM>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart screen"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text('Delete cart'),
                        content: Text('Do you want to remove all cart items'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  cart.items.clear();
                                });
                                Navigator.pop(ctx);
                              },
                              child: Text('Yes')),
                          TextButton(
                              onPressed: () => Navigator.pop(ctx),
                              child: Text('Cancel')),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.remove_shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: ListView.separated(
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, index) {
                    return buildCartList(cart.items[index].keys.first,
                       cart.items[index].values.first);
                  }),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Items :",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${cart.items.length}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "amount",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${CartVM.calcTotalAmount(cart.items).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreenAccent[400]),
                    child: Center(
                      child: Text("Order Now"),
                    ),
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height * 1 / 3,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple),
            )
          ],
        ),
      ),
    );
  }

  buildCartList(Product p, int qty) {
    return Container(
      height: 80,
      child: Center(
        child: ListTile(
          leading: SizedBox(
            width: MediaQuery.of(context).size.width * 1 / 4,
            child: Row(
              children: [
                InkWell(
                    onTap: () => setState(() {}),
                    child: Icon(
                      Icons.highlight_remove,
                      color: Colors.red,
                    )),
                Image.network(p.image),
              ],
            ),
          ),
          title: Text(p.name),
          trailing: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              Text(p.price.toString()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        x +=qty;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightGreenAccent[400],
                      ),
                      child: Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                  ),
                  Text('$x'),
                  InkWell(
                    onTap: (){
                      if(x>1){
                      setState(() {
                        x -= qty;
                      });
                    }
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightGreenAccent[400],
                      ),
                      child: Icon(
                        Icons.remove,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
