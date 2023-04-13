import 'dart:convert';

import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:correios_rastreio/src/util/urls.dart';
import 'package:http/http.dart' as http;

const REQUEST_TOKEN =
    'YW5kcm9pZDtici5jb20uY29ycmVpb3MucHJlYXRlbmRpbWVudG87RjMyRTI5OTc2NzA5MzU5ODU5RTBCOTdGNkY4QTQ4M0I5Qjk1MzU3OA==';

class CorreiosRastreio {
  String? tokenValue;
  int tokenExpiration = 0;
  Future<dynamic>? tokenFuture;

  /// Recebe o código da encomenda
  /// retorna [Encomenda] contendo todas suas informacoes
  /// Pode lancar uma exceção [CodeNotFound] em caso de código
  /// não encontrado
  Future<Encomenda> rastrearEncomenda(String codigo) async {
    final token = await _getTokenApp();
    final uri = Uri.parse('$URL_RASTREIO$codigo');
    final result = await http.get(uri, headers: {
      'content-type': 'application/json',
      'user-agent': 'Dart/2.18 (dart:io)',
      'app-check-token': token,
    });

    final json = jsonDecode(utf8.decode(result.bodyBytes))['objetos'][0];

    final mensagem = json['mensagem'];
    if (mensagem != null && mensagem.length != 0) {
      throw CodeNotFound();
    }

    return Encomenda.fromJson(json);
  }

  Future _getTokenApp() {
    // Checa se o token está em cache e se não está expirado
    if (tokenValue != null &&
        tokenExpiration > DateTime.now().millisecondsSinceEpoch) {
      return Future.value(tokenValue);
    }

    // Checa se já existe uma promise de token em andamento
    if (tokenFuture != null) {
      return tokenFuture!;
    }

    tokenFuture = http
        .post(Uri.parse(URL_TOKEN),
            headers: {
              'content-type': 'application/json',
              'user-agent': 'Dart/2.18 (dart:io)',
            },
            body: jsonEncode({'requestToken': REQUEST_TOKEN}))
        .then((response) {
      tokenFuture = null;
      final jwt = jsonDecode(response.body)['token'];
      final jwtData = jwt.split('.')[1];
      final codec = Base64Codec();
      final jwtBuffer = base64Decode(codec.normalize(jwtData));
      final jwtString = String.fromCharCodes(jwtBuffer);

      final jwtObject = jsonDecode(jwtString);

      tokenValue = jwt;
      tokenExpiration =
          jwtObject['exp'] * 1000 - 120000; // 120 segundos de margem
      return jwt;
    }).catchError((error) {
      tokenValue = null;
      tokenExpiration = 0;
      tokenFuture = null;
      return AuthError();
    });

    return tokenFuture!;
  }
}
