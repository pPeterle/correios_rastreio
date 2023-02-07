import 'package:correios_rastreio/correios_rastreio.dart';

void main() async {
  var correios = CorreiosRastreio();
  final package = await correios.rastrearEncomenda('TE069330491BR');
  final events = package.events;
  print(events.length);
  print(events[0].data);
  print(events[0].hora);
  print(events[0].destino);
  print(events[0].status);
  print(events[0].origem);
  print(events[0].local);
}
