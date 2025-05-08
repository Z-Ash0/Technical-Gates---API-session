import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool favProd = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFC90051),
            offset: Offset(4, 5),
          ),
        ],
      ),
      // height: 210, // Adjust this value as needed
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Change to min to avoid taking extra space
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _productImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _productDetails(),
                ),
                _addToFavouriteButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productImage() {
    return CachedNetworkImage(
      imageUrl: 'assets/images.png',
      progressIndicatorBuilder: (_, __, progress) =>
          Center(child: CircularProgressIndicator(value: progress.progress)),
      errorWidget: (_, __, ___) =>
          const Icon(Icons.warning, color: Color(0xFFC90051)),
      height: 130,
      fit: BoxFit.cover,
    );
  }

  Widget _productDetails() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'i\'m product',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
        Text(r'$' 'price',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16),
            SizedBox(width: 2),
            Text('rate',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
          ],
        )
      ],
    );
  }

  Widget _addToFavouriteButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => favProd = !favProd);
        if (favProd) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to favourite')));
          //* Don't forget to add this to fav page list
        }
      },
      icon: favProd
          ? const Icon(Icons.favorite, color: Color(0xFFC90051))
          : const Icon(Icons.favorite_border, color: Colors.grey),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
