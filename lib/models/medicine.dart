import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/enums%20and%20extensions/storage_climate_enum.dart';

class Medicine {
  final String id;
  final String? imageUrl;
  final String title;
  final String? brandName;
  final MedicineTypes medicineType;
  final String? dosage;
  final int price;
  final List<String>? salts;
  final StorageClimate storageClimate;

  const Medicine({
    required this.id,
    this.imageUrl,
    required this.title,
    this.brandName,
    required this.medicineType,
    this.dosage,
    required this.price,
    this.salts,
    required this.storageClimate,
  });

  @override
  String toString() {
    return title;
  }

  @override
  bool operator ==(covariant Medicine other) {
    return id == other.id;
  }
  
  @override
  int get hashCode => id.hashCode;
  
}
