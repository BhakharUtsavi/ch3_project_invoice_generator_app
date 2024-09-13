import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_react_button/animated_react_button.dart';

import '../utils/global.dart';
import '../utils/global_variable.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detail Page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("cart");
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(args['thumbnail'], height: 500, width: 500),
              Text(args['name'],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                maxLines: 2,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 15),
              Text(args['description'],
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                maxLines: 3,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text("⭐${args['rating']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  const Spacer(),
                  AnimatedReactButton(
                      defaultColor: Colors.grey,
                      reactColor: Colors.red,
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 1));
                        setState(() {
                          wishList.add((args));
                        });
                      }),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text("Brand",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  const Spacer(),
                  Text(args['brand'],
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text("Category",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  const Spacer(),
                  Text(args['category'],
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text("₹ ${args['price']}",
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.white.withOpacity(0.5),
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        setState(() {
                          Globals.cartItem.add((args));
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 3,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.only(left: 17, right: 17, top: 17),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("Add To Cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
