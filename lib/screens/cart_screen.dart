import 'package:flutter/material.dart';
import 'package:success_api/models/Cart.dart';
import 'package:success_api/services/apiServices.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<Cart> cartobject =[];
  @override
  initState() {
    super.initState();
    cartDetail();
    print(cartobject);
  }

  Future<void> cartDetail() async {

    cartobject= (await RemoteService().getCart("2"))!;
   setState((){});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Products"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: cartobject.length,
          itemBuilder:(context,index){
            var items=cartobject[index];
            return Center(
              child: Text("${items.productId}"),
            );
          } ),
    );
  }
}
