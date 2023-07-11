import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/providers/all_medicines_provider.dart';
import 'package:medicine_app/providers/medicine_filters_provider.dart';

final filteredMedicinesProvider = Provider((ref) {
  final medicineFilters = ref.watch(medicineFiltersProvider);
  final allMedicines = ref.watch(allMedicinesProvider);
  return allMedicines.where((element) {
    if (medicineFilters[MedicineTypes.allopathy]! &&
        element.medicineType == MedicineTypes.allopathy) return false;
    if (medicineFilters[MedicineTypes.ayurveda]! &&
        element.medicineType == MedicineTypes.ayurveda) return false;
    if (medicineFilters[MedicineTypes.homeopathy]! &&
        element.medicineType == MedicineTypes.homeopathy) return false;
    if (medicineFilters[MedicineTypes.bachFlower]! &&
        element.medicineType == MedicineTypes.bachFlower) return false;
    return true;
  }).toList();
});
