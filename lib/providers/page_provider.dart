import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageProvider extends StateNotifier<int?> {
  PageProvider() : super(0);

  void resetPage() {
    state = 0;
  }

  void setPage(int pageCount) {
    state = pageCount;
  }
}

final pageProvider = StateNotifierProvider<PageProvider, int?>((ref) {
  return PageProvider();
});
