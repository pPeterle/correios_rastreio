Correios Rastreio é uma biblioteca pra facilitar o rastreamento de pacotes nos correios, inspirado na biblioteca [Rastreio Brasil](https://github.com/FinotiLucas/Correios-Brasil)

## Usage

Simples exemplo:

```dart
import 'package:correios_rastreio/correios_rastreio.dart';

void main() async {
  var correios = CorreiosRastreio();

  final result = await correios.rastrearEncomenda('QB944791449BR');

  print(result.eventos.length);
  print(result.eventos.length);
  print(result.eventos[0].descricao);
  print(result.eventos[0].data);
}

```

## Features

Por enquanto a única feature é o rastreio de encomendas, mas futuramente irei implementar a pesquisa por cep e calculo do preço de envio.

Quaisquer dúvidas ou erro criar issue no github.
