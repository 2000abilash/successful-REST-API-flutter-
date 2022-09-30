import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:success_api/widgets/openWebUrlLauncher.dart';

import 'package:success_api/screens/productdetail.dart';
import 'package:success_api/services/apiServices.dart';
import '../models/AllProduct.dart';
import '../services/auth_service.dart';
import '../widgets/mailUrlLauncher.dart';
import '../widgets/phoneUrlLauncher.dart';
import '../widgets/shareFiles.dart';
import '../widgets/shimmer_widget.dart';
import '../widgets/smsUrlLauncher.dart';
import 'all_category.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GoogleSignIn _googleSignIn = GoogleSignIn();

  List<AllProduct> allProducts =<AllProduct>[];

  //this tempAllProducts used for store temporary search in the searchbar
  List<AllProduct> tempAllProducts =<AllProduct>[];

  var isLoaded = true;
  var isError=false;
  var phoneNo = '+91 6379645611';
  @override
  void initState(){
    super.initState();
    getAllProducts();
    print("Hello buddy ${getAllProducts()}");
  }
  getAllProducts() async {
    allProducts = (await RemoteService().getAllProducts())!;
    tempAllProducts = allProducts;
    print("SEARCH ${tempAllProducts}");

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
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child:Column(
            children: [
              SizedBox(height: 80,),
              Container(
                height: 130,
                width: 130,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL.toString()),
                ),
              ),
              SizedBox(height: 30,),
              Text(FirebaseAuth.instance.currentUser!.displayName.toString(),
              style: TextStyle(
                fontSize: 22,fontWeight: FontWeight.w600,
              ),),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: ()async{
                        await _googleSignIn.signOut();
                        await FirebaseAuth.instance.signOut();
                      },
                      child: Text("SignOut")),
                  SizedBox(width: 20,),
                  ElevatedButton(
                      onPressed: ()async{
                        AuthService().signOut();
                      },
                      child: Text("Logout")),
                ],
              ),
              SizedBox(height: 16,),
              Text(FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w400,
                ),),
              SizedBox(height: 30,),
              Text("RunTime Type :  ${FirebaseAuth.instance.currentUser!.runtimeType.toString()}",
                style: TextStyle(
                  fontSize: 13,fontWeight: FontWeight.w400,
                ),),
SizedBox(height: 20,),
              PhoneUrlLauncher(),
              SizedBox(height: 20,),
              SmsUrlLauncher(),
              SizedBox(height: 20,),
              MailUrlLauncher(),
              SizedBox(height: 20,),
              WebUrlLauncher(),
              SizedBox(height: 20,),
              ShareButtonWidget(),
            ],
          ),
        ),
       appBar: AppBar(
         title: Text("Home"),
         backgroundColor: Colors.redAccent,
           actions: [
             Container(
               height:40,
               width: 40,
             margin: EdgeInsets.symmetric(vertical: 10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
               // color: Colors.green,
             ),
               child: InkWell(
                 child: CircleAvatar(
                   backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL.toString()),
                 ),
                 onTap: () async {
                   _signOut(context);
                 },
               ),
             ),
             IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>AllCategory()));
             },
                 icon: Icon(Icons.view_list)),
             IconButton(onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen()));
             },
                 icon: Icon(Icons.numbers_outlined))
           ],
       ),

        body:Column(
          children: [

            //Search starts from here

            Container(
  padding: EdgeInsets.all(15),
  child: TextField(
    textInputAction: TextInputAction.search,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: Colors.black38,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.indigoAccent,
        ),
      ),
      suffixIcon: InkWell(
        child: Icon(Icons.search),
      ),
      contentPadding: EdgeInsets.all(15),
      hintText: "Search",
    ),
    onChanged: (e){
      if(e.isEmpty){
   tempAllProducts=allProducts;
        }else{

       tempAllProducts=[];
        for (var i in allProducts) {
print(i.title);
          if(i.title!.toLowerCase().contains(e.toLowerCase())){
            tempAllProducts.add(i);

          }
        }
      }

    setState((){
      });
    },

  ),
),

            //search ends here

            isLoaded?
            ShimmerWidget()
                :isError?Text("Something went wrong"):

            //Refresh Indicator which is wrapping the listView
            RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(milliseconds: 200),(){
                  setState((){
                    isLoaded=true;
                    Future.delayed(Duration(seconds: 2),(){
                      isLoaded=false;
                      getAllProducts();
                    });
                  });
                });
              },
              child: Container(
                height: 640,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: tempAllProducts.length,
                    itemBuilder: (BuildContext context,index){
                      var items=tempAllProducts[index];
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
                                  child: Hero(tag: index.toString(),
                                      child: Image.network("${items.image}",fit: BoxFit.fill,)),
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
            ),
          ],
        ),


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

_signOut(BuildContext context) {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to LogOut / GSignOut this App ?'),
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
                "No",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          child: Container(
            // color: Colors.white,
            height: 40,
            width: 40,
            child: Lottie.asset("assets/images/logout_logo.json",
                fit: BoxFit.cover
            ),
          ),
          onTap: () async {
            AuthService().signOut();
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 16),
        InkWell(
          child: Container(
            // color: Colors.white,
            height: 40,
            width: 40,
            child: Lottie.asset("assets/images/google_logo.json",
                fit: BoxFit.cover
            ),
          ),
          onTap: () async {
            await _googleSignIn.signOut();
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
