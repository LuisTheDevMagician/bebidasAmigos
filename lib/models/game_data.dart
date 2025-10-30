import 'dart:convert';
import 'package:flutter/services.dart';
import 'game_card.dart';
import 'category.dart';

class GameData {
  final Map<String, dynamic> meta;
  final List<Category> categorias;
  final List<GameCard> cartas;
  final Map<String, dynamic> sugestoesUso;

  GameData({
    required this.meta,
    required this.categorias,
    required this.cartas,
    required this.sugestoesUso,
  });

  factory GameData.fromJson(Map<String, dynamic> json) {
    return GameData(
      meta: json['meta'] as Map<String, dynamic>,
      categorias: (json['categorias'] as List)
          .map((cat) => Category.fromJson(cat as Map<String, dynamic>))
          .toList(),
      cartas: (json['cartas'] as List)
          .map((card) => GameCard.fromJson(card as Map<String, dynamic>))
          .toList(),
      sugestoesUso: json['sugestoes_uso'] as Map<String, dynamic>,
    );
  }

  static Future<GameData> loadFromAssets() async {
    final String jsonString = await rootBundle.loadString(
      'lib/data/game_data.json',
    );
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return GameData.fromJson(jsonData);
  }

  List<GameCard> getCardsByCategory(String categoryId) {
    return cartas.where((card) => card.categoria == categoryId).toList();
  }

  List<GameCard> getCardsByCategoryAndLevel(String categoryId, String level) {
    return cartas
        .where((card) => card.categoria == categoryId && card.nivel == level)
        .toList();
  }
}
