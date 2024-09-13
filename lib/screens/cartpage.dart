import 'package:flutter/material.dart';
import '../utils/global_variable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  initState(){
    super.initState();
    Globals.ensureDefaultQuantities();
    Globals.calculateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text(
            "Cart Page",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('pdf');
          },
            icon: const Icon(Icons.picture_as_pdf, size: 30,
        ),
      ),
    ],
    centerTitle: true,
    backgroundColor: Colors.white,
    ),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Total Price:\t",
                      style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                      ),
                      TextSpan(
                        text: "₹${Globals.totalPrice}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
       body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: Globals.cartItem.map((e) {
                return Container(
                  margin: EdgeInsets.all(3),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          e["thumbnail"],
                          width: 120,
                          height: 150,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e["name"],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,

                            ),
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "₹ ${e["price"]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(2),
                                alignment: Alignment.center,
                                icon: const Icon(Icons.remove, size: 18, color: Colors.black),
                                onPressed: () => setState(() {
                                  Globals.decrementQuantity(e);
                                }),
                              ),
                              Text(
                                '${e['quantity']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(2),
                                alignment: Alignment.center,
                                icon: const Icon(Icons.add, size: 18, color: Colors.black),
                                onPressed: () => setState(() {
                                  Globals.incrementQuantity(e);
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Globals.cartItem.remove(e);
                            Globals.calculateTotalPrice();
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
    );
  }
}
