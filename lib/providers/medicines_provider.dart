import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_list_category_enum.dart';
import 'package:medicine_app/providers/filtered_medicines_provider.dart';
import 'package:medicine_app/providers/filtered_my_medicines_provider.dart';
import 'package:medicine_app/providers/medicine_list_category_provider.dart';


final medicinesProvider = Provider((ref) {
  final medicineListCategory = ref.watch(medicineListCategoryProvider);
  final filteredMedicines = ref.watch(filteredMedicinesProvider);
  final filteredMyMedicines = ref.watch(filteredMyMedicinesProvider);
  return medicineListCategory == MedicineListCategory.allMedicines
      ? filteredMedicines
      : filteredMyMedicines;
});
