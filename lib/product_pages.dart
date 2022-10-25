import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learningproject/model/ProductModel.dart';
import 'package:learningproject/productCart.dart';
import 'package:learningproject/product_detail.dart';
import 'package:learningproject/provider/ProductProvider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'Cart.dart' as cart;

class ProductPages extends StatefulWidget {
  const ProductPages({Key? key}) : super(key: key);

  @override
  State<ProductPages> createState() => _ProductPagesState();
}

int _counter = 0;
bool isGridview = false;
bool isLoading = false;

class _ProductPagesState extends State<ProductPages> {
  String? searchInput;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    (() async {
      if (!isLoading) {
        await productProvider.getList();
        setState(() {
          isLoading = true;
        });
      }
    })();

/*    searchInput == null
        ? productProvider.search("")
        : productProvider.search(searchInput!);*/
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Stuff'),
          actions: [
            Flexible(
              child: Theme(
                data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: TextField(
                  onChanged: (searchInput){
                    (() async {
                      await productProvider.getList();
                      setState(() {
                        productProvider.search(searchInput);
                      });
                    })();
                  },
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width/3,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search...',
                    suffixIcon: Icon(Icons.search),
                    contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isGridview = !isGridview;
                  });
                },
                icon:
                    isGridview ? Icon(Icons.grid_view) : Icon(Icons.view_list)),
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
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        // do something
                        return productCart();
                      }));
                    },
                    child: Icon(Icons.shopping_cart))),
          ],
          backgroundColor: Colors.black,
        ),
        body: isGridview
            ? Container(
                child: ListView(
                  children: [
                    ...productProvider.list.map((e) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            // do something
                            return productDetail(
                              product: e,
                            );
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        child: Card(
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.network(
                                  e.image.toString(),
                                  height: 90,
                                  width: 90,
                                ),
                                SizedBox(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        e.title.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        maxLines: 2,
                                      ),
                                      RichText(
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: 'Category: ',
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade800,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${e.category.toString()}\n',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ]),
                                      ),
                                      RichText(
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: 'Price: ' r"$",
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade800,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${e.price.toString()}\n',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.blueGrey.shade900),
                                    onPressed: () {
                                      setState(() {
                                        _counter++;
                                        cart.add(e, 1);
                                      });
                                    },
                                    child: Icon(Icons.shopping_cart),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              )
            : Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemCount: productProvider.list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: Offset(5, 1))
                            ]),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              // do something
                              return productDetail(
                                product: productProvider.list[index],
                              );
                            }));
                          },
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Image.network(
                                            productProvider.list[index].image
                                                .toString(),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          productProvider.list[index].title
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          productProvider.list[index].price
                                                  .toString() +
                                              " \$",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade700,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                            topLeft: Radius.circular(15))),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _counter++;
                                            cart.add(
                                                productProvider.list[index], 1);
                                          });
                                        },
                                        icon: Icon(Icons.shopping_cart)),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ));
  }
}
