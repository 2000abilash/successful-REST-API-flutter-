import 'package:flutter/material.dart';
import 'package:success_api/screens/productdetail.dart';
import '../models/ProductByCategory.dart';
import '../services/apiServices.dart';

class CategoryProductScreen extends StatefulWidget {
  final categoryname;
  CategoryProductScreen({Key? key, this.categoryname,}) : super(key: key);


  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  List<ProductByCategory> productByCategory =<ProductByCategory>[];
  var isLoaded = true;
  var isError=false;
  @override
  void initState(){
    super.initState();
    getProductByCategory();
  }
  getProductByCategory() async {
    productByCategory = (await RemoteService().getProductByCategory(widget.categoryname))!;

    //This null from api else return value

    if (productByCategory==null){
      isError=true;
    }
    setState((){
      isLoaded=false;

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
          itemCount: productByCategory.length,
          itemBuilder: (BuildContext context,index){
            var items=productByCategory[index];
            return SingleChildScrollView(
             //  child: ListTile(
             // title: Text(items.title),
             //    leading: Image.network(items.image,height: 50,width: 30,),
             //    subtitle: Text("Price - \$" + items.price.toString()),
             //    onTap:(){
             //      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(id:items.id)));
             //    }
             //  ),
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
            );
          })
    );
  }
}
