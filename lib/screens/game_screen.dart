import 'package:flutter/material.dart';
import 'dart:math';
import '../models/game_card.dart';
import '../models/category.dart';
import '../theme/app_theme.dart';
import '../widgets/game_card_widget.dart';

class GameScreen extends StatefulWidget {
  final Category category;
  final List<GameCard> cards;

  const GameScreen({super.key, required this.category, required this.cards});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late List<GameCard> _shuffledCards;
  int _currentIndex = 0;
  late AnimationController _cardAnimationController;
  late Animation<double> _cardAnimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _shuffledCards = List.from(widget.cards)..shuffle(Random());

    _cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _cardAnimation = CurvedAnimation(
      parent: _cardAnimationController,
      curve: Curves.easeOutBack,
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(-1.5, 0),
        ).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );

    _cardAnimationController.forward();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _nextCard() {
    _slideController.forward().then((_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _shuffledCards.length;
      });
      _slideController.reset();
      _cardAnimationController.reset();
      _cardAnimationController.forward();
    });
  }

  void _reshuffleCards() {
    setState(() {
      _shuffledCards.shuffle(Random());
      _currentIndex = 0;
    });
    _cardAnimationController.reset();
    _cardAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final currentCard = _shuffledCards[_currentIndex];
    final progress = (_currentIndex + 1) / _shuffledCards.length;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.category.icon, size: 28),
            const SizedBox(width: 8),
            Text(widget.category.nome),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: _reshuffleCards,
            tooltip: 'Embaralhar',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.backgroundColor,
              widget.category.color.withValues(alpha: 0.2),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progress indicator
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Carta ${_currentIndex + 1} de ${_shuffledCards.length}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: widget.category.color,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.white12,
                        color: widget.category.color,
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),

              // Card display area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _cardAnimation,
                      child: GameCardWidget(
                        card: currentCard,
                        categoryColor: widget.category.color,
                      ),
                    ),
                  ),
                ),
              ),

              // Next button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _nextCard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.category.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Próxima Carta',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
