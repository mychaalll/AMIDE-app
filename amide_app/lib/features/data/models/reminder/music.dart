class Music {
  final int hour;
  final int minute;
  final int musicKey;
  final String? id;

  Music({
    required this.hour,
    required this.minute,
    required this.musicKey,
    this.id,
  });

  factory Music.fromJson(Map<String, dynamic> json) => Music(
        hour: json["hour"],
        minute: json["minute"],
        musicKey: json["musicKey"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "minute": minute,
        "musicKey": musicKey,
      };
}
