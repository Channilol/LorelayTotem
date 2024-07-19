import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/components/header.dart';
import 'package:lorelay/components/splash_icon_group.dart';
import 'package:lorelay/providers/category_provider.dart';
import 'package:lorelay/providers/order_provider.dart';
import 'package:lorelay/screens/order_screen.dart';
import 'package:lorelay/services/my_colors.dart';
import 'package:lorelay/services/utils.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          ref
              .read(categoryProvider.notifier)
              .setCategory(Utils.categories[0].categoryId);

          ref.read(orderProvider.notifier).init();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OrderScreen(),
            ),
          );
          print("Tap");
        },
        child: Column(
          children: [
            Header(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SplashIconGroup(
                    icon: '../lib/images/icon_cloche.png',
                    iconText: "I Gourmet",
                    textColor: MyColors.colorText,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      SplashIconGroup(
                        icon: '../lib/images/icon_ice_cream.png',
                        iconText: "I Classici",
                        textColor: MyColors.colorText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SplashIconGroup(
                    icon: '../lib/images/icon_lactose_free.png',
                    iconText: "Lactose Free",
                    textColor: MyColors.colorText,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Scopri le linee e prova",
                    style: GoogleFonts.hankenGrotesk(
                      color: MyColors.colorText,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "un' ",
                        style: GoogleFonts.hankenGrotesk(
                          color: MyColors.colorText,
                          height: 0,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "esperienza unica",
                        style: GoogleFonts.courgette(
                          color: MyColors.colorText,
                          height: 0,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: MyColors.colorText,
                          decorationThickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            '../lib/images/splash_image.png',
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Tocca lo schermo",
                                    style: GoogleFonts.hankenGrotesk(
                                      color: MyColors.colorText,
                                      height: 0,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "per ordinare",
                                    style: GoogleFonts.courgette(
                                      height: 0,
                                      color: MyColors.colorText,
                                      fontSize: 27.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      decorationColor: MyColors.colorText,
                                      decorationThickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
