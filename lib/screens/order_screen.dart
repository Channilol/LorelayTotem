import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lorelay/components/header_full.dart';
import 'package:lorelay/components/products_display.dart';
import 'package:lorelay/components/sidebar.dart';
import 'package:lorelay/models/product_item.dart';
import 'package:lorelay/providers/category_provider.dart';
import 'package:lorelay/providers/order_provider.dart';
import 'package:lorelay/services/utils.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedCategoryId = ref.watch(categoryProvider);
    List<ProductItem> filteredProducts = Utils.products
        .where((e) => e.categoryId == selectedCategoryId)
        .toList();
    var orderWatcher = ref.watch(orderProvider);
    int? orderCount = ref.watch(orderProvider.notifier).totalCartItems();
    String orderBill = ref.watch(orderProvider.notifier).getCartBill();

    return Scaffold(
      body: Column(
        children: [
          HeaderFull(
            cartPrice: orderBill,
            selectedItems: orderCount ?? 0,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              children: [
                Sidebar(),
                ProductsDisplay(filtProducts: filteredProducts),
              ],
            ),
          )
        ],
      ),
    );
  }
}
