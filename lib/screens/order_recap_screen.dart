import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/components/header.dart';
import 'package:lorelay/components/order_recap_item.dart';
import 'package:lorelay/models/product_item.dart';
import 'package:lorelay/providers/order_provider.dart';
import 'package:lorelay/services/my_colors.dart';
import 'package:lorelay/services/utils.dart';

class OrderRecapScreen extends ConsumerStatefulWidget {
  const OrderRecapScreen({super.key});

  @override
  ConsumerState<OrderRecapScreen> createState() => _OrderRecapScreenState();
}

class _OrderRecapScreenState extends ConsumerState<OrderRecapScreen> {
  @override
  Widget build(BuildContext context) {
    var orderWatcher = ref.watch(orderProvider);
    String orderBill = ref.watch(orderProvider.notifier).getCartBill();
    List<ProductItem> productsList = Utils.products.toList();
    var orderRows = ref.watch(orderProvider)?.rows;

    List<Widget> orderWidgets = [];

    for (int i = 0; i < orderRows!.length; i++) {
      orderWidgets.add(OrderRecapItem(
          product: productsList
              .where((e) => e.productId == orderRows[i].productId)
              .first,
          rowId: orderRows[i].rowId));
    }

    return Scaffold(
      body: Column(
        children: [
          Header(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 25,
                width: 130,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: MyColors.colorContainer,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Riepilogo acquisti',
            style: GoogleFonts.courgette(
                color: const Color.fromARGB(255, 207, 188, 165),
                fontSize: 27.0),
          ),
          Text(
            'Hai scelto ${orderRows!.length} gelat${orderRows.length > 1 ? 'i' : 'o'}',
            style: GoogleFonts.hankenGrotesk(
                fontSize: 30.0,
                color: MyColors.colorText,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double cardHeight = (constraints.maxHeight - 55) / 3;
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio:
                              constraints.maxWidth / (2 * cardHeight),
                        ),
                        itemBuilder: (context, index) {
                          for (var i = 0; i < orderWidgets.length; i++) {
                            return orderWidgets[i]
                          }
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Text(
            'Totale ordine',
            style: GoogleFonts.courgette(
                height: 0,
                color: const Color.fromARGB(255, 207, 188, 165),
                fontSize: 20.0),
          ),
          Text(
            '€ $orderBill',
            style: GoogleFonts.hankenGrotesk(
                height: 0,
                fontSize: 35.0,
                color: MyColors.colorText,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                color: MyColors.colorText,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(22),
                  topLeft: Radius.circular(22),
                  bottomLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "PAGA ORA",
                  style: TextStyle(
                      color: MyColors.colorBackground,
                      height: 0,
                      fontSize: 18.0,
                      letterSpacing: 1.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
