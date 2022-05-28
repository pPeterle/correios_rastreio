class Util {
  /// Filtra a string [str] recebida no html
  /// para retornar apenas o status
  static String formatStatus(String str) {
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
  static List<String> formatDateTime(String str) {
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
  static String formatLocal(String str) {
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
  static String formatOrigin(String str) {
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
  static String formatDestiny(String str) {
    final res = str
        .replaceAll('Destino', '')
        .replaceAll('\s\s+', ' ')
        .replaceAll(':', '')
        .trim();
    return res;
  }
}
