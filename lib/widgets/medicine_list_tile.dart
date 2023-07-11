import 'package:flutter/material.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/models/medicine.dart';
import 'package:medicine_app/screens/medicine_detail_screen.dart';
import 'package:medicine_app/utils/string_to_rupee_format.dart';

class MedicineListTile extends StatelessWidget {
  const MedicineListTile({
    super.key,
    required this.medicine,
  });

  final Medicine medicine;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        medicine.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        medicine.medicineType.toStr(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage(
            'assets/images/${medicine.medicineType.name}.jpeg'),
      ),
      trailing: Text(medicine.price.inRupeesFormat(), style: const TextStyle(color: Colors.white, fontSize: 18),),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MedicineDetailScreen(medicine: medicine),
        ));
      },
    );
  }
}
