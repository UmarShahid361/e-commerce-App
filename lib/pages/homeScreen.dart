import 'package:e_commerce_app/pages/cart.dart';
import 'package:e_commerce_app/pages/profilePages/search.dart';
import 'package:e_commerce_app/pages/wishList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/CustomCard.dart';

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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff66CC99),
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0.0,
        title: const Text("Fashionary Mart"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WishList()));
            },
            child: const Icon(FontAwesomeIcons.solidHeart, size: 22),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
            child: const Icon(FontAwesomeIcons.cartShopping, size: 22),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: Color(0xff66CC99),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                  return Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = snapshot.data!.docs[index]["url"];
                          return buildImage(
                              urlImage, snapshot.data!.docs.length);
                        },
                        options: CarouselOptions(
                          height: 200,
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
              const CustomCard(
                  title: "Neji", discountedPrice: "40", price: "80", OFF: "50"),
              const SizedBox(
                height: 5,
              ),
              const CustomCard(
                  title: "Sasuke",
                  discountedPrice: "200",
                  price: "340",
                  OFF: "40"),
            ],
          ),
        ),
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
