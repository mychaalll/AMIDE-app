class Music {
  final int hour;
  final int minute;
  final int musicKey;

  Music({
    required this.hour,
    required this.minute,
    required this.musicKey,
  });

  factory Music.fromJson(Map<String, dynamic> json) => Music(
        hour: json["hour"],
        minute: json["minute"],
        musicKey: json["musicKey"],
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "minute": minute,
        "musicKey": musicKey,
      };
}
