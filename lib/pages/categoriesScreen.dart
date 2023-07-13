import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/pages/cart.dart';
import 'package:e_commerce_app/pages/profilePages/search.dart';
import 'package:e_commerce_app/pages/wishList.dart';
import 'package:e_commerce_app/widgets/CustomCard.dart';
import 'package:e_commerce_app/widgets/simpleLine.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MainCategoryModel{
  String mainCategory;
  String docId;
  MainCategoryModel({required this.mainCategory, required this.docId});
}
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  String? item;
  List<bool> expandedList = [];
  bool isLoadingMainCategory = true;
  bool click1 = true;
  bool click2 = true;
  bool click3 = true;
  bool index = true;
  List<MainCategoryModel> mainCategories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection("Single Piece").get().then((value) {
      for(int i = 0; i< value.docs.length; i++){
        mainCategories.add(MainCategoryModel(mainCategory: value.docs[i].data()['category'], docId: value.docs[i].id));
        expandedList.add(false);
      }
      isLoadingMainCategory = false;
      setState(() {

      });

    });
  }
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
              child: isLoadingMainCategory ?  Center(child: CircularProgressIndicator())
              : ListView(
                children: [
                  ExpansionPanelList(
                    expansionCallback: (panelIndex, isExpanded) {
                      for(int i = 0; i<expandedList.length; i++){
                        if(i != panelIndex) {
                          expandedList[i] = false;
                        }
                      }
                      expandedList[panelIndex] = !expandedList[panelIndex];
                      setState(() {

                      });
                    },
                    children: [
                      ...mainCategories.asMap().entries.map((e) =>  ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return Center(
                            child: Text(e.value.mainCategory, style:
                            TextStyle(
                              fontSize: 15,
                            ),),
                          );
                        },
                        isExpanded: expandedList[e.key],
                        body:  Column(
                          children: [
                            FutureBuilder(
                              future:  FirebaseFirestore.instance.collection("Single Piece").doc(e.value.docId).collection("subCategory").get(),
                              builder: (context, snapshotSubCategory) {
                                if(snapshotSubCategory.connectionState == ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(color: Colors.purple,));
                                }
                                if(snapshotSubCategory.hasError){
                                  return Center(child: Text(snapshotSubCategory.error.toString()),);
                                }
                                if(snapshotSubCategory.connectionState == ConnectionState.done && snapshotSubCategory.data!.docs.isEmpty){
                                  return Center(child: Text("No Sub Categories found"),);
                                }

                                return Column(
                                  children: [
                                    ...snapshotSubCategory.data!.docs.asMap().entries.map((e) {
                                      print(e.value.data()['subCategoryName']);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: Text(e.value.data()["subCategoryName"], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                                      );
                                    })
                                  ],
                                );

                              },
                            )
                          ],
                        ),
                      ))

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /*Widget _buildExpandableList(int index, String header, List<String> items) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 500),
      elevation: 1,
      expandedHeaderPadding: const EdgeInsets.all(8),
      expansionCallback: (int panelIndex, bool isExpanded) {
        setState(() {
          expandedList[index] = !isExpanded;
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
  }*/

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
