import 'package:correios_rastreio/correios_rastreio.dart';

void main() async {
  var correios = CorreiosRastreio();

  final result = await correios.rastrearEncomenda('NA991007796BR');

  print(result.eventos.length);
  print(result.eventos.length);
  print(result.eventos[0].descricao);
  print(result.eventos[0].data);
}
