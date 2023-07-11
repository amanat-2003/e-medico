import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/providers/filtered_diseases_provider.dart';
import 'package:medicine_app/widgets/disease_card.dart';

class DiseasesScreen extends ConsumerWidget {
  const DiseasesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diseaseList = ref.watch(filteredDiseasesProvider);
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Change filters to show diseases!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (diseaseList.isNotEmpty) {
      content = Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 3 / 4,
          child: ListView.builder(
            itemBuilder: (context, index) =>
                DiseaseCard(disease: diseaseList[index]),
            itemCount: diseaseList.length,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseases'),
      ),
      body: content,
    );
  }
}
