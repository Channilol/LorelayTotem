import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lorelay/models/category_item.dart';
import 'package:lorelay/models/extra_item.dart';
import 'package:lorelay/models/order_item.dart';
import 'package:lorelay/models/product_item.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static List<CategoryItem> categories = [];
  static List<ProductItem> products = [];
  static List<ExtraItem> extraItems = [];

  static Future<void> initCategories() async {
    final categoriesString =
        await rootBundle.loadString('./data/categorie.json');
    final objCategories = jsonDecode(categoriesString) as List<dynamic>;

    for (int i = 0; i < objCategories.length; i++) {
      categories.add(CategoryItem.fromJson(objCategories[i]));
    }
  }

  static Future<void> initProducts() async {
    final productsString = await rootBundle.loadString('./data/prodotti.json');
    final objProducts = jsonDecode(productsString) as List<dynamic>;

    for (int i = 0; i < objProducts.length; i++) {
      products.add(ProductItem.fromJson(objProducts[i]));
    }
  }

  static Future<void> initExtraItems() async {
    final extraProductsString =
        await rootBundle.loadString('./data/varianti.json');
    final objExtra = jsonDecode(extraProductsString) as List<dynamic>;

    for (int i = 0; i < objExtra.length; i++) {
      extraItems.add(ExtraItem.fromJson(objExtra[i]));
    }
  }

  static String getUUID() {
    return const Uuid().v8();
  }

  static int getProductRowsCount(OrderItem order, String productId) {
    int count = 0;
    for (int i = 0; i < order.rows.length; i++) {
      if (order.rows[i].productId == productId) {
        count++;
      }
    }
    return count;
  }
}
