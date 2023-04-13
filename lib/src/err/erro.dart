class CodeNotFound extends Error {
  String get message => 'Código de rastreio não encontrado';
}

class AuthError extends Error {
  String get message => 'Erro ao criar token';
}
