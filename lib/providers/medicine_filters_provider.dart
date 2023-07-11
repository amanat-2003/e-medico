import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';

const kInitialFilters = {
  MedicineTypes.allopathy: false,
  MedicineTypes.ayurveda: false,
  MedicineTypes.homeopathy: false,
  MedicineTypes.bachFlower: false,
};

class MedicineFiltersNotifier extends StateNotifier<Map<MedicineTypes, bool>> {
  MedicineFiltersNotifier() : super(kInitialFilters);

  void setFilter(MedicineTypes medicineType, bool val) {
    state = {
      ...state,
      medicineType: val,
    };
  }
}

final medicineFiltersProvider =
    StateNotifierProvider<MedicineFiltersNotifier, Map<MedicineTypes, bool>>(
  (ref) => MedicineFiltersNotifier(),
);
