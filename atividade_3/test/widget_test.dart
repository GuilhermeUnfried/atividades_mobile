import 'package:flutter_test/flutter_test.dart';
import 'package:atividade_3/main.dart';
import 'package:atividade_3/widgets/display.dart';

void main() {
  testWidgets('Calculadora renderiza elementos principais', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Calculadora'), findsOneWidget);
    expect(find.byType(DisplayWidget), findsOneWidget);
    expect(find.text('='), findsOneWidget);
  });
}
