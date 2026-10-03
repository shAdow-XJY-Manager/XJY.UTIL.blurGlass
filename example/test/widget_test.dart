import 'package:blur_glass/blur_glass.dart';
import 'package:blur_glass_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'glass demo adjusts blur through the slider and restores its default',
    (tester) async {
      tester.view.physicalSize = const Size(900, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      expect(find.text('局部玻璃 · 清晰内容'), findsOneWidget);
      expect(tester.widget<BlurGlass>(find.byType(BlurGlass)).filterX, 10);
      await tester.drag(find.byType(Slider), const Offset(180, 0));
      await tester.pumpAndSettle();
      final value = tester.widget<Slider>(find.byType(Slider)).value;
      expect(value, greaterThan(10));
      expect(tester.widget<BlurGlass>(find.byType(BlurGlass)).filterX, value);
      expect(tester.widget<BlurGlass>(find.byType(BlurGlass)).filterY, value);
      await tester.tap(find.text('重置为 10'));
      await tester.pumpAndSettle();
      expect(tester.widget<Slider>(find.byType(Slider)).value, 10);
      expect(tester.widget<BlurGlass>(find.byType(BlurGlass)).filterX, 10);
      expect(tester.takeException(), isNull);
    },
  );
}
