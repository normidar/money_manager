// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:money_manager/main.dart';
import 'package:money_manager/money_engine/data_type/jouranl/journal_type.dart';
import 'package:money_manager/money_engine/data_type/period.dart';
import 'package:money_manager/money_engine/database_engine/file/file_database.dart';
import 'package:money_manager/money_engine/type_def.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test('dec test', () async {
    print(0.1 + 0.2);
    print(Dec.zero + Dec.parse('0.2'));
    print(Date(2022) == Date(2022));
    print(JournalType('a') == JournalType('a'));
  });

  test('dec test2', () async {
    print(await FileDatabase('/a').getFullPath());
  });

  test('test Period', () async {
    // 同方向无限Period
    Period unlimitedPerion = UnlimitedPeriod(from: Date(2022), isAfter: true);
    Period unlimitedPerion2 = UnlimitedPeriod(from: Date(2023), isAfter: true);
    Period? unlimitedPerion3 =
        unlimitedPerion.getIntersection(unlimitedPerion2);
    assert(unlimitedPerion3 != null);
    assert(unlimitedPerion3?.from.year == 2023);
    assert(unlimitedPerion3!.isAfter);

    Period unlimitedPerion4 = UnlimitedPeriod(from: Date(2022), isAfter: false);
    Period unlimitedPerion5 = UnlimitedPeriod(from: Date(2021), isAfter: false);
    Period? unlimitedPerion6 =
        unlimitedPerion4.getIntersection(unlimitedPerion5);
    assert(unlimitedPerion6 != null);
    assert(unlimitedPerion6?.from.year == 2021);
    assert(!unlimitedPerion6!.isAfter);

    // 包含的BetweenPeriod
    Period periodBig = BetweenPeriod(from: Date(2005), to: Date(2025));
    Period periodSmall = BetweenPeriod(from: Date(2010), to: Date(2020));
    Period? periodResult = periodBig.getIntersection(periodSmall);
    assert(periodResult != null);
    assert(periodResult is BetweenPeriod);
    assert(periodResult!.from.year == 2010);
    assert(periodResult is BetweenPeriod && periodResult.to.year == 2020);

    Period periodBig2 = BetweenPeriod(to: Date(2005), from: Date(2025));
    Period periodSmall2 = BetweenPeriod(to: Date(2010), from: Date(2020));
    Period? periodResult2 = periodBig2.getIntersection(periodSmall2);
    assert(periodResult2 != null);
    assert(periodResult2 is BetweenPeriod);
    assert(periodResult2!.from.year == 2020);
    assert(periodResult2 is BetweenPeriod && periodResult2.to.year == 2010);

    // 日期交叉
    Period periodBig3 = BetweenPeriod(to: Date(2005), from: Date(2020));
    Period periodSmall3 = BetweenPeriod(to: Date(2010), from: Date(2025));
    Period? periodResult3 = periodBig3.getIntersection(periodSmall3);
    assert(periodResult3 != null);
    assert(periodResult3 is BetweenPeriod);
    assert(periodResult3!.from.year == 2020);
    assert(periodResult3 is BetweenPeriod && periodResult3.to.year == 2010);

    // 不交即空
    Period periodBig4 = BetweenPeriod(from: Date(2005), to: Date(2010));
    Period periodSmall4 = BetweenPeriod(from: Date(2020), to: Date(2025));
    Period? periodResult4 = periodBig4.getIntersection(periodSmall4);
    assert(periodResult4 == null);

    // 反向报错
    Period periodBig5 = BetweenPeriod(from: Date(2015), to: Date(2010));
    Period periodSmall5 = BetweenPeriod(from: Date(2020), to: Date(2025));
    try {
      Period? periodResult5 = periodBig5.getIntersection(periodSmall5);
      assert(false);
    } catch (_) {
      assert(true);
    }
  });
}
