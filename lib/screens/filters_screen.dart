import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medicine_app/enums%20and%20extensions/disease_severity_enum.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/providers/diseases_filters_provider.dart';
import 'package:medicine_app/providers/medicine_filters_provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            Text(
              'Filters on medicines',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.outline),
            ),
            const FilterMedicineListTile(
              medicineType: MedicineTypes.allopathy,
            ),
            const FilterMedicineListTile(
              medicineType: MedicineTypes.ayurveda,
            ),
            const FilterMedicineListTile(
              medicineType: MedicineTypes.homeopathy,
            ),
            const FilterMedicineListTile(
              medicineType: MedicineTypes.bachFlower,
            ),
            const SizedBox(height: 20),
            Text(
              'Filters on Diseases',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.outline),
            ),
            const FilterDiseaseListTile(diseaseSeverity: DiseaseSeverity.low),
            const FilterDiseaseListTile(diseaseSeverity: DiseaseSeverity.medium),
            const FilterDiseaseListTile(diseaseSeverity: DiseaseSeverity.high),
          ],
        ),
      ),
    );
  }
}

class FilterMedicineListTile extends ConsumerWidget {
  final MedicineTypes medicineType;
  const FilterMedicineListTile({
    Key? key,
    required this.medicineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(medicineFiltersProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: SwitchListTile(
          value: filters[medicineType]!,
          title: Text(
            'No ${medicineType.toStr()} medicines',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          onChanged: (value) {
            final filtersNotifier = ref.read(medicineFiltersProvider.notifier);
            filtersNotifier.setFilter(medicineType, value);
          },
        ),
      ),
    );
  }
}

class FilterDiseaseListTile extends ConsumerWidget {
  final DiseaseSeverity diseaseSeverity;
  const FilterDiseaseListTile({
    Key? key,
    required this.diseaseSeverity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(diseaseFiltersProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: SwitchListTile(
          value: filters[diseaseSeverity]!,
          title: Text(
            'No ${diseaseSeverity.toStr()}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          onChanged: (value) {
            final filtersNotifier = ref.read(diseaseFiltersProvider.notifier);
            filtersNotifier.setFilter(diseaseSeverity, value);
          },
        ),
      ),
    );
  }
}
