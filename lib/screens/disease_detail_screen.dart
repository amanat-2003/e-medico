import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/disease_severity_enum.dart';
import 'package:medicine_app/models/disease.dart';
import 'package:medicine_app/providers/all_medicines_provider.dart';
import 'package:medicine_app/providers/medicines_provider.dart';
import 'package:medicine_app/widgets/medicine_list_tile.dart';

class DiseaseDetailScreen extends ConsumerWidget {
  const DiseaseDetailScreen({
    Key? key,
    required this.disease,
    // required this.medicineList,
  }) : super(key: key);
  final Disease disease;
  // final List<Medicine> medicineList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(medicineFiltersProvider);
    final allMedicines = ref.watch(allMedicinesProvider);
    final medicineList = allMedicines.where(
      (medicine) => disease.medicines.contains(medicine.id),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              disease.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    disease.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: Text(
                      disease.diseaseSeverity.inDetail(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                    child: Text(
                      'No. of days to recover: ${disease.recoveryDays}  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onError,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Available medicines',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Theme.of(context).colorScheme.outline),
                  ),
                  for (final medi in medicineList)
                    MedicineListTile(medicine: medi),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
