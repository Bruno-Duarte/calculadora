// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculadora/main.dart';

void main() {
  testWidgets('Teste de exibição de todos os digitos da calculadora',
      (tester) async {
    await tester.pumpWidget(MyApp());

    final digitoZero = find.text('0');
    final digitoUm = find.text('1');
    final digitoDois = find.text('2');
    final digitoTres = find.text('3');
    final digitoQuatro = find.text('4');
    final digitoCinco = find.text('5');
    final digitoSeis = find.text('6');
    final digitoSete = find.text('7');
    final digitoOito = find.text('8');
    final digitoNove = find.text('9');

    expect(digitoZero, findsNWidgets(2));
    expect(digitoUm, findsNWidgets(2));
    expect(digitoDois, findsNWidgets(2));
    expect(digitoTres, findsNWidgets(2));
    expect(digitoQuatro, findsNWidgets(2));
    expect(digitoCinco, findsNWidgets(2));
    expect(digitoSeis, findsNWidgets(2));
    expect(digitoSete, findsNWidgets(2));
    expect(digitoOito, findsNWidgets(2));
    expect(digitoNove, findsNWidgets(2));
  });

  testWidgets(
      'Teste de exibição de todos os botões de operações da calculadora',
      (tester) async {
    await tester.pumpWidget(MyApp());

    final btnSoma = find.text('+');
    final btnSubtracao = find.text('-');
    final btnMultiplicacao = find.text('*');
    final btnDivisao = find.text('/');
    final btnModulo = find.text('%');

    expect(btnSoma, findsOneWidget);
    expect(btnSubtracao, findsOneWidget);
    expect(btnMultiplicacao, findsOneWidget);
    expect(btnDivisao, findsOneWidget);
    expect(btnModulo, findsOneWidget);
  });

  testWidgets('Teste da operação soma', (tester) async {
    await tester.pumpWidget(MyApp());

    final digitoUm = find.text('1').first;
    final btnSoma = find.text('+');
    final digitoDois = find.text('2').last;
    final btnCalcular = find.byKey(ValueKey('btn-calcular'));

    await tester.tap(digitoUm);
    await tester.pumpAndSettle();
    await tester.tap(btnSoma);
    await tester.pumpAndSettle();
    await tester.tap(digitoDois);
    await tester.pumpAndSettle();
    await tester.tap(btnCalcular);
    await tester.pumpAndSettle();

    expect(find.text('Resultado: 3.00'), findsOneWidget);
  });

  testWidgets('Teste da operação sobtração', (tester) async {
    await tester.pumpWidget(MyApp());

    final digitoUm = find.text('1').last;
    final btnSubtracao = find.text('-');
    final digitoDois = find.text('2').first;
    final btnCalcular = find.byKey(ValueKey('btn-calcular'));

    await tester.tap(digitoUm);
    await tester.pumpAndSettle();
    await tester.tap(btnSubtracao);
    await tester.pumpAndSettle();
    await tester.tap(digitoDois);
    await tester.pumpAndSettle();
    await tester.tap(btnCalcular);
    await tester.pumpAndSettle();

    expect(find.text('Resultado: -1.00'), findsOneWidget);
  });

  testWidgets('Teste da operação multiplicacão', (tester) async {
    await tester.pumpWidget(MyApp());

    final digitoOito = find.text('8').first;
    final btnMultiplicacao = find.text('*');
    final digitoSete = find.text('7').first;
    final btnCalcular = find.byKey(ValueKey('btn-calcular'));

    await tester.tap(digitoOito);
    await tester.pumpAndSettle();
    await tester.tap(btnMultiplicacao);
    await tester.pumpAndSettle();
    await tester.tap(digitoSete);
    await tester.pumpAndSettle();
    await tester.tap(btnCalcular);
    await tester.pumpAndSettle();

    expect(find.text('Resultado: 56.00'), findsOneWidget);
  });

  testWidgets('Teste da operação divisão', (tester) async {
    await tester.pumpWidget(MyApp());

    final digitoOito = find.text('8').last;
    final digitoUm = find.text('1').last;
    final btnDivisao = find.text('/');
    final digitoNove = find.text('9').last;
    final btnCalcular = find.byKey(ValueKey('btn-calcular'));

    await tester.tap(digitoOito);
    await tester.pumpAndSettle();
    await tester.tap(digitoUm);
    await tester.pumpAndSettle();
    await tester.tap(btnDivisao);
    await tester.pumpAndSettle();
    await tester.tap(digitoNove);
    await tester.pumpAndSettle();
    await tester.tap(btnCalcular);
    await tester.pumpAndSettle();

    expect(find.text('Resultado: 9.00'), findsOneWidget);
  });

  testWidgets('Teste da operação módulo', (tester) async {
    await tester.pumpWidget(MyApp());

    final digitoQuatro = find.text('4').first;
    final digitoNove = find.text('9').first;
    final btnModulo = find.text('%');
    final digitoSete = find.text('7').last;
    final btnCalcular = find.byKey(ValueKey('btn-calcular'));

    await tester.tap(digitoQuatro);
    await tester.pumpAndSettle();
    await tester.tap(digitoNove);
    await tester.pumpAndSettle();
    await tester.tap(btnModulo);
    await tester.pumpAndSettle();
    await tester.tap(digitoSete);
    await tester.pumpAndSettle();
    await tester.tap(btnCalcular);
    await tester.pumpAndSettle();

    expect(find.text('Resultado: 0'), findsOneWidget);
  });

  testWidgets('Teste de zerar operação', (tester) async {
    await tester.pumpWidget(MyApp());

    final digitoUm = find.text('1').first;
    final btnMultiplicacao = find.text('*');
    final digitoDois = find.text('2').last;
    final btnCalcular = find.byKey(ValueKey('btn-calcular'));
    final btnZerar = find.byKey(ValueKey('btn-zerar'));

    await tester.tap(digitoUm);
    await tester.pumpAndSettle();
    await tester.tap(btnMultiplicacao);
    await tester.pumpAndSettle();
    await tester.tap(digitoDois);
    await tester.pumpAndSettle();
    await tester.tap(btnCalcular);
    await tester.pumpAndSettle();

    expect(find.text('Resultado: 2.00'), findsOneWidget);

    await tester.tap(btnZerar);
    await tester.pumpAndSettle();
    expect(find.text('Operação: '), findsOneWidget);
    expect(find.text('Resultado: '), findsOneWidget);
  });
}
