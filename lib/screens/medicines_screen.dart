import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_list_category_enum.dart';
import 'package:medicine_app/providers/all_medicines_provider.dart';
import 'package:medicine_app/providers/medicine_list_category_provider.dart';
import 'package:medicine_app/providers/medicines_provider.dart';
import 'package:medicine_app/providers/my_medicines_provider.dart';
import 'package:medicine_app/screens/add_medicine_screen.dart';
import 'package:medicine_app/widgets/medicine_list_tile.dart';

class MedicinesScreen extends ConsumerWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicines = ref.watch(medicinesProvider);
    final medicineListCategory = ref.watch(medicineListCategoryProvider);

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
            'Add your medicine!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (medicines.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(medicines[index].id),
          onDismissed: (direction) {
            if (medicineListCategory == MedicineListCategory.allMedicines) {
              final allMedicinesNotifier =
                  ref.read(allMedicinesProvider.notifier);
              allMedicinesNotifier.deleteMedicine(medicines[index]);
            } else if (medicineListCategory ==
                MedicineListCategory.myMedicines) {
              final myMedicinesNotifier =
                  ref.read(myMedicinesProvider.notifier);
              myMedicinesNotifier.removeFromMyMedicines(medicines[index]);
            }
          },
          child: MedicineListTile(
            medicine: medicines[index],
          ),
        ),
        itemCount: medicines.length,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(medicineListCategory == MedicineListCategory.allMedicines
            ? 'All Medicines'
            : 'My Medicines'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddMedicineScreen(),
                ));
              },
              icon: const Icon(Icons.add)),
          PopupMenuButton(
            onSelected: (value) {
              final medicineListCategoryNotifier =
                  ref.read(medicineListCategoryProvider.notifier);
              medicineListCategoryNotifier.changeCategoryTo(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: MedicineListCategory.allMedicines,
                child: Text('All Medicines'),
              ),
              const PopupMenuItem(
                value: MedicineListCategory.myMedicines,
                child: Text('My Medicines'),
              ),
            ],
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: content,
    );
  }
}
