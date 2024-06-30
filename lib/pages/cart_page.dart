import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context)
        .cart; // ab iski vajah se poora scaffold rebuild hoga. If you want only a certain widget to rebuild, wrap that widget with a consumer widget.
    //or context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 25),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return ListTile(
            title: Text(
              cartItem['title'] as String,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            subtitle: Text('Size ${cartItem['size']}'),
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  cartItem['imageUrl'] as String,
                ),
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Item',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        content: const Text(
                            "Are you sure you want to remove the product ?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // or context.read<CartProvider>().deleteProduct(cartItem)
                              Provider.of<CartProvider>(context, listen: false)
                                  .deleteProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          );
        },
      ),
    );
  }
}
