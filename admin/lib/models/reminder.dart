class Reminder {
  final String name;
  final String music;
  final DateTime time;
  final String detail;

  Reminder({
    required this.name,
    required this.music,
    required this.time,
    required this.detail,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      name: json["name"],
      music: json["music"],
      time: json["time"],
      detail: json["detail"],
    );
  }
}
