class Evento {
  final String nomeTime, modalidadeEvento;
  final DateTime diaEvento;
  final List<String> statusEvento;

  Evento(
      {required this.nomeTime,
      required this.modalidadeEvento,
      required this.diaEvento,
      required this.statusEvento});

  Map<String, dynamic> toJson() {
    return {
      'nomeTime': nomeTime,
      'modalidadeEvento': modalidadeEvento,
      'diaEvento': diaEvento,
      'statusEvento': statusEvento
    };
  }

  factory Evento.fromJson(Map<String, dynamic> json, uid) => Evento(
      nomeTime: json['nomeTime'],
      modalidadeEvento: json['modalidadeEvento'],
      diaEvento: json['diaEvento'],
      statusEvento: json['statusEvento']);
}
