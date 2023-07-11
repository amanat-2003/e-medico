enum MedicineTypes {
  allopathy,
  homeopathy,
  bachFlower,
  ayurveda,
}

extension MedicineTypeToString on MedicineTypes {
  String toStr() {
    return name[0].toUpperCase() + name.substring(1);
  }
}
