import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProgressBarController extends GetxController {
  final ScrollController scrollController = ScrollController();
  late RxInt progressBarListviewIndex = 0.obs;
  final RxInt currentTextIndex = 0.obs;

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
  final RxList<Map<String, dynamic>> textItems = [
    {
      'id': 1,
      'title': 'Başlangıç',
      'text':
      'Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.',
      'status': 'unread'
    },
    {
      'id': 2,
      'title': 'Hücre Teorisi',
      'text':
      'Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.',
      'status': 'unread'
    },
    {
      'id': 3,
      'title': 'Hücre Zarı Hücre Duvarı',
      'text':
      'Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.',
      'status': 'unread'
    },
    {
      'id': 4,
      'title': 'Hücre Zarından Madde Geçişi ',
      'text':
      'Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.',
      'status': 'unread'
    },
    {
      'id': 5,
      'title': 'Değerlendirme',
      'text':
      'Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.',
      'status': 'unread'
    },
    {
      'id': 5,
      'title': 'Bitiş',
      'text':
      'Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.Lorem ipsum dolor sit amet consectetur. Nisl dignissim lorem cras ultrices. Sit vitae risus nulla ultricies sollicitudin etiam nunc. Id duis cras bibendum cursus et accumsan. Mauris est risus enim eu lorem vel nisi. Et pharetra molestie dolor facilisis. Aliquam quisque nisi ac habitasse. Orci integer dis eget rhoncus tincidunt turpis. Mi arcu faucibus lectus leo proin rhoncus diam mattis orci. Volutpat ac amet dui et sed molestie commodo.',
      'status': 'unread'
    },
  ].obs;
  var currentTextItem = {}.obs;

  void nextItemText() {
    if (currentTextIndex.value < textItems.length - 1) {
      textItems[currentTextIndex.value]['status'] = 'read';
      currentTextIndex.value++;
      currentTextItem.value = textItems[currentTextIndex.value];
    }
  }


  void markAsRead(int index) {
    if (index < progressBarItems.length) {
      progressBarItems[index]['status'] = 'read';
      progressBarItems.refresh();
      progressBarListviewIndex.value++;
    }
  }

  void smoothScroll() {
    if (scrollController.hasClients) {
      // Accessing maxScrollExtent directly can lead to issues if the scroll view is not laid out yet.
      try {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;

        // Calculate the target position for scrolling.
        final scrollTarget = currentScroll +
           100 ;

        // Perform the animated scroll to the target position.
        scrollController.animateTo(
          scrollTarget < maxScroll ? scrollTarget : maxScroll,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      } catch (e) {
        // If an error occurs (e.g., accessing maxScrollExtent prematurely), handle it here.
        // For example, you could retry the scroll after a delay, log the error, or simply ignore it.
        print("Error scrolling to bottom: $e");
        // Optionally, schedule a retry or handle the error as needed.
      }
    }
  }

}
