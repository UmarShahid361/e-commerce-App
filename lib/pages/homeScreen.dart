import 'package:e_commerce_app/pages/cart.dart';
import 'package:e_commerce_app/pages/profilePages/search.dart';
import 'package:e_commerce_app/pages/wishList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  final urlImages = [
    "assets/kakashi.jpeg",
    "assets/pain.jpeg",
    "assets/kakashi.jpeg",
    "assets/pain.jpeg",
  ];
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
              CarouselSlider.builder(itemCount: urlImages.length, itemBuilder: (context, index, realIndex){
                final urlImage = urlImages[index];
                return buildImage(urlImage, index);
              }, options: CarouselOptions(height: 200, autoPlay: true, onPageChanged: (index, reason){
                setState(() {
                  activeIndex = index;
                });
              },
              ),),
              const SizedBox(
                height: 10,
              ),
              buildIndicator(activeIndex, urlImages),
              const SizedBox(
                height: 10,
              ),
              Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Image(
                                  image: AssetImage("assets/kakashi.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                              margin: const EdgeInsets.all(4),
                              ),
                              const Expanded(
                                child: Image(
                                  image: AssetImage("assets/pain.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Naruto",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "20\$",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text('40\$',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text('(50% off)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff66CC99),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   const Icon(
                                    FontAwesomeIcons.creditCard,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  const Text('Cash on Delivery',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  Container(
                                    width: 2,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.truckFast,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  const Text('Free Shipping',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                    width: 130,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: const Color(0xff66CC99),
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Text(
                                      "View Product",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  ]
                              )
                            ],
                          )
                        ],
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(urlImage, fit: BoxFit.cover,),
    );

Widget buildIndicator(int activeIndex, List urlImages) => AnimatedSmoothIndicator(activeIndex: activeIndex, count: urlImages.length, effect: const WormEffect(
  dotColor: Colors.grey,
  activeDotColor: Color(0xff66CC99),
  dotHeight: 8,
  dotWidth: 8,
),
);
