import 'package:correios_rastreio/src/model/RastreioEvent.dart';
import 'package:correios_rastreio/src/util/erro.dart';
import 'package:correios_rastreio/src/util/formatter.dart';
import 'package:correios_rastreio/src/util/urls.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class CorreiosRastreio with Formatter {
  Future<List<RastreioEvent>> rastrearEncomenda(String encomenda) async {
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
    return events;
  }

  RastreioEvent _getEvent(Element ul) {
    String? status, data, hora, local, origem, destino;
    ul.querySelectorAll('li').forEach((li) {
      final text = li.text;
      if (text.isNotEmpty) {
        if (text.contains('Status')) status = formatStatus(text);
        if (text.contains('Local')) local = formatLocal(text);
        if (text.contains('Origem')) origem = formatOrigin(text);
        if (text.contains('Destino')) destino = formatDestiny(text);
        if (text.contains('Data')) {
          final datetime = formatDateTime(text);
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
