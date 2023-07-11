import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/data/dummy_data.dart';
import 'package:medicine_app/models/medicine.dart';


final allMedicinesProvider =
    StateNotifierProvider<AllMedicinesNotifier, List<Medicine>>(
        (ref) => AllMedicinesNotifier());

class AllMedicinesNotifier extends StateNotifier<List<Medicine>> {
  AllMedicinesNotifier() : super(dummyMedicines);

  void addMedicine(Medicine medicine) {
    state = [...state, medicine];
  }

  void deleteMedicine(Medicine medicine) {
    state = [...state]..remove(medicine);
  }
}
