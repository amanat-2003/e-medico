import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/enums%20and%20extensions/disease_severity_enum.dart';


class Disease {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final List<MedicineTypes> medicineTypesAvailable;
  final DiseaseSeverity diseaseSeverity;
  final int recoveryDays;
  final List<String> medicines;

  Disease({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.medicineTypesAvailable,
    required this.diseaseSeverity,
    required this.recoveryDays,
    required this.medicines,
  });
}
