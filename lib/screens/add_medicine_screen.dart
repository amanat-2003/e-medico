import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/enums%20and%20extensions/storage_climate_enum.dart';
import 'package:medicine_app/models/medicine.dart';
import 'package:medicine_app/providers/all_medicines_provider.dart';
import 'package:medicine_app/utils/no_scrolling_effect.dart';


class AddMedicineScreen extends ConsumerStatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  ConsumerState<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends ConsumerState<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  String? imageUrl;
  var medicineType = MedicineTypes.ayurveda;
  var storageClimate = StorageClimate.dry;
  String? brandName;
  String? dosage;
  late int price;
  List<String>? salts;
  final imageUrlController = TextEditingController();

  @override
  void initState() {
    // imageUrlController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    imageUrlController.dispose();
    super.dispose();
  }

  void _saveMedicine() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final medicineToAdd = Medicine(
        id: const Uuid().v4(),
        title: title,
        brandName: brandName,
        dosage: dosage,
        imageUrl: imageUrl,
        salts: salts,
        medicineType: medicineType,
        price: price,
        storageClimate: storageClimate,
      );
      final allMedicinesNotifier = ref.read(allMedicinesProvider.notifier);
      allMedicinesNotifier.addMedicine(medicineToAdd);
      Navigator.of(context).pop();
      // title.log();
      // imageUrl?.log();
      // medicineType.log();
      // storageClimate.log();
      // brandName?.log();
      // dosage?.log();
      // price.log();
      // salts?.log();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add a medicine'),
        ),
        body: ScrollConfiguration(
          behavior: NoScrollGlowBehaviour(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name of medicine
                    TextFormField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Name of medicine*'),
                      ),
                      style: TextStyle(color: textColor),
                      keyboardType: TextInputType.name,
                      onSaved: (newValue) {
                        title = newValue!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length > 50) {
                          return 'Name of medicine should be between 1 to 50 characters long';
                        } else {
                          return null;
                        }
                      },
                    ),

                    // Brand Name
                    TextFormField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Brand Name'),
                      ),
                      style: TextStyle(color: textColor),
                      keyboardType: TextInputType.name,
                      onSaved: (newValue) {
                        brandName = newValue;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        } else if (value.trim().length > 50) {
                          return 'Name of brand should be between 1 to 50 characters long';
                        } else {
                          return null;
                        }
                      },
                    ),

                    // Dosage
                    TextFormField(
                      maxLines: 2,
                      decoration: const InputDecoration(
                        label: Text('Dosage'),
                      ),
                      style: TextStyle(color: textColor),
                      onSaved: (newValue) {
                        dosage = newValue;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        } else if (value.trim().length > 70) {
                          return 'Dosage should be between 1 to 70 characters long';
                        } else {
                          return null;
                        }
                      },
                    ),

                    // Salts
                    TextFormField(
                      maxLines: 2,
                      decoration: const InputDecoration(
                        label: Text('Salts'),
                        hintText: 'Separate each by a comma \',\''
                      ),
                      style: TextStyle(color: textColor),
                      onSaved: (newValue) {
                        if (newValue == null || newValue.isEmpty) return;
                        salts =
                            newValue.split(',').map((e) => e.trim()).toList();
                      },
                    ),

                    // Price
                    TextFormField(
                      maxLength: 10,
                      decoration: const InputDecoration(
                        label: Text('Price*'),
                      ),
                      style: TextStyle(color: textColor),
                      keyboardType: TextInputType.number,
                      onSaved: (newValue) {
                        price = int.parse(newValue!);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.parse(value) <= 0) {
                          return 'Enter correct price value';
                        } else {
                          return null;
                        }
                      },
                    ),

                    // Picture and textfield row
                    Row(
                      children: [
                        // Picture
                        Card(
                          color: textColor,
                          shape: const ContinuousRectangleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: (imageUrl == null || imageUrl!.isEmpty)
                                  ? Image.asset(
                                      'assets/images/bgimg.jpg',
                                      fit: BoxFit.cover,
                                    )
                                  : FadeInImage(
                                      placeholder: const AssetImage(
                                          'assets/images/bgimg.jpg'),
                                      image: NetworkImage(
                                        imageUrl!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // textfield
                        Expanded(
                          child: TextField(
                            controller: imageUrlController,
                            maxLines: 2,
                            decoration: const InputDecoration(
                              hintText: 'Medicine Image URL',
                            ),
                            style: TextStyle(color: textColor),
                            onChanged: (value) {
                              setState(() {
                                imageUrl = imageUrlController.text;
                              });
                            },
                            onSubmitted: (value) {
                              setState(() {
                                imageUrl = imageUrlController.text;
                              });
                            },
                          ),
                          // IconButton.filled(
                          //   onPressed: () {},
                          //   icon: const Icon(Icons.check),
                          //   style: ElevatedButton.styleFrom(
                          //       shape: const ContinuousRectangleBorder(),
                          //       minimumSize: const Size(50, 20),
                          //       padding: const EdgeInsets.all(0)),
                          // )
                        ),
                      ],
                    ),

                    // Row of drop down buttons
                    Row(
                      children: [
                        // 1st button
                        Expanded(
                          child: DropdownButtonFormField(
                            hint: const Text('Medicine Type*'),
                            items: [
                              for (final name in MedicineTypes.values)
                                DropdownMenuItem(
                                  value: name,
                                  child: Text(
                                    name.toStr(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                            ],
                            validator: (value) {
                              if (value == null) {
                                return 'Select a medicine type';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                medicineType = value!;
                              });
                            },
                          ),
                        ),

                        const SizedBox(width: 20),

                        // 2nd button
                        Expanded(
                          child: DropdownButtonFormField(
                            hint: const Text('Storage*'),
                            // value: storageClimate,
                            items: [
                              for (final name in StorageClimate.values)
                                DropdownMenuItem(
                                  value: name,
                                  child: Text(
                                    name.toString().split('.').last,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                storageClimate = value!;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Select a storage climate';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Reset button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.reset();
                          },
                          child: const Text('Reset'),
                        ),

                        const SizedBox(width: 10),

                        // Add button
                        ElevatedButton(
                          onPressed: _saveMedicine,
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
