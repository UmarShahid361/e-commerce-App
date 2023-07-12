import 'package:e_commerce_app/pages/profilePages/search.dart';
import 'package:e_commerce_app/pages/wishList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/CustomCard.dart';
import 'cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  List? urlImages = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Color(0xff66CC99),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Fashionary Mart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 140,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WishList()));
                        },
                        child: const Icon(
                          FontAwesomeIcons.solidHeart,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Cart()));
                        },
                        child: const Icon(
                          FontAwesomeIcons.cartShopping,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search Products Here...",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: FirebaseFirestore.instance.collection("Banners").get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = snapshot.data!.docs[index]["url"];
                      return buildImage(urlImage, snapshot.data!.docs.length);
                    },
                    options: CarouselOptions(
                      height: 200,
                      disableCenter: true,
                      enableInfiniteScroll: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildIndicator(activeIndex, snapshot.data!.docs),
                ],
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Products').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
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
                );
              }),
        ],
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );

Widget buildIndicator(int activeIndex, List count) => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count.length,
      effect: const WormEffect(
        dotColor: Colors.grey,
        activeDotColor: Color(0xff66CC99),
        dotHeight: 8,
        dotWidth: 8,
      ),
    );
