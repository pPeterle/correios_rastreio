Correios Rastreio é uma biblioteca pra facilitar o rastreamento de pacotes nos correios, ela utiliza o site

## Usage

Simples exemplo:

```dart
import 'package:correios_rastreio/correios_rastreio.dart';

void main() async {
  var correios = CorreiosRastreio();
  final events = await correios.rastrearEncomenda('AB12345678912BR');
  print(events[0].data);
  print(events[0].hora);
  print(events[0].destino);
  print(events[0].status);
  print(events[0].origem);
  print(events[0].local);
}

```

## Features

Por enquanto a única feature é o rastreio de encomendas, mas futuramente irei implementar a pesquisa por cep e calculo do preço de envio.

Quaisquer dúvidas ou erro criar issue no github.
