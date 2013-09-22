library console_test_harness;

import 'dart:math' as Math;
import 'package:unittest/unittest.dart';
import 'package:unittest/vm_config.dart';
import 'package:vector_math/vector_math.dart';
import 'package:vector_math/vector_math_lists.dart';
import 'package:vector_math/vector_math_geometry.dart';
import 'vector_math_test.dart';

void testCore(Configuration config) {
  unittestConfiguration = config;
  groupSep = ' - ';

  main();
}

void main() {
  group('Quaternion', () {
    QuaternionTest qt = new QuaternionTest();
    qt.run();
  });

  group('Matrix', () {
    MatrixTest mt = new MatrixTest();
    mt.run();
  });

  group('Vector', () {
    VectorTest vt = new VectorTest();
    vt.run();
  });

  group('OpenGL', () {
    OpenGLMatrixTest omt = new OpenGLMatrixTest();
    omt.run();
  });

  group('AABB', () {
    AabbTest at = new AabbTest();
    at.run();
  });

  group('Utility', () {
    test('degrees', () {
      relativeTest(degrees(Math.PI), 180.0);
    });
    test('radians', () {
      relativeTest(radians(90.0), Math.PI/2.0);
    });
  });

  group('Geometry', () {
    GeometryTest gt = new GeometryTest();
    gt.run();
  });

  group('Sphere', () {
    SphereTest st = new SphereTest();
    st.run();
  });

  group('Ray', () {
    RayTest rt = new RayTest();
    rt.run();
  });

  group('Triangle', () {
    TriangleTest tt = new TriangleTest();
    tt.run();
  });

  group('Plane', () {
    PlaneTest pt = new PlaneTest();
    pt.run();
  });

  group('Frustum', () {
    FrustumTest ft = new FrustumTest();
    ft.run();
  });
}

