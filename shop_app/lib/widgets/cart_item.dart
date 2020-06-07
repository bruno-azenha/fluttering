import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final int priceInCents;
  final int quantity;
  final String title;

  CartItem(
      {this.id, this.productId, this.priceInCents, this.title, this.quantity});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);

    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('\$${priceInCents / 100}')),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${priceInCents * quantity / 100}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
