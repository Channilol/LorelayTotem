import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/components/card_button_add.dart';
import 'package:lorelay/components/card_button_delete.dart';
import 'package:lorelay/models/product_item.dart';
import 'package:lorelay/providers/order_provider.dart';
import 'package:lorelay/services/my_colors.dart';
import 'package:badges/badges.dart' as badges;

class ProductCard extends ConsumerStatefulWidget {
  const ProductCard({super.key, required this.product});

  final ProductItem product;

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var order = ref.watch(orderProvider);
    var itemQty = ref
        .watch(orderProvider.notifier)
        .getItemRowsCount(widget.product.productId);

    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                bottomLeft: Radius.circular(24.0),
              ),
              child: Image.asset(
                height: MediaQuery.of(context).size.height * 0.28,
                widget.product.image ?? '../lib/images/mune_placeholder.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: MyColors.colorContainer,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: GoogleFonts.courgette(
                          fontSize: 28.0, color: MyColors.colorText),
                    ),
                    Text(
                      widget.product.description,
                      style: GoogleFonts.hankenGrotesk(
                          fontSize: 13.0, color: MyColors.colorText),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        itemQty > 0
                            ? CardButtonDelete(
                                itemQty: itemQty,
                                product: widget.product,
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        itemQty > 0
                            ? badges.Badge(
                                position: badges.BadgePosition.topEnd(
                                    top: -17, end: 8),
                                badgeContent: Text(
                                  '$itemQty',
                                  style: TextStyle(
                                      color: MyColors.colorBackground),
                                ),
                                badgeStyle: badges.BadgeStyle(
                                  padding: EdgeInsets.all(7),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  badgeColor:
                                      const Color.fromARGB(255, 0, 178, 6),
                                ),
                                child: CardButtonAdd(product: widget.product),
                              )
                            : CardButtonAdd(product: widget.product),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
