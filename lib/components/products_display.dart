import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lorelay/components/product_card.dart';
import 'package:lorelay/models/product_item.dart';

class ProductsDisplay extends ConsumerStatefulWidget {
  const ProductsDisplay({super.key, required this.filtProducts});

  final List<ProductItem> filtProducts;

  @override
  ConsumerState<ProductsDisplay> createState() => _ProductsDisplayState();
}

class _ProductsDisplayState extends ConsumerState<ProductsDisplay> {
  @override
  Widget build(BuildContext context) {
    List<Widget> elementList = [];

    for (int i = 0; i < widget.filtProducts.length; i++) {
      elementList.add(
        ProductCard(
          product: widget.filtProducts[i],
          key: ValueKey(widget.filtProducts[i].productId),
        ),
      );
    }

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20.0),
              child: ListView(
                children: elementList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
