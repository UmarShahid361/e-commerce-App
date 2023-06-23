import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/pages/morePages/usefulLinks.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/cart.dart';
import '../pages/homeScreen.dart';
import '../pages/wishList.dart';

class CustomDisplay extends StatefulWidget {
  const CustomDisplay({super.key});
  @override
  State<CustomDisplay> createState() => _CustomDisplayState();
}

class _CustomDisplayState extends State<CustomDisplay> {
  int activeIndex = 0;
  int _currentIndex = 0;

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
        elevation: 0.0,
        title: const Text('Product Details'),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 200,
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
                  buildIndicator(activeIndex, urlImages),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Similar Products",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 06,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: urlImages.length,
                          itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              foregroundImage: AssetImage(urlImages[index],),
                            ),
                          );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 75,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title", style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),),
                    Row(
                      children: [
                        Text(
                          "40",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          "80",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            decoration:
                            TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '(50% off)',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff66CC99),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Available Sizes", style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text("Free Size", style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                  )
                ]
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Details", style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Disclaimer: Product color may slightly vary due to photographic lighting sources or your monitor settings.", style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.moneyBill,
                        size: 24,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text("Cash on Delivery", style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.recycle,
                        size: 24,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text("  Defective\n  Products\nRefundable", style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Links()));
                      }, child: const Text("Know More", style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff66CC99),
                      ),))
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.truckFast,
                        size: 24,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text("Free Shipping", style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: const [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidHeart, color: Colors.red,), label: "Wishlist",),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.share,), label: "Share",),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.whatsapp), label: "Inquiry",),
      ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
      ),
    );
  }
}
