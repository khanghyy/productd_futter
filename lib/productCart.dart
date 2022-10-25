import 'package:flutter/material.dart';
import 'package:learningproject/Cart.dart' as cartList;

class productCart extends StatefulWidget {
  const productCart({Key? key}) : super(key: key);

  @override
  State<productCart> createState() => _productCartState();
}

class _productCartState extends State<productCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ...cartList.list.map((e) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height/8,
                                width: MediaQuery.of(context).size.width/4,
                                child: Image.network(e.model.image.toString()),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(e.model.title.toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                     fontSize: 10.0,fontWeight: FontWeight.bold),
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                          text: r"$",
                                          style: TextStyle(
                                              color: Colors.blueGrey.shade800,
                                              fontSize: 10.0),
                                          children: [
                                            TextSpan(
                                              text:'${e.model.price.toString()}\n',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                          text: "Quantity:",
                                          style: TextStyle(
                                              color: Colors.blueGrey.shade800,
                                              fontSize: 10.0),
                                          children: [
                                            TextSpan(
                                              text:'${e.quantity.toString()}\n',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline_rounded,
                                  color: Color(0xFFE86969),
                                  size: 20,
                                ),
                                onPressed: () {
                                 setState(() {
                                   cartList.list.remove(e);
                                 });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey.shade900,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(5,1)
                      )
                    ]
                ),
                padding: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                    RichText(
                      maxLines: 1,
                      text: TextSpan(
                          text: r"$",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0),
                          children: [
                            TextSpan(
                              text:'${cartList.total().toStringAsFixed(2)}\n',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),

      ),
    );
  }
}
