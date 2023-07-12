import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'CustomDisplay.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.id, required this.title,required this.discountedPrice, required this.price, required this.OFF, required this.url, required this.description});
  final String id;
  final String title;
  final String discountedPrice;
  final String price;
  final String OFF;
  final List url;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(
        onTap: () {
          print(id);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomDisplay(title: title, price: price, discountedPrice: discountedPrice, OFF: OFF, url: url, description: description,)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        padding: const EdgeInsets.only(right: 4),
                        child: CachedNetworkImage(
                          imageUrl: url[0],
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Center(child: Opacity( opacity: 0.6, child: Image.asset('assets/pain.jpeg')),),
                          errorWidget: (context, url, error) => const Icon(Icons.error, color: Color(0xff0D0D0D),),
                        ),
                      ),
                    ),
                    // Image 2 and Image 3
                    if (url.length == 2)
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: CachedNetworkImage(
                                  imageUrl: url[1],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Center(child: Opacity( opacity: 0.6, child: Image.asset('assets/pain.jpeg')),),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Color(0xff0D0D0D),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (url.length == 3)
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: CachedNetworkImage(
                                  imageUrl: url[1],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Center(child: Opacity( opacity: 0.6, child: Image.asset('assets/pain.jpeg')),),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Color(0xff0D0D0D),),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(top: 2),
                                child: CachedNetworkImage(
                                  imageUrl: url[2],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Center(child: Opacity( opacity: 0.6, child: Image.asset('assets/pain.jpeg')),),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Color(0xff0D0D0D),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    if (url.length > 3)
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: CachedNetworkImage(
                                  imageUrl: url[1],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Center(child: Opacity( opacity: 0.6, child: Image.asset('assets/pain.jpeg')),),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Color(0xff0D0D0D),),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: CachedNetworkImage(
                                      imageUrl: url[2],
                                      fit: BoxFit.cover,
                                      height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          Center(child: Opacity( opacity: 0.6, child: Image.asset('assets/pain.jpeg')),),
                                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Color(0xff0D0D0D),),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (url.length - 3).toString() +
                                            '+',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    // Expanded(
                    //   child: widget.url[index]
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.all(4),
                    // ),
                    // const Expanded(
                    //   child: Image(
                    //     image: AssetImage("assets/pain.jpeg"),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width:
                        MediaQuery.of(context).size.width * 0.90,
                        height: 50,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "₹$discountedPrice",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "₹$price",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  '($OFF% off)',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff66CC99),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width:
                        MediaQuery.of(context).size.width * 0.90,
                        height: 50,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  'Cash on Delivery',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.truckFast,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'Free Shipping',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(children: [
                        Container(
                          padding:
                          const EdgeInsets.fromLTRB(10, 4, 10, 4),
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
                        const SizedBox(
                          height: 10,
                        ),
                      ])
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
