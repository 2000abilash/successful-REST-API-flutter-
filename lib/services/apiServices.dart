import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:success_api/constatnts_url/Constants.dart';
import 'package:success_api/models/ProductByCategory.dart';

import '../models/AllProduct.dart';
import '../models/Cart.dart';
import '../models/SingleProduct.dart';

class RemoteService {
  var client = http.Client();

  //POST (used in login)

  Future<dynamic> loginApi(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(loginUrl, body: {
      "username": username,
      "password": password,
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print("Get All Products GET Api");
      return json.decode(response.body);
    } else {
      return null;
    }
  }

//GET (all products)

  Future<List<AllProduct>?> getAllProducts() async {
    var getAllProductsUri = Uri.parse("https://fakestoreapi.com/products");
    var response = await client.get(getAllProductsUri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Get All Products GET Api");
      var output = response.body;
      return allProductFromMap(output);
    } else {
      return null;
    }
  }

//GET (single product)

  //we can't declare list because it is single product
  Future<SingleProduct?> getSingleProduct(int id) async {
    var getSingleProductUrl =
        Uri.parse("https://fakestoreapi.com/products/$id");
    var response = await client.get(getSingleProductUrl);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Get Single Product GET Api");
      var output = response.body;
      return singleProductFromMap(output);
    } else {
      return null;
    }
  }

  //GET (all category api)
  //We don't create model for this , because it is in List

  Future getAllCategory() async {
    final allCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allCategoryUrl);
    print("Get All Category GET api");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  // GET (Get products by category ,Pass Single categoryName inside of method's parameter it is the end point of the url )

  Future<List<ProductByCategory>?> getProductByCategory(String catName) async {
    List<ProductByCategory> mainlist = [];
    var getProductByCategoryUri =
        Uri.parse("https://fakestoreapi.com/products/category/$catName");
    var response = await client.get(getProductByCategoryUri);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print("Get Product by Category GET Api");
      List<dynamic> output = jsonDecode(response.body);

      for (var element in output) {
        mainlist.add(ProductByCategory.fromMap(element));

      }
      return mainlist;
    } else {
      return null;
    }
  }


  Future<List<Cart>?> getCart(String id) async {
   String url= Constants.CARTURL.replaceAll("{id}", id);
   print(url);
   var headers = {
     'Content-type': 'application/json'
   };
   final response = await http.get(Uri.parse(url),headers: headers);
   print(response.body);
   try{
     if(response.statusCode == 200 ){
       var cart=json.decode(response.body)["products"];
       //print(list);
       List<Cart> cartdata=<Cart>[];
       for(var i=0;i<cart.length; i++){
         Cart objcart = Cart.fromMap(cart[i]);

         cartdata.add(objcart);
       }
       return cartdata;
     }
     else{
       throw Exception("Failed to load all data");
     }
   }
   catch(e){
     print(e);
   }
  }

  //UPDATE (show only update message)

  Future updateCart(int userId,int productId) async {
    final updateCartUrl= Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.put(updateCartUrl,body:{
      'userId' : "$userId",
      'date' : DateTime.now().toString(),
      "products":[
        {
          "productId":"$productId",
          "quantity":"1",
        }
      ].toString(),
    });
    print(response.statusCode);
    print(response.body);

    //decode is from import 'dart:convert'; package
    return json.decode(response.body);
  }

}
