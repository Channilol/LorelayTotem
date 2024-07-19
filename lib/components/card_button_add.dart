import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/models/product_item.dart';
import 'package:lorelay/providers/order_provider.dart';
import 'package:lorelay/services/my_colors.dart';

class CardButtonAdd extends ConsumerWidget {
  const CardButtonAdd({
    super.key,
    required this.product,
  });

  final ProductItem product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String itemPrice = product.price.toStringAsFixed(2);
    return ElevatedButton(
      onPressed: () =>
          ref.read(orderProvider.notifier).addItem(product.productId),
      style: ElevatedButton.styleFrom(
        fixedSize: (Size(MediaQuery.of(context).size.width * 0.25,
            MediaQuery.of(context).size.height * 0.06)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        elevation: 0,
        backgroundColor: MyColors.colorText,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '€ ${itemPrice}',
            style: GoogleFonts.hankenGrotesk(
                fontSize: 13.0,
                letterSpacing: 1.0,
                height: 0,
                fontWeight: FontWeight.bold,
                color: MyColors.colorBackground),
          ),
          Text(
            'AGGIUNGI',
            style: GoogleFonts.hankenGrotesk(
                fontSize: 11.0,
                letterSpacing: 1.0,
                height: 0,
                fontWeight: FontWeight.w300,
                color: MyColors.colorBackground),
          )
        ],
      ),
    );
  }
}
