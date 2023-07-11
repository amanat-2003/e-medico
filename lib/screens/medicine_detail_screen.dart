import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/enums%20and%20extensions/all.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/enums%20and%20extensions/storage_climate_enum.dart';

import 'package:medicine_app/models/medicine.dart';
import 'package:medicine_app/providers/my_medicines_provider.dart';
import 'package:medicine_app/utils/no_scrolling_effect.dart';
import 'package:medicine_app/utils/show_snackbar.dart';
import 'package:transparent_image/transparent_image.dart';

class MedicineDetailScreen extends ConsumerWidget {
  final Medicine medicine;
  const MedicineDetailScreen({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myMedicines = ref.watch(myMedicinesProvider);
    bool isMyMedicine = myMedicines.contains(medicine);
    return Scaffold(
      appBar: AppBar(
        title: Text(medicine.title),
      ),
      body: ScrollConfiguration(
        behavior: NoScrollGlowBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: medicine.imageUrl == null ? const AssetImage('assets/images/bgimg.jpg') as ImageProvider<Object> : NetworkImage(medicine.imageUrl!),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            children: [
                              TextSpan(
                                text: medicine.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: (medicine.medicineType ==
                                            MedicineTypes.bachFlower ||
                                        medicine.medicineType ==
                                            MedicineTypes.homeopathy)
                                    ? ' is a '
                                    : ' is an ',
                              ),
                              TextSpan(
                                text: medicine.medicineType.toStr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(text: ' medicine from the brand '),
                              TextSpan(
                                text: medicine.brandName ?? 'Unknown',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ])),
                    const SizedBox(height: 20),
                    Text(
                      'Price: ₹${medicine.price}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Dosage:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      medicine.dosage ?? 'Unknown',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ingredients/Salts:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      medicine.salts?.toStr() ?? 'Unknown',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Storage:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      ('Store it in ${medicine.storageClimate.toStr()}'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        final myMedicinesNotifier =
                            ref.read(myMedicinesProvider.notifier);
                        if (isMyMedicine) {
                          myMedicinesNotifier.removeFromMyMedicines(medicine);
                          showSnackBar(context,
                              'Removed ${medicine.title} from my medicines.');
                        } else {
                          myMedicinesNotifier.addToMyMedicines(medicine);
                          showSnackBar(context,
                              'Added ${medicine.title} to my medicines.');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          shape: const ContinuousRectangleBorder()),
                      child: Text(isMyMedicine? 'Remove from my medicines' :'Add to my medicines'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
