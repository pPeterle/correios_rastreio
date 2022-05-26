import 'package:correios_rastreio/src/model/RastreioEvent.dart';

class RastreioModel {
  final String code;
  final List<RastreioEvent> events;

  RastreioModel({required this.code, required this.events});
}
