import 'package:flutter/material.dart';
import 'package:the_basic_look/core/utils/app_storge.dart';
import 'package:the_basic_look/features/women_view/data/models/cart_item_model2/cart_item_model2.dart';
import 'package:the_basic_look/features/women_view/data/services/cart_services.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  void initState() {
    super.initState();
    loadCart();
  }

  Future<void> loadCart() async {
    String token = getxStorge.read('token');
    await CartServices().getCartItems(token: token);
    setState(() {});
  }

  void deletItem(String token) async {
    await CartServices()
        .deletItem(token: token, id: widget.cartModel.product!.id!);
    await loadCart(); // Wait for deletion to complete before reloading the cart
  }

  @override
  Widget build(BuildContext context) {
    String token = getxStorge.read('token');

    String Currncy = ' L-E';
    String price = 'Price ';
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
            SizedBox(
              height: 155,
              width: 115,
              child: Image.network(
                widget.cartModel.product!.image!,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'THE BASIC LOOK',
                    style: TextStyle(
                        color: Color.fromARGB(221, 71, 70, 70),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.cartModel.product!.name!,
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Quantity',
                    style: TextStyle(
                        color: Color.fromARGB(221, 71, 70, 70),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    price +
                        widget.cartModel.product!.price.toString() +
                        Currncy,
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Handl
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                CartServices()
                    .deletItem(token: token, id: widget.cartModel.product!.id!);
              },
              icon: const Icon(Icons.delete_outline_sharp),
              color: const Color.fromARGB(255, 0, 0, 0),
            )
          ]),
        ),
      ),
    );
  }
}
