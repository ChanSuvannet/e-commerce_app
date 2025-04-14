import 'package:get/get.dart';

class TabIndexController extends GetxController {
  // Reactive index for tab navigation
  final RxInt _tabIndex = 0.obs;

  // Getter
  int get tabIndex => _tabIndex.value;

  void setTabIndex(int value) {
    _tabIndex.value = value;
  }

  // Or expose the observable directly if needed for Obx
  RxInt get tabIndexRx => _tabIndex;
}
