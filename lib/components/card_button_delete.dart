import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/models/product_item.dart';
import 'package:lorelay/providers/order_provider.dart';
import 'package:lorelay/services/my_colors.dart';

class CardButtonDelete extends ConsumerWidget {
  const CardButtonDelete({
    super.key,
    required this.itemQty,
    required this.product,
  });

  final int itemQty;
  final ProductItem product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: itemQty > 0
          ? () => ref.read(orderProvider.notifier).removeItem(product.productId)
          : null,
      style: ElevatedButton.styleFrom(
        fixedSize: (Size(MediaQuery.of(context).size.width * 0.197,
            MediaQuery.of(context).size.height * 0.04)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(4),
            topLeft: Radius.circular(16),
          ),
        ),
        elevation: 0,
        backgroundColor: MyColors.colorText.withOpacity(0.3),
      ),
      child: Text(
        'CANCELLA',
        style: GoogleFonts.hankenGrotesk(
            fontSize: 10.0, color: MyColors.colorText),
      ),
    );
  }
}
