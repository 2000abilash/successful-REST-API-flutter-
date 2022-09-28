import 'package:flutter/material.dart';
import 'package:success_api/services/apiServices.dart';

import '../widgets/allCategoryShimmer.dart';
import 'category_product.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  var isLoaded = true;
  var isError = false;
  var allCategory;
  @override
  void initState(){
    super.initState();
    getAllCategory();
  }
  getAllCategory() async {
    allCategory = await RemoteService().getAllCategory();
    if(allCategory == null){
      isError=true;
    }
    setState((){
      isLoaded = false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body:
      isLoaded?
      CategoryShimmerWidget():ListView.builder(
          itemCount:allCategory.length,
          itemBuilder: (context,index){
            var items =allCategory[index].toString().toUpperCase();
            return InkWell(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Card(
                    child: Container(
                        height: 80,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(items,style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400
                          ),),
                        )
                    ),
                  ),
                ],
              ),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryProductScreen(id:index)));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryProductScreen(categoryname:allCategory[index])));
              },
            );
          }, )
    );
  }
}
