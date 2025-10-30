import 'package:flutter/material.dart';
import '../models/game_card.dart';
import '../theme/app_theme.dart';

class GameCardWidget extends StatelessWidget {
  final GameCard card;
  final Color categoryColor;

  const GameCardWidget({
    super.key,
    required this.card,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [categoryColor, categoryColor.withValues(alpha: 0.8)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: categoryColor.withValues(alpha: 0.5),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),

          // Card content
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Level badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBadge(
                      card.nivel.toUpperCase(),
                      AppTheme.getLevelColor(card.nivel),
                    ),
                    _buildBadge(
                      card.tipo.toUpperCase(),
                      Colors.white.withValues(alpha: 0.3),
                    ),
                  ],
                ),

                const Spacer(),

                // Card text
                Center(
                  child: Text(
                    card.texto,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const Spacer(),

                // Goles information
                if (_hasGolesInfo())
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.5),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.local_bar,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _getGolesText(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Restriction badge
                if (card.restricao != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.levelPesado,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          card.restricao!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  bool _hasGolesInfo() {
    return card.goles != null ||
        card.golesSeGular != null ||
        card.golesPenalidade != null ||
        card.golesDistribuir != null;
  }

  String _getGolesText() {
    if (card.goles != null) {
      return '${card.goles} ${card.goles == 1 ? 'gole' : 'goles'}';
    }
    if (card.golesSeGular != null) {
      return 'Pular: ${card.golesSeGular} ${card.golesSeGular == 1 ? 'gole' : 'goles'}';
    }
    if (card.golesPenalidade != null) {
      return 'Penalidade: ${card.golesPenalidade} ${card.golesPenalidade == 1 ? 'gole' : 'goles'}';
    }
    if (card.golesDistribuir != null) {
      return 'Distribuir: ${card.golesDistribuir} ${card.golesDistribuir == 1 ? 'gole' : 'goles'}';
    }
    return '';
  }
}
