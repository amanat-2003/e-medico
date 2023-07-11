import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/models/medicine.dart';

class MyMedicinesNotifier extends StateNotifier<List<Medicine>> {
  MyMedicinesNotifier() : super([]);

  void addToMyMedicines(Medicine medicine) {
    state = [...state, medicine];
  }

  void removeFromMyMedicines(Medicine medicine) {
    if (state.contains(medicine)) {
      state = state.where((medi) => medi.id != medicine.id).toList();
    }
  }

  bool isMyMedicine(Medicine medicine) {
    return state.contains(medicine);
  }
}

final myMedicinesProvider =
    StateNotifierProvider<MyMedicinesNotifier, List<Medicine>>(
  (ref) => MyMedicinesNotifier(),
);
