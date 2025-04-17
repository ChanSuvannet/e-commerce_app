import 'package:get/get.dart';

class CategoryController extends GetxController {
  final RxString _selectedCategory = ''.obs;
  final RxString _selectedTitle = ''.obs;

  String get selectedCategory => _selectedCategory.value;

  set selectedCategory(String value) => _selectedCategory.value = value;

  String get selectedTitle => _selectedTitle.value;

  set selectedTitle(String value) => _selectedTitle.value = value;
}
