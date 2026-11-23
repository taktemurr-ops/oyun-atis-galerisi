import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_atis_galerisi/oyun_atis_galerisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(galeriConfig.title.length, 33);
    expect(galeriConfig.tagline.length, 33);
    for (final s in galeriConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(galeriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: galeriId, optionalMechanics: galeriRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(galeriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
