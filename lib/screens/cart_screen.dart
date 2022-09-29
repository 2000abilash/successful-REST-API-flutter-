import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:success_api/models/Cart.dart';
import 'package:success_api/services/apiServices.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String otppin="";
TextEditingController controller = TextEditingController(text: "1234");
TextEditingController phoneCodeController = TextEditingController(text: "+91");
TextEditingController phoneNoController = TextEditingController(text:"7326532868");
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
      body: Column(
        children: [
          Container(
            height: 180,
          child: ListView.builder(
              itemCount: cartobject.length,
              itemBuilder:(context,index){
                var items=cartobject[index];
                return Center(
                  child: Text("${items.productId}"),
                );
              } ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.black38),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField (
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    controller: phoneCodeController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                height: 55,
                width: 260,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.black38),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField (
                    style: TextStyle(
                      fontSize: 19,
                      letterSpacing: 2
                    ),
                    controller: phoneNoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter PhoneNo"
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          PinCodeTextField(
            autofocus: true,
            controller: controller,
            hideCharacter: false,
            pinBoxColor: Colors.white,
            pinTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black38,
            ),
            highlight: true,
            defaultBorderColor: Colors.indigo.shade200,
            highlightColor: Colors.indigo.shade700,
            maxLength: 4,
            pinBoxWidth: 55,
            pinBoxHeight: 55,
            keyboardType: TextInputType.number,
            pinBoxRadius: 6,
            // onTextChanged: ,
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
          print(controller.text);
  Navigator.pop(context);
          }, child: Text("Verify"),),
        ],
      ),
    );
  }
}
