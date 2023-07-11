import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/disease_severity_enum.dart';

const kInitialFilters = {
  DiseaseSeverity.low: false,
  DiseaseSeverity.medium: false,
  DiseaseSeverity.high: false,
};

class DiseasesFiltersNotifier
    extends StateNotifier<Map<DiseaseSeverity, bool>> {
  DiseasesFiltersNotifier() : super(kInitialFilters);

  void setFilter(DiseaseSeverity diseaseSeverity, bool val) {
    state = {
      ...state,
      diseaseSeverity: val,
    };
  }
}

final diseaseFiltersProvider =
    StateNotifierProvider<DiseasesFiltersNotifier, Map<DiseaseSeverity, bool>>(
  (ref) => DiseasesFiltersNotifier(),
);
