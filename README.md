# Bebedeira com Amigos 🍻

Um aplicativo Flutter divertido e interativo para drinking games com amigos!

## 📱 Sobre o App

**Bebedeira com Amigos** é um aplicativo de entretenimento para festas que oferece 7 categorias diferentes de desafios, perguntas e brincadeiras para animar suas reuniões.

### 🎯 Categorias

1. **Eu Nunca** - Quem já fez, bebe!
2. **Verdade ou Desafio** - Responda honestamente ou encare o gole
3. **Desafios Rápidos** - Ações simples e engraçadas
4. **Picante** 🌶️ - Perguntas apimentadas (18+)
5. **Party** 🎉 - Clima de festa e risadas
6. **Regras de Jogo** - Regras persistentes que mudam a dinâmica
7. **Votação** - O grupo decide quem bebe

## ✨ Características

- 🎨 **Interface Atrativa**: Design moderno com gradientes coloridos e animações suaves
- 🃏 **147 Cartas**: 21 cartas únicas por categoria
- 🎲 **Sistema de Níveis**: Leve, Médio e Pesado
- 🔄 **Embaralhamento**: Cartas aleatórias a cada rodada
- 📊 **Progresso Visual**: Acompanhe quantas cartas já foram jogadas
- 🎭 **Animações**: Transições fluidas entre cartas

## 📂 Estrutura do Projeto

```
lib/
├── data/
│   └── game_data.json          # Banco de dados de cartas
├── models/
│   ├── category.dart           # Modelo de categoria
│   ├── game_card.dart          # Modelo de carta
│   └── game_data.dart          # Carregador de dados
├── screens/
│   ├── category_selection_screen.dart  # Tela de seleção
│   └── game_screen.dart        # Tela do jogo
├── theme/
│   └── app_theme.dart          # Tema e cores
├── widgets/
│   ├── category_card.dart      # Card de categoria
│   └── game_card_widget.dart   # Card de jogo
└── main.dart                   # Ponto de entrada
```

## 🚀 Como Executar

1. Certifique-se de ter o Flutter instalado
2. Clone o repositório
3. Execute os comandos:

```bash
flutter pub get
flutter run
```

## 🎮 Como Jogar

1. **Escolha uma Categoria**: Na tela inicial, selecione uma das 7 categorias
2. **Vire as Cartas**: Toque em "Próxima Carta" para revelar desafios
3. **Siga as Instruções**: Cada carta tem instruções claras sobre quem bebe
4. **Embaralhe**: Use o botão de embaralhar para misturar as cartas

## ⚠️ Aviso Importante

**Beba com responsabilidade. Não dirija após beber.**

Este é um jogo para maiores de 18 anos. Sempre respeite seus limites e dos seus amigos.

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework de desenvolvimento
- **Dart** - Linguagem de programação
- **Material Design** - Design system

## 📱 Compatibilidade

- ✅ Android
- ✅ iOS

## 🎨 Paleta de Cores

- **Eu Nunca**: Roxo (`#6C63FF`)
- **Verdade ou Desafio**: Rosa (`#FF6584`)
- **Desafios Rápidos**: Laranja (`#FFB26B`)
- **Picante**: Vermelho (`#FF4757`)
- **Party**: Verde (`#26de81`)
- **Regras**: Azul (`#4b7bec`)
- **Votação**: Roxo Claro (`#a55eea`)

## 📝 Versão

**v1.0** - Versão inicial com todas as categorias e 147 cartas

## 👨‍💻 Desenvolvimento

Desenvolvido com ❤️ para diversão responsável!

---

**Divirta-se e beba com moderação! 🍺**

