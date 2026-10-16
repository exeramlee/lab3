import 'package:flutter_test/flutter_test.dart';

import 'package:lab3/app.dart';

void main() {
  testWidgets('Login screen is shown on start', (tester) async {
    await tester.pumpWidget(const WarrantyApp());

    expect(find.text('Гарантія'), findsOneWidget);
    expect(find.text('Увійти'), findsOneWidget);
  });
}
