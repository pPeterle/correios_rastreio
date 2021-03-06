class RastreioEvent {
  final String status;
  final String data;
  final String hora;
  final String? origem;
  final String? destino;
  final String? local;

  const RastreioEvent({
    required this.status,
    required this.data,
    required this.hora,
    this.origem,
    this.destino,
    this.local,
  });
}
