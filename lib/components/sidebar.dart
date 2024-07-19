import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/components/sidebar_item.dart';
import 'package:lorelay/providers/category_provider.dart';
import 'package:lorelay/providers/page_provider.dart';
import 'package:lorelay/services/my_colors.dart';
import 'package:lorelay/services/utils.dart';

class Sidebar extends ConsumerStatefulWidget {
  const Sidebar({super.key});

  @override
  ConsumerState<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends ConsumerState<Sidebar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> sidebarCategories = [];

    String? selectedCategoryId = ref.watch(categoryProvider);

    for (var i = 0; i < Utils.categories.length; i++) {
      sidebarCategories.add(
        GestureDetector(
          onTap: () {
            ref
                .read(categoryProvider.notifier)
                .setCategory(Utils.categories[i].categoryId);
            ref.read(pageProvider.notifier).resetPage();
          },
          child: SidebarItem(
            icon: Utils.categories[i].image,
            text: Utils.categories[i].name,
            selectionColor: selectedCategoryId == Utils.categories[i].categoryId
                ? const Color.fromARGB(13, 0, 0, 0)
                : null,
          ),
        ),
      );
    }

    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: MyColors.colorContainer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 93, 93, 93).withOpacity(0.3),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Text(
                  "Le nostre",
                  style: GoogleFonts.hankenGrotesk(color: Colors.black38),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40.0),
                  child: Text(
                    "Linee",
                    style: GoogleFonts.courgette(
                      color: Colors.black38,
                      fontSize: 25.0,
                      height: 0,
                    ),
                  ),
                ),
                Column(
                  children: sidebarCategories,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    FontAwesomeIcons.universalAccess,
                    color: MyColors.colorText,
                  ),
                  Text(
                    "Accessibilità",
                    style: GoogleFonts.hankenGrotesk(
                      fontSize: 13.0,
                      color: Colors.black38,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
