import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/models/product.dart';
import 'package:mokhtar_e_store/viewmodels/cart_vm.dart';

class CartScreen extends StatelessWidget {
  late List<Map<Product, int>> cart;
  CartScreen({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart screen"),
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
                  itemCount: cart.length,
                  itemBuilder: (ctx, index) {
                    return buildCartList(
                        cart[index].keys.first, cart[index].values.first);
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
                        "Tota Items :",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${cart.length}",
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
                        "${CartVM.calcTotalAmount(cart).toStringAsFixed(2)}",
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
                        color: Colors.green),
                    child: Center(
                      child: Text("Order Now"),
                    ),
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height * 1 / 3,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  buildCartList(Product p, int qty) {
    return ListTile(
      leading: Image.network(p.image),
      title: Text(p.name),
      trailing: Text(p.price.toString()),
      subtitle: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: 20,
              height: 20,
              child: Center(
                child: Text("+"),
              ),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            ),
            Text(qty.toString()),
            Container(
              margin: EdgeInsets.all(5),
              width: 20,
              height: 20,
              child: Center(
                child: Text("-"),
              ),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
