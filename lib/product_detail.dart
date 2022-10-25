import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:learningproject/model/ProductModel.dart';
import 'package:learningproject/productCart.dart';
import 'Cart.dart' as cart;
class productDetail extends StatefulWidget {
  const productDetail({Key? key, required this.product}) : super(key: key);
  final ProductModel product ;

  @override
  State<productDetail> createState() => _productDetailState();
}
int tmp = 1;
int _counter = 0;
class _productDetailState extends State<productDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: Colors.black,
        actions: [
          Badge(
              badgeColor: Colors.blueGrey.shade900,
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                _counter.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: ElevatedButton(
                style: ButtonStyle( backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),),
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      // do something
                      return productCart();
                    }));
                  },
                  child: Icon(Icons.shopping_cart))),
        ],

      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height/2.8,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(widget.product.image.toString()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(widget.product.title.toString(),
                  style: TextStyle(
                      color: Colors.blueGrey.shade800,
                      fontSize: 25.0,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              RichText(
                maxLines: 1,
                text: TextSpan(
                    text: r"$",
                    style: TextStyle(
                        color: Colors.blueGrey.shade800,
                        fontSize: 20.0),
                    children: [
                      TextSpan(
                          text:'${widget.product.price.toString()}\n',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              SizedBox(height: 15,),
              RichText(
                text: TextSpan(
                    text: r"",
                    style: TextStyle(
                        color: Colors.blueGrey.shade800,
                        fontSize: 16.0),
                    children: [
                      TextSpan(
                          text:'${widget.product.description.toString()}\n',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0),
                         ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/3.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){if (_counter > 0)
                    setState(() {
                      _counter--;
                    if(tmp>1)tmp--;
                  });}, icon: Icon(Icons.remove)),
                  Container(
                    width: 30,
                    child: Text(tmp.toString()),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      _counter++;
                      tmp++;
                    });
                  }, icon: Icon(Icons.add)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 45,
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      primary: Colors.blueGrey.shade900),
                  onPressed: () {
                        setState(() {

                          cart.add(widget.product, tmp);
                          _counter++;
                        });
                  },
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
