import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/components/card_button_add.dart';
import 'package:lorelay/components/card_button_delete.dart';
import 'package:lorelay/models/product_item.dart';
import 'package:lorelay/providers/order_provider.dart';
import 'package:lorelay/services/my_colors.dart';
import 'package:badges/badges.dart' as badges;

class OrderRecapItem extends ConsumerStatefulWidget {
  const OrderRecapItem({super.key, required this.product, this.rowId});

  final ProductItem product;
  final String? rowId;

  @override
  ConsumerState<OrderRecapItem> createState() => _OrderRecapItemState();
}

class _OrderRecapItemState extends ConsumerState<OrderRecapItem> {
  @override
  Widget build(BuildContext context) {
    var orderWatcher = ref.watch(orderProvider);
    String itemPrice = ref
        .watch(orderProvider.notifier)
        .getTotalItemPrice(widget.product.productId);
    var itemQty = ref
        .watch(orderProvider.notifier)
        .getItemRowsCount(widget.product.productId);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
                child: Image.asset(
                  widget.product.image ?? '../lib/images/mune_placeholder.jpg',
                  height: constraints.maxHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: MyColors.colorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: GoogleFonts.courgette(
                            fontSize: 14.0, color: MyColors.colorText),
                      ),
                      Column(
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
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2),
                                    badgeColor:
                                        const Color.fromARGB(255, 0, 178, 6),
                                  ),
                                  child: CardButtonAdd(product: widget.product),
                                )
                              : CardButtonAdd(product: widget.product),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
