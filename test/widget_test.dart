import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_builder_assert/information.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('FilesetInformation', () {
    setUpAll(() async {
      await loadAppFonts();
    });

    testGoldens('works - but last scenario is clipped vertically',
        (tester) async {
      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1,
      )..addScenario(
          'with one item',
          const Information(version: '1.0.0'),
        );
      builder.addScenario(
        'with two items',
        const Information(version: '1.0.0', size: '42 Mb'),
      );
      builder.addScenario(
        'with three items',
        const Information(version: '1.0.0', size: '42 Mb', date: 'Jul 3 2023'),
      );

      await tester.pumpWidgetBuilder(
        Center(
          child: builder.build(),
        ),
      );
      await screenMatchesGolden(tester, 'grid.works');
    });
  });

  testGoldens('asserts in Flutter', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
      wrap: (widget) => MaterialApp(home: widget),
    )..addScenario(
        'with one item',
        const Information(version: '1.0.0'),
      );
    builder.addScenario(
      'with two items',
      const Information(version: '1.0.0', size: '42 Mb'),
    );
    builder.addScenario(
      'with three items',
      const Information(version: '1.0.0', size: '42 Mb', date: 'Jul 3 2023'),
    );

    await tester.pumpWidgetBuilder(
      Center(
        child: builder.build(),
      ),
    );
    await screenMatchesGolden(tester, 'grid.asserts');
  });
}
