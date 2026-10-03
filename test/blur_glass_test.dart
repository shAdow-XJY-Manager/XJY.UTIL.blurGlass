import 'package:blur_glass/blur_glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('glass keeps its content visible inside the blur', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BlurGlass(child: Text('Readable content')),
    ));
    expect(find.text('Readable content'), findsOneWidget);
    expect(find.ancestor(of: find.text('Readable content'), matching: find.byType(BackdropFilter)), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
