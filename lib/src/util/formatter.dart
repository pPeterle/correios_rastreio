mixin Formatter {
  String formatStatus(String str) {
    /**
   * @param {string} str
   * Função responsável formatar o Local de entrega de uma encomenda
   */
    final res = str
        .replaceAll('Status', '')
        .replaceAll(RegExp('\s\s+'), ' ')
        .replaceAll(':', '')
        .trim();
    return res;
  }

  List<String> formatDateTime(String str) {
    /**
   * @param {string} str
   * Função responsável por a formatação da data e hora de entrega de uma encomenda
   */
    final res = str
        .split(' ')
        .join('')
        .replaceAll(RegExp('\s\s+'), ' ')
        .replaceAll('Data:', '')
        .replaceAll('Hora:', '')
        .split('|');

    return res;
  }

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

  String formatDestiny(String str) {
    /**
   * @param {string} str
   * Função responsável formatar o Destino do trajeto de entrega de uma encomenda
   */
    final res = str
        .replaceAll('Destino', '')
        .replaceAll('\s\s+', ' ')
        .replaceAll(':', '')
        .trim();
    return res;
  }
}
