part of vector_math_test;

class UtilitiesTest extends BaseTest {

  void testDegrees() {
    expect(degrees(Math.PI), relativeEquals(180.0));
  }

  void testRadians() {
    expect(radians(90.0), relativeEquals(Math.PI / 2.0));
  }

  void testMix() {
    expect(mix(2.5, 3.0, 1.0), relativeEquals(3.0));
    expect(mix(1.0, 3.0, 0.5), relativeEquals(2.0));
    expect(mix(2.5, 3.0, 0.0), relativeEquals(2.5));
    expect(mix(-1.0, 0.0, 2.0), relativeEquals(1.0));
  }

  void run() {
    test('degrees', testDegrees);
    test('radians', testRadians);
    test('mix', testMix);
  }
}
