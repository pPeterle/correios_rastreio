mixin Formatter {
  /// Filtra a string [str] recebida no html
  /// para retornar apenas o status
  String formatStatus(String str) {
    final res = str
        .replaceAll('Status', '')
        .replaceAll(RegExp('\s\s+'), ' ')
        .replaceAll(':', '')
        .trim();
    return res;
  }

  /// Filtra a Data [str] recebida no html
  /// para retornar uma lista contendo a data no primeiro index
  /// e a hora no segundo index
  List<String> formatDateTime(String str) {
    final res = str
        .split(' ')
        .join('')
        .replaceAll(RegExp('\s\s+'), ' ')
        .replaceAll('Data:', '')
        .replaceAll('Hora:', '')
        .split('|');

    return res;
  }

  /// Filtra a string [str] recebida no html
  /// para retornar apenas o Local
  String formatLocal(String str) {
    /**
   * @param {string} str
   * Função responsável formatar o Local de entrega de uma encomenda
   */
    final res = str
        .replaceAll('Local', '')
        .replaceAll(RegExp('\s\s+'), ' ')
        .replaceAll(':', '')
        .trim();
    return res;
  }

  /// Filtra a string [str] recebida no html
  /// para retornar apenas a Origem
  String formatOrigin(String str) {
    /**
   * @param {string} str
   * Função responsável formatar o Origem do trajeto de entrega de uma encomenda
   */
    final res = str
        .replaceAll('Origem', '')
        .replaceAll(RegExp('\s\s+'), ' ')
        .replaceAll(':', '')
        .trim();
    return res;
  }

  /// Filtra a string [str] recebida no html
  /// para retornar apenas o Destino
  String formatDestiny(String str) {
    final res = str
        .replaceAll('Destino', '')
        .replaceAll('\s\s+', ' ')
        .replaceAll(':', '')
        .trim();
    return res;
  }
}
