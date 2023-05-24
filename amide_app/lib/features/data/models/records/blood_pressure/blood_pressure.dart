import 'package:amide_app/features/data/models/records/blood_pressure/diastolic.dart';
import 'package:amide_app/features/data/models/records/blood_pressure/systolic.dart';

class BloodPressure {
  final int id;
  final Diastolic diastolic;
  final Systolic systolic;

  BloodPressure({
    required this.id,
    required this.diastolic,
    required this.systolic,
  });
}
