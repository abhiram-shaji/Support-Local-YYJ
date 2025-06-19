import 'package:flutter_test/flutter_test.dart';
import 'package:supportlocalyyj/app.dart';

void main() {
  testWidgets('App builds', (WidgetTester tester) async {
    await tester.pumpWidget(const SupportLocalApp());
    expect(find.text('Deals'), findsOneWidget);
  });
}
