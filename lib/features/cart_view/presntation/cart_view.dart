import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_basic_look/core/utils/app_storge.dart';
import 'package:the_basic_look/features/home_view/presntation/widgets/custom_icon_button.dart';
import 'package:the_basic_look/features/women_view/data/models/cart_item_model2/cart_item_model2.dart';
import 'package:the_basic_look/features/women_view/data/services/cart_services.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key, required this.cartModel, this.totalPrice})
      : super(key: key);
  final List<CartModel> cartModel;
  final int? totalPrice;
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String token = getxStorge.read('token');

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadCart() async {
    await CartServices().getCartItems(token: token);
    setState(() {});
  }

  Future<void> deleteItem(String id) async {
    await CartServices().deletItem(token: token, id: id);

    // Update the local widget.cartModel list
    widget.cartModel.removeWhere((item) => item.product!.id == id);

    await loadCart(); // Wait for deletion to complete before reloading the cart
    setState(() {}); // Trigger a rebuild after deletion
  }

  Widget buildCartItem(CartModel cartModel) {
    String currency = ' L-E';
    String price = 'Price ';

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Container(
          height: 155,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 197, 189, 189),
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                SizedBox(
                  height: 155,
                  width: 115,
                  child: Image.network(
                    cartModel.product!.image!,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cartModel.product!.name!,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          color: Color.fromARGB(221, 71, 70, 70),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        price + cartModel.product!.price.toString() + currency,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    deleteItem(cartModel.product!.id!);
                  },
                  icon: const Icon(Icons.delete_outline_sharp),
                  color: const Color.fromARGB(255, 0, 0, 0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const CustomiIconButton(
            icon: Icons.arrow_back,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 110),
          child: Text(
            'CART',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<CartModel>>(
        future: CartServices().getCartItems(token: token),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'YOUR CART IS EMPTY!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return buildCartItem(snapshot.data![index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: FutureBuilder(
                      future: CartServices().getCartPrice(token: token),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: Text(
                              'price:${snapshot.data}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}




//  if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }