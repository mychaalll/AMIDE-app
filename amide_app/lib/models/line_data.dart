
import 'package:amide_app/models/individual_line.dart';

class LineData{
  final double day1Amount;
  final double day2Amount;
  final double day3Amount;
  final double day4Amount;
  final double day5Amount;
  final double day6Amount;
  final double day7Amount;

  LineData({
    required this.day1Amount, 
    required this.day2Amount, 
    required this.day3Amount, 
    required this.day4Amount, 
    required this.day5Amount, 
    required this.day6Amount, 
    required this.day7Amount, 
  });

  List<IndividualLine> lineData = [];

  void initializeLineData(){
    lineData = [
      IndividualLine(x: 0, y: day1Amount),
      IndividualLine(x: 1, y: day2Amount),
      IndividualLine(x: 2, y: day3Amount),
      IndividualLine(x: 3, y: day4Amount),
      IndividualLine(x: 4, y: day5Amount),
      IndividualLine(x: 5, y: day6Amount),
      IndividualLine(x: day7Amount, y: day7Amount),
    ];
  }
}

