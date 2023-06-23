import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CustomDisplay.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title,required this.discountedPrice, required this.price, required this.OFF});

  final String title;
  final String discountedPrice;
  final String price;
  final String OFF;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomDisplay()));
        },
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
                                  discountedPrice,
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
                                  price,
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
