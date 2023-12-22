import 'package:flutter/material.dart';
import 'package:the_basic_look/features/cart_view/presntation/widgets/quantity.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        height: 155,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 197, 189, 189),
          border: Border.all(
            color: Colors.grey.shade500,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0), // Set the border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: [
            Container(
              height: 155,
              width: 115,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/summer.jpeg'),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THE BASIC LOOK',
                  style: TextStyle(
                      color: Color.fromARGB(221, 71, 70, 70),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'POLO T-SHIRT',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Quantity',
                  style: TextStyle(
                      color: Color.fromARGB(221, 71, 70, 70),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'EGP 220.0',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                NumberCounterRow(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline_sharp),
                  color: const Color.fromARGB(255, 0, 0, 0),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
