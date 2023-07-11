enum StorageClimate {
  dark,
  dry,
  sunlight,
  moisture,
}


extension StorageClimateToString on StorageClimate {
  String toStr() {
    switch (this) {
      case StorageClimate.dark:
        return 'area without sunlight';
      case StorageClimate.dry:
        return 'dry surroundings';
      case StorageClimate.sunlight:
        return 'sunlight';
      case StorageClimate.moisture:
        return 'moisture';
    }
  }
}