import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lorelay/models/extra_item.dart';
import 'package:lorelay/models/order_item.dart';
import 'package:lorelay/services/utils.dart';

class OrderProvider extends StateNotifier<OrderItem?> {
  OrderProvider() : super(null);

  void init() {
    state = OrderItem(rows: []);
  }

  void addItem(String productId) {
    var tempOrder = state?.clone() ?? OrderItem(rows: []);
    tempOrder.rows.add(OrderRowItem(
        rowId: Utils.getUUID(), qty: 1, productId: productId, extras: []));
    state = tempOrder;
  }

  void removeItem(String productId) {
    var tempOrder = state?.clone() ?? OrderItem(rows: []);
    if (tempOrder.rows.isNotEmpty) {
      var lastItem = tempOrder.rows.lastWhere((e) => e.productId == productId);
      tempOrder.rows.remove(lastItem);
    }
    state = tempOrder;
  }

  void removeOrder(String rowId) {
    var tempOrder = state?.clone() ?? OrderItem(rows: []);
    if (tempOrder.rows.isNotEmpty) {
      var itemToRemove =
          tempOrder.rows.where((e) => e.rowId == rowId).firstOrNull;
      if (itemToRemove != null) {
        tempOrder.rows.remove(itemToRemove);
      }
    }
    state = tempOrder;
  }

  void resetCart() {
    state = OrderItem(rows: []);
  }

  void setOrder(OrderItem newOrder) {
    state = newOrder;
  }

  int getItemRowsCount(String productId) {
    return state!.rows
            .where((element) => element.productId == productId)
            .length ??
        0;
  }

  int? totalCartItems() {
    return state?.rows.length;
  }

  String getTotalItemPrice(String productId) {
    num totalItemPrice = 0;
    var filtProd = state!.rows.where((e) => e.productId == productId).toList();
    for (var item in filtProd) {
      totalItemPrice +=
          Utils.products.where((e) => e.productId == productId).first.price;
      if (item.extras != null && item.extras!.isNotEmpty) {
        for (int i = 0; i < item.extras!.length; i++) {
          int extraIndex = Utils.extraItems.indexWhere(
            (element) {
              return element.extraId == item.extras![i].extraId;
            },
          );
          ExtraItem extra = Utils.extraItems[extraIndex];
          totalItemPrice += extra.price?.toDouble() ?? 0;
        }
      }
    }
    String formattedTotalItemPrice = totalItemPrice.toStringAsFixed(2);
    return formattedTotalItemPrice;
  }

  String getCartBill() {
    num bill = 0;
    for (var row in state!.rows) {
      var product =
          Utils.products.where((e) => e.productId == row.productId).firstOrNull;
      if (product != null) {
        bill += (row.qty * product.price);
      }

      if (row.extras != null && row.extras!.isNotEmpty) {
        for (int i = 0; i < row.extras!.length; i++) {
          int extraIndex = Utils.extraItems.indexWhere(
            (element) {
              return element.extraId == row.extras![i].extraId;
            },
          );
          ExtraItem extra = Utils.extraItems[extraIndex];
          bill += extra.price?.toDouble() ?? 0;
        }
      }
    }
    String formattedBill = bill.toStringAsFixed(2);
    return formattedBill;
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, OrderItem?>((ref) {
  return OrderProvider();
});
