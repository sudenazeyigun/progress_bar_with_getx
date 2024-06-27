import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProgressBarController extends GetxController {
  final ScrollController scrollController = ScrollController();
  late RxInt progressBarListviewIndex = 0.obs;

  final RxList<Map<String, dynamic>> progressBarItems = [
    {'id': 1, 'name': 'Item 1', 'status': 'unread'},
    {'id': 2, 'name': 'Item 2', 'status': 'unread'},
    {'id': 3, 'name': 'Item 3', 'status': 'unread'},
    {'id': 4, 'name': 'Item 4', 'status': 'unread'},
    {'id': 5, 'name': 'Item 5', 'status': 'unread'},
    {'id': 5, 'name': 'Item 6', 'status': 'unread'},
    {'id': 1, 'name': 'Item 7', 'status': 'unread'},
    {'id': 2, 'name': 'Item 8', 'status': 'unread'},
    {'id': 3, 'name': 'Item 9', 'status': 'unread'},
    {'id': 4, 'name': 'Item 10', 'status': 'unread'},
    {'id': 5, 'name': 'Item 11', 'status': 'unread'},
    {'id': 5, 'name': 'Item 12', 'status': 'unread'},
  ].obs;

  void markAsRead(int index) {
    if (index < progressBarItems.length) {
      progressBarItems[index]['status'] = 'read';
      progressBarItems.refresh();
      progressBarListviewIndex.value++;
    }
  }

  void smoothScroll() {
    if (scrollController.hasClients) {
      try {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final scrollTarget = currentScroll + 100;
        scrollController.animateTo(
          scrollTarget < maxScroll ? scrollTarget : maxScroll,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      } catch (e) {
        print("Error scrolling to bottom: $e");
      }
    }
  }
}
