class GameCard {
  final String id;
  final String categoria;
  final String nivel;
  final String tipo;
  final String texto;
  final int? goles;
  final int? golesSeGular;
  final int? golesPenalidade;
  final String? golesAfetados;
  final int? golesDistribuir;
  final String? efeito;
  final String? duracao;
  final String? restricao;

  GameCard({
    required this.id,
    required this.categoria,
    required this.nivel,
    required this.tipo,
    required this.texto,
    this.goles,
    this.golesSeGular,
    this.golesPenalidade,
    this.golesAfetados,
    this.golesDistribuir,
    this.efeito,
    this.duracao,
    this.restricao,
  });

  factory GameCard.fromJson(Map<String, dynamic> json) {
    return GameCard(
      id: json['id'] as String,
      categoria: json['categoria'] as String,
      nivel: json['nivel'] as String,
      tipo: json['tipo'] as String,
      texto: json['texto'] as String,
      goles: json['goles'] as int?,
      golesSeGular: json['goles_se_pular'] as int?,
      golesPenalidade: json['goles_penalidade'] as int?,
      golesAfetados: json['goles_afetados'] as String?,
      golesDistribuir: json['goles_distribuir'] as int?,
      efeito: json['efeito'] as String?,
      duracao: json['duracao'] as String?,
      restricao: json['restricao'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoria': categoria,
      'nivel': nivel,
      'tipo': tipo,
      'texto': texto,
      if (goles != null) 'goles': goles,
      if (golesSeGular != null) 'goles_se_pular': golesSeGular,
      if (golesPenalidade != null) 'goles_penalidade': golesPenalidade,
      if (golesAfetados != null) 'goles_afetados': golesAfetados,
      if (golesDistribuir != null) 'goles_distribuir': golesDistribuir,
      if (efeito != null) 'efeito': efeito,
      if (duracao != null) 'duracao': duracao,
      if (restricao != null) 'restricao': restricao,
    };
  }
}
