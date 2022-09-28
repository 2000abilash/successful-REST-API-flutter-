import 'package:flutter/material.dart';

import '../models/SingleProduct.dart';
import '../services/apiServices.dart';
import '../widgets/singleProductShimmerWidget.dart';
import 'homeScreen.dart';

class ProductDetail extends StatefulWidget {
  final  id;
  const ProductDetail({Key? key, this.id}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var isLoaded = true;
  var isError = false;
  late SingleProduct singleProduct;

  @override
  void initState() {
    super.initState();
    getSingleProduct();
  }

  getSingleProduct() async {
    singleProduct = (await RemoteService().getSingleProduct(widget.id))!;

    //This null from api else return value

    if (singleProduct == null) {
      isError = true;
    }
    setState(() {
      isLoaded = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded ?
      ProductDetailShimmerWidget()
          :SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              InkWell(child: Icon(Icons.arrow_back,size: 28,),onTap: (){
                Navigator.pop(context);
              },),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      child: Icon(Icons.delete,size: 40,color: Colors.red,),
                  onTap: ()async{
                       await RemoteService().deleteProduct('1');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Deleted Successfully !")));
                      Future.delayed(Duration(seconds: 2),
                          (){
                            Navigator.pop(context);
                          }
                      );
                  },
                  ),

                ],
              ),
              SizedBox(height: 30,),
              Image.network(singleProduct.image,height: 200,width: double.infinity,),
              SizedBox(height: 10,),
              Center(
                child: Text("\$" + singleProduct.price.toString(),style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: 10,),
              Text(singleProduct.title,style: TextStyle(
                fontSize: 25,
              ),),
              Chip(label: Text(singleProduct.category,style: TextStyle(
                fontSize: 15,
                color: Colors.white
              ),),
              backgroundColor: Colors.green,
              ),
              SizedBox(height: 30,),
              Text(singleProduct.description),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart_outlined),
        onPressed: () async {
          await RemoteService().updateCart(1, widget.id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added to cart")));
          Future.delayed(Duration(seconds: 2),(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          });
        },
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
