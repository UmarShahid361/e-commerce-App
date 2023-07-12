import 'package:e_commerce_app/pages/cart.dart';
import 'package:e_commerce_app/pages/profilePages/search.dart';
import 'package:e_commerce_app/pages/wishList.dart';
import 'package:e_commerce_app/widgets/CustomCard.dart';
import 'package:e_commerce_app/widgets/simpleLine.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final fireStore =
      FirebaseFirestore.instance.collection('Single Pieces').snapshots();
  String? item;
  final List<bool> _expandedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  bool click1 = true;
  bool click2 = true;
  bool click3 = true;
  bool index = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: const Icon(FontAwesomeIcons.magnifyingGlass, size: 18),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WishList()));
            },
            child: const Icon(FontAwesomeIcons.solidHeart, size: 18),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
            child: const Icon(FontAwesomeIcons.cartShopping, size: 18),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = true;
                        click1 = true;
                        click2 = true;
                        click3 = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (click1 == false)
                            ? Colors.white
                            : const Color(0xffCCCCCC),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Single Pieces",
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(
                              FontAwesomeIcons.circleArrowRight,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomLine(length: MediaQuery.of(context).size.width),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = false;
                        click1 = false;
                        click2 = false;
                        click3 = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (click2 == false)
                            ? const Color(0xffCCCCCC)
                            : Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "WholeSale \nCatalog",
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(
                              FontAwesomeIcons.circleArrowRight,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomLine(length: MediaQuery.of(context).size.width),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = false;
                        click1 = false;
                        click2 = true;
                        click3 = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (click3 == true)
                            ? Colors.white
                            : const Color(0xffCCCCCC),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "WholeSale \nNon-Catalog",
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(
                              FontAwesomeIcons.circleArrowRight,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomLine(length: MediaQuery.of(context).size.width),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Builder(builder: (context) {
                    index;
                    return index == true
                        ? ListView(
                            children: [
                              _buildExpandableList(0, 'Saree', [
                                'Daily Wear Saree',
                                'Printed Saree',
                                'Cotton Saree',
                                'Silk Saree',
                                'All Saree'
                                // Add more sarees here
                              ]),
                              _buildExpandableList(1, 'Gowns', [
                                'Gown 1',
                                'Gown 2',
                                'Gown 3',
                                // Add more gowns here
                              ]),
                              _buildExpandableList(2, 'Westerns', [
                                'Western 1',
                                'Western 2',
                                'Western 3',
                                // Add more westerns here
                              ]),
                              _buildExpandableList(3, 'Dress Material', [
                                'Dress Material 1',
                                'Dress Material 2',
                                'Dress Material 3',
                                // Add more dress materials here
                              ]),
                              _buildExpandableList(4, 'Lehengas', [
                                'All Lehengas',
                              ]),
                              _buildExpandableList(5, 'Kurti', [
                                'Printed Kurti',
                                'Designer Kurti',
                                'All Kurti',
                                // Add more kurtis here
                              ]),
                              _buildExpandableList(6, 'Top with Bottom', [
                                'Kurti Plazo',
                                'All Top with Bottom',
                                // Add more tops with bottoms here
                              ]),
                            ],
                          )
                        : Lottie.asset('assets/146399-isometric-box.json',
                            height: 400, width: 400, repeat: false);
                  }),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableList(int index, String header, List<String> items) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 500),
      elevation: 1,
      expandedHeaderPadding: const EdgeInsets.all(8),
      expansionCallback: (int panelIndex, bool isExpanded) {
        setState(() {
          _expandedList[index] = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Center(
                child: Text(
                  header,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
          body: Column(
            children: items.map((String item) {
              return GestureDetector(
                onTap: () {
                  _navigateToProductList(item);
                },
                child: ListTile(
                  title: Center(child: Text(item)),
                ),
              );
            }).toList(),
          ),
          isExpanded: _expandedList[index],
        ),
      ],
    );
  }

  void _navigateToProductList(String item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductList(item: item),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final String item;
  final String collectionPath = 'Products';
  final String subCollectionPath = 'variants';
  ProductList({Key? key, required this.item}) : super(key: key);

  final fireStore = FirebaseFirestore.instance.collectionGroup("variants").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(item),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(collectionPath).where('category', isEqualTo: item).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                  return CustomCard(
                    id: snapshot.data!.docs[index].id,
                    title: snapshot.data!.docs[index]['title'],
                    price: snapshot.data!.docs[index]['price'],
                    discountedPrice: snapshot.data!.docs[index]
                        ['discountedPrice'],
                    OFF: snapshot.data!.docs[index]['off'],
                    url: snapshot.data!.docs[index]['imageURL'],
                    description: snapshot.data!.docs[index]['description'],
                  );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
