import 'package:correios_rastreio/correios_rastreio.dart';

class Encomenda {
  Encomenda({
    required this.codObjeto,
    required this.dtPrevista,
    required this.eventos,
    required this.tipoPostal,
    required this.habilitaAutoDeclaracao,
    required this.permiteEncargoImportacao,
    required this.habilitaPercorridaCarteiro,
    required this.bloqueioObjeto,
    required this.possuiLocker,
    required this.habilitaLocker,
    required this.habilitaCrowdshipping,
  });
  late final String codObjeto;
  late final String dtPrevista;
  late final List<Eventos> eventos;
  late final TipoPostal tipoPostal;
  late final bool habilitaAutoDeclaracao;
  late final bool permiteEncargoImportacao;
  late final bool habilitaPercorridaCarteiro;
  late final bool bloqueioObjeto;
  late final bool possuiLocker;
  late final bool habilitaLocker;
  late final bool habilitaCrowdshipping;

  Encomenda.fromJson(Map<String, dynamic> json) {
    codObjeto = json['codObjeto'];
    dtPrevista = json['dtPrevista'];
    eventos =
        List.from(json['eventos']).map((e) => Eventos.fromJson(e)).toList();
    tipoPostal = TipoPostal.fromJson(json['tipoPostal']);
    habilitaAutoDeclaracao = json['habilitaAutoDeclaracao'];
    permiteEncargoImportacao = json['permiteEncargoImportacao'];
    habilitaPercorridaCarteiro = json['habilitaPercorridaCarteiro'];
    bloqueioObjeto = json['bloqueioObjeto'];
    possuiLocker = json['possuiLocker'];
    habilitaLocker = json['habilitaLocker'];
    habilitaCrowdshipping = json['habilitaCrowdshipping'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['codObjeto'] = codObjeto;
    _data['dtPrevista'] = dtPrevista;
    _data['eventos'] = eventos.map((e) => e.toJson()).toList();
    _data['tipoPostal'] = tipoPostal.toJson();
    _data['habilitaAutoDeclaracao'] = habilitaAutoDeclaracao;
    _data['permiteEncargoImportacao'] = permiteEncargoImportacao;
    _data['habilitaPercorridaCarteiro'] = habilitaPercorridaCarteiro;
    _data['bloqueioObjeto'] = bloqueioObjeto;
    _data['possuiLocker'] = possuiLocker;
    _data['habilitaLocker'] = habilitaLocker;
    _data['habilitaCrowdshipping'] = habilitaCrowdshipping;
    return _data;
  }
}
