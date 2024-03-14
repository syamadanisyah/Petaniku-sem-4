import 'package:flutter/material.dart';

class button_wishlist extends StatefulWidget {
  const button_wishlist({super.key});

  @override
  State<button_wishlist> createState() => _button_wishlistState();
}

class _button_wishlistState extends State<button_wishlist> {
bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

   

    return IconButton(
      onPressed: () {
      setState(() {
        isFavorite = !isFavorite;
      });
    }, icon:isFavorite
    ?Icon(Icons.favorite,color: Colors.orange[600],size: 38,)
    :Icon(Icons.favorite_border,color: Colors.orange[600],size: 38,), 
    );
  }
}