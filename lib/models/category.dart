import 'package:flutter/material.dart';

class Category {
  final String id;
  final String nome;
  final String descricao;
  final Color color;
  final IconData icon;

  Category({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.color,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
      color: _getCategoryColor(json['id'] as String),
      icon: _getCategoryIcon(json['id'] as String),
    );
  }

  static Color _getCategoryColor(String id) {
    switch (id) {
      case 'eu_nunca':
        return const Color(0xFF6C63FF);
      case 'verdade_ou_desafio':
        return const Color(0xFFFF6584);
      case 'desafios_rapidos':
        return const Color(0xFFFFB26B);
      case 'picante':
        return const Color(0xFFFF4757);
      case 'party':
        return const Color(0xFF26de81);
      case 'regras':
        return const Color(0xFF4b7bec);
      case 'votacao':
        return const Color(0xFFa55eea);
      default:
        return Colors.grey;
    }
  }

  static IconData _getCategoryIcon(String id) {
    switch (id) {
      case 'eu_nunca':
        return Icons.block;
      case 'verdade_ou_desafio':
        return Icons.psychology;
      case 'desafios_rapidos':
        return Icons.flash_on;
      case 'picante':
        return Icons.local_fire_department;
      case 'party':
        return Icons.celebration;
      case 'regras':
        return Icons.rule;
      case 'votacao':
        return Icons.how_to_vote;
      default:
        return Icons.style;
    }
  }
}
