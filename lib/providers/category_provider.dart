import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryProvider extends StateNotifier<String?> {
  CategoryProvider() : super(null);

  void setCategory(String newCategoryId) {
    state = newCategoryId;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryProvider, String?>((ref) {
  return CategoryProvider();
});
