import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_app/data/dummy_data.dart';

final allDiseasesProvider = Provider((ref) => dummyDiseases);
