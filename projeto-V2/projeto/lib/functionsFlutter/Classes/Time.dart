class Time {
  final String nomeTime, urlImageTime, esporteTime;
  final List<List<String>> listPartici;

  Time(
      {required this.nomeTime,
      required this.urlImageTime,
      required this.esporteTime,
      required this.listPartici});

  Map<String, dynamic> toJson() {
    return {
      "nomeTime": nomeTime,
      "urlImageTime": urlImageTime,
      "esporteTime": esporteTime,
      "listPartici": listPartici
    };
  }

  factory Time.fromJson(Map<String, dynamic> json, uid) => Time(
      nomeTime: json["nomeTime"],
      esporteTime: json["urlImageTime"],
      listPartici: json["esporteTime"],
      urlImageTime: json["listPartici"]);
}
