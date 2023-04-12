import 'package:amide_app/models/individual_bar.dart';

class BarData{
  final double day1Amount;
  final double day2Amount;
  final double day3Amount;
  final double day4Amount;
  final double day5Amount;
  final double day6Amount;
  final double day7Amount;

  BarData({
    required this.day1Amount, 
    required this.day2Amount, 
    required this.day3Amount, 
    required this.day4Amount, 
    required this.day5Amount, 
    required this.day6Amount, 
    required this.day7Amount, 
  });

  List<IndividualBar> barData = [];

  //initialize bar data
  void initializeBarData(){
    barData = [
      IndividualBar(x: day1Amount.toInt(), y: day1Amount),
      IndividualBar(x: day2Amount.toInt(), y: day2Amount),
      IndividualBar(x: day3Amount.toInt(), y: day3Amount),
      IndividualBar(x: day4Amount.toInt(), y: day4Amount),
      IndividualBar(x: day5Amount.toInt(), y: day5Amount),
      IndividualBar(x: day6Amount.toInt(), y: day6Amount),
      IndividualBar(x: day7Amount.toInt(), y: day7Amount),
    ];
  }
}
