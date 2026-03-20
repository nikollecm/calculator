# Flutter App - Calculadora

Uma calculadora construída com Flutter

## Por que construí isso

Este projeto foi criado como uma forma prática de aprender e implementar os fundamentos do Flutter e gerenciamento de estado usando conceitos como:

- Gerenciamento de estado local
- Separação de responsabilidades (UI, lógica, dados)
- Widgets customizados
- Criação de componentes reutilizáveis
- Implementação de operações matemáticas e validações

## Funcionalidades

- Operações aritméticas básicas (adição, subtração, multiplicação, divisão)
- Cálculos de porcentagem
- Suporte para números decimais
- Funções de limpar e deletar
- Interface limpa e intuitiva
- Design responsivo
- Integração com Google Fonts customizadas

## Estrutura do Projeto

```
lib/
├── main.dart                    # Ponto de entrada do app
├── app.dart                     # Configuração principal do app
├── constants/
│   ├── app_colors.dart         # Paleta de cores
│   └── app_styles.dart         # Estilos de texto e temas
├── models/
│   └── calculator_state.dart   # Modelo de gerenciamento de estado
├── screens/
│   └── calculator_screen.dart  # Tela principal da calculadora
├── services/
│   └── calculator_service.dart # Lógica de negócio
└── widgets/
    ├── calculator_button.dart  # Widget de botão reutilizável
    └── calculator_display.dart # Widget do display
```

## Como Executar

### Pré-requisitos

- Flutter SDK (^3.10.7)
- Dart SDK
- Android Studio / VS Code com extensões Flutter

### Passo 1. Instalar dependências do Flutter

```bash
flutter pub get
```

### Passo 2. Executar o app

```bash
flutter run
```

## Arquitetura

O projeto segue um padrão de arquitetura limpa:

- **Constants**: Cores e estilos centralizados
- **Models**: Estruturas de dados para gerenciamento de estado
- **Services**: Lógica de negócio separada da UI
- **Screens**: Visualizações de página completa
- **Widgets**: Componentes de UI reutilizáveis

Esta estrutura torna o código:

- Fácil de manter
- Simples de testar
- Escalável para futuras funcionalidades
- Clara separação de responsabilidades

## Como Funciona

1. **Gerenciamento de Estado**: Usa o modelo `CalculatorState` para rastrear números atuais, operação e display
2. **Lógica de Negócio**: `CalculatorService` lida com todos os cálculos
3. **Componentes de UI**: Widgets modulares para botões e display
4. **Lógica da Tela**: `CalculatorScreen` gerencia interações do usuário e atualizações de estado

## Aprendizados
Durante o desenvolvimento deste projeto, aprendi:
1. **Gerenciamento de Estado**
2. **Arquitetura Limpa**
3. **Design UI/UX**
4. **Resolução de Problemas**

## Próximos passos

- [ ] Modo calculadora científica
- [ ] Histórico de cálculos
- [ ] Customização de tema
- [ ] Suporte para modo paisagem

## Licença

Este projeto é de código aberto e está disponível para fins educacionais.