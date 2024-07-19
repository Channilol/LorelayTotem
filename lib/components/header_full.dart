import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/screens/order_recap_screen.dart';
import 'package:lorelay/services/my_colors.dart';

class HeaderFull extends ConsumerStatefulWidget {
  const HeaderFull({
    super.key,
    required this.selectedItems,
    required this.cartPrice,
  });

  final int selectedItems;
  final String cartPrice;

  @override
  ConsumerState<HeaderFull> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<HeaderFull> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          height: 70,
          color: MyColors.colorContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: 120,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                  color: MyColors.colorBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.selectedItems} Selezionati",
                      style: TextStyle(
                        color: MyColors.colorText,
                        height: 0,
                        fontSize: 13.0,
                      ),
                    ),
                    Text(
                      "€${widget.cartPrice}",
                      style: TextStyle(
                        color: MyColors.colorText,
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    '../lib/images/lorelay_full_logo.png',
                    height: 70,
                    width: 90,
                  )
                ],
              ),
              GestureDetector(
                onTap: widget.selectedItems > 0
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OrderRecapScreen(),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    color: MyColors.colorText,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CONCLUDI L'ORDINE",
                          style: TextStyle(
                            color: MyColors.colorBackground,
                            height: 0,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          "VAI ALLA CASSA",
                          style: TextStyle(
                            color: MyColors.colorBackground,
                            fontWeight: FontWeight.bold,
                            height: 0,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: 1,
              ),
            ),
            Expanded(
              child: Row(
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
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 26.0, top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "English",
                      style: GoogleFonts.courgette(color: MyColors.colorText),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      '../lib/images/uk_flag.png',
                      width: 24,
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
