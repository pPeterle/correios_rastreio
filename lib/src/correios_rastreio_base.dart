import 'package:correios_rastreio/src/model/rastreio_event.dart';
import 'package:correios_rastreio/src/model/rastreio_model.dart';
import 'package:correios_rastreio/src/util/erro.dart';
import 'package:correios_rastreio/src/util/formatter.dart';
import 'package:correios_rastreio/src/util/urls.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class CorreiosRastreio {
  /// Recebe o código da encomenda
  /// retorna [RastreioModel] contendo todas suas informacoes
  /// Pode lancar uma exceção [CodeNotFound] em caso de código
  /// não encontrado
  Future<RastreioModel> rastrearEncomenda(String encomenda) async {
    final url = Uri.parse('$BASERASTREIO/$encomenda');
    print(url.toString());
    final response = await http.get(url, headers: {
      'content-type': 'text; charset=utf-8',
      'cache-control': 'no-cache'
    });

    final document = parse(response.body);
    final ulList = document.querySelectorAll('ul.linha_status');
    if (ulList.isEmpty) {
      throw CodeNotFound();
    }

    final events = <RastreioEvent>[];
    ulList.forEach((ul) {
      final event = _getEvent(ul);
      events.add(event);
    });
    return RastreioModel(code: encomenda, events: events);
  }

  RastreioEvent _getEvent(Element ul) {
    String? status, data, hora, local, origem, destino;
    ul.querySelectorAll('li').forEach((li) {
      final text = li.text;
      if (text.isNotEmpty) {
        if (text.contains('Status')) status = Util.formatStatus(text);
        if (text.contains('Local')) local = Util.formatLocal(text);
        if (text.contains('Origem')) origem = Util.formatOrigin(text);
        if (text.contains('Destino')) destino = Util.formatDestiny(text);
        if (text.contains('Data')) {
          final datetime = Util.formatDateTime(text);
          data = datetime[0];
          hora = datetime[1];
        }
      }
    });
    return RastreioEvent(
      status: status!,
      data: data!,
      hora: hora!,
      local: local,
      origem: origem,
      destino: destino,
    );
  }
}
