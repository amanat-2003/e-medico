import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/disease_severity_enum.dart';
import 'package:medicine_app/providers/all_diseases_provider.dart';
import 'package:medicine_app/providers/diseases_filters_provider.dart';

final filteredDiseasesProvider = Provider((ref) {
  final diseaseFilters = ref.watch(diseaseFiltersProvider);
  final allDiseases = ref.watch(allDiseasesProvider);
  return allDiseases.where((element) {
    if (diseaseFilters[DiseaseSeverity.low]! &&
        element.diseaseSeverity == DiseaseSeverity.low) return false;
    if (diseaseFilters[DiseaseSeverity.medium]! &&
        element.diseaseSeverity == DiseaseSeverity.medium) return false;
    if (diseaseFilters[DiseaseSeverity.high]! &&
        element.diseaseSeverity == DiseaseSeverity.high) return false;
    return true;
  }).toList();
});
