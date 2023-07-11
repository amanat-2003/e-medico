import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_list_category_enum.dart';

class MedicineListCategoryNotifier extends StateNotifier<MedicineListCategory> {
  MedicineListCategoryNotifier() : super(MedicineListCategory.allMedicines);

  void changeCategory() {
    if (state == MedicineListCategory.allMedicines) {
      state = MedicineListCategory.myMedicines;
    } else {
      state = MedicineListCategory.allMedicines;
    }
  }
}

final medicineListCategoryProvider =
    StateNotifierProvider<MedicineListCategoryNotifier, MedicineListCategory>(
  (ref) => MedicineListCategoryNotifier(),
);
