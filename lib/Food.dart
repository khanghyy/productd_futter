import 'package:flutter/material.dart';
import 'package:learningproject/Form.dart';

class FoodMoblie extends StatefulWidget {
  FoodMoblie({Key? key}) : super(key: key);

  @override
  State<FoodMoblie> createState() => _FoodMoblieState();
}

class _FoodMoblieState extends State<FoodMoblie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(context),
              SizedBox(
                height: 30,
              ),
              buildWelcome(context),
              SizedBox(
                height: 10,
              ),
              buildSavePlace(context),
              buildIcon(context),
              buildPlace(context),
              builDiver(context),
              buildImage(context),
              buildSushi(context),
            ],
          ),
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  LoginPage()));
        }, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }

  buildWelcome(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "ToDay's Special",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.greenAccent,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Colors.white,
                ),
                Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildSavePlace(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Find out what's cooking today!",
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  buildIcon(BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin:const EdgeInsets.only(left:10, right:20,top: 15,bottom:20),
              width: MediaQuery.of(context).size.width*4.5/8,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                ),

                child:Container(

                    child:Column(
                      children: [
                        Image(
                          image: AssetImage("asset/images/Picture1.png"),
                          height: 130,
                        ),
                        Text("Yoshisama Sushi"),
                        Row(
                          children: [
                            Icon(Icons.star,size: 10),
                            Icon(Icons.star,size: 10),
                            Icon(Icons.star,size: 10),
                            Icon(Icons.star,size: 10),
                            Icon(Icons.star,size: 10),
                            Text("250 Ratings",style:TextStyle(
                              fontSize: 10,
                            ),),

                          ],
                        ),
                        Text("Loream ipsum is a dummy text used for printing"),

                      ],
                    )
                ),
              ),

            ),
            Expanded(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    child:Container(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("asset/images/Picture7.png"),
                              height: 100,
                            ),
                            Text("Yoshisama Sushi"),
                            Row(
                              children: [
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    child:Container(
                        child:Column(
                          children: [
                            Image(
                              image: AssetImage("asset/images/Picture6.png"),
                              height: 100,
                            ),
                            Text("Prato Sushi"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                                Icon(Icons.star,size: 10),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildPlace(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
        "Places",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      ),
    ]
    );
  }

  builDiver(BuildContext context) {
    return const Divider(
      height: 2,
      thickness: 1,
      indent: 100,
      endIndent: 0,
      color: Colors.black,
    );
  }

  buildImage(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: IntrinsicHeight(
        child: Row(
        children: [
          Image(
            image: AssetImage("asset/images/Picture3.png"),
            height: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SuShi Đen"),
              Row(
                children: [
                  Icon(Icons.star,size: 15,color: Colors.yellow),
                  Icon(Icons.star,size: 15,color: Colors.yellow),
                  Icon(Icons.star,size: 15,color: Colors.yellow),
                  Icon(Icons.star,size: 15,color: Colors.yellow),
                  Icon(Icons.star,size: 15,color: Colors.yellow),
                ],
              ),
              Text("Loream ipsum is a dummy text used for printing",style:TextStyle(
                fontSize: 9,
              ),),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.greenAccent,
            ),
            child: Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: [
                  Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
  }

  buildSushi(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),

      child: IntrinsicHeight(
        child: Row(
          children: [
            Image(
              image: AssetImage("asset/images/Picture3.png"),
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hatshuhana Sushi"),
                Row(
                  children: [
                    Icon(Icons.star,size: 15,color: Colors.yellow),
                    Icon(Icons.star,size: 15,color: Colors.yellow),
                    Icon(Icons.star,size: 15,color: Colors.yellow),
                    Icon(Icons.star,size: 15,color: Colors.yellow),
                    Icon(Icons.star,size: 15,color: Colors.yellow),
                  ],
                ),
                Text("Loream ipsum is a dummy text used for printing",style:TextStyle(
                  fontSize: 9,
                ),),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.greenAccent,
              ),
              child: Container(
                padding: EdgeInsets.all(7),
                child: Row(
                  children: [
                    Text(
                      "Order Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


