import 'dart:io';

import 'package:flutter/material.dart';
import 'package:success_api/screens/productdetail.dart';
import 'package:success_api/services/apiServices.dart';

import '../models/AllProduct.dart';
import 'all_category.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AllProduct> allProducts =<AllProduct>[];
  var isLoaded = true;
  var isError=false;
  @override
  void initState(){
    super.initState();
    getAllProducts();
  }
  getAllProducts() async {
    allProducts = (await RemoteService().getAllProducts())!;

    //This null from api else return value

    if (allProducts==null){
      isError=true;
    }
    setState((){
      isLoaded=false;

    });
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return _onBackPressed(context);
      },
      child: Scaffold(
       appBar: AppBar(
         title: Text("Home"),
         backgroundColor: Colors.redAccent,
           actions: [
             IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>AllCategory()));
             },
                 icon: Icon(Icons.view_list)),
             IconButton(onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen()));
             },
                 icon: Icon(Icons.shopping_cart))
           ],
       ),

        body: isLoaded?Center(
          child: CircularProgressIndicator(),
        ):isError?Text("Something went wrong"):
       ListView.builder(
           itemCount: allProducts.length,
           itemBuilder: (BuildContext context,index){
             var items=allProducts[index];
             // return ListTile(
             //   title: Text("${items.title}"),
             //   leading: Image.network("${items.image}",height: 50,width: 30,),
             //   subtitle:
             //   onTap: (){
             //     Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetail(id: items.id,)));
             //   },
             // );
             
             return InkWell(
               child: Container(
                 height: 130,
                 width: double.infinity,
                 margin: EdgeInsets.symmetric(vertical: 16),
                 child: Card(
                   child:Row(
                     children: [
                       Container(
                         height: 110,
                         width: 80,
                         margin: EdgeInsets.symmetric(horizontal: 10),
                         child: Image.network("${items.image}",fit: BoxFit.fill,),
                       ),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               margin: EdgeInsets.symmetric(vertical: 20),
                               width: 240,
                               child: Text("${items.title}",
                               ),
                             ),
                             Text("Price - \$ ${items.price}"),
                           ],
                         ),
                       )
                     ],
                   ) ,
                 ),
               ),
               onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetail(id: items.id,)));
      },
             );
           }),

      ),
    );
  }
}


_onBackPressed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to exit this App'),
      actions: <Widget>[
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.green,
              border: Border.all(width: 2,color: Colors.green.shade400)
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Text(
                "NO",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 2,color: Colors.deepOrange.shade400),
            color: Colors.deepOrangeAccent,
          ),
          child: InkWell(
            onTap: () {
              exit(0);
            },
            child: const Center(
              child: Text(
                "YES",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // decoration: ,
        ),
      ],
    ),
  );
}