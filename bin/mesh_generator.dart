// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library vector_math.mesh_generator;

import 'dart:convert';
import 'package:vector_math/vector_math_geometry.dart';

typedef GenerateFunction = MeshGeometry Function(List<String> args);

MeshGeometry generateCube(List<String> args) {
  if (args.length != 3) {
    return null;
  }
  final double width = double.parse(args[0]);
  final double height = double.parse(args[1]);
  final double depth = double.parse(args[2]);
  final CubeGenerator generator = CubeGenerator();
  return generator.createCube(width, height, depth);
}

MeshGeometry generateSphere(List<String> args) {
  if (args.length != 1) {
    return null;
  }
  final double radius = double.parse(args[0]);
  final SphereGenerator generator = SphereGenerator();
  return generator.createSphere(radius);
}

MeshGeometry generateCircle(List<String> args) {
  if (args.length != 1) {
    return null;
  }
  final double radius = double.parse(args[0]);
  final CircleGenerator generator = CircleGenerator();
  return generator.createCircle(radius);
}

MeshGeometry generateCylinder(List<String> args) {
  if (args.length != 3) {
    return null;
  }
  final double topRadius = double.parse(args[0]);
  final double bottomRadius = double.parse(args[1]);
  final double height = double.parse(args[2]);
  final CylinderGenerator generator = CylinderGenerator();
  return generator.createCylinder(topRadius, bottomRadius, height);
}

MeshGeometry generateRing(List<String> args) {
  if (args.length != 2) {
    return null;
  }
  final double innerRadius = double.parse(args[0]);
  final double outerRadius = double.parse(args[1]);
  final RingGenerator generator = RingGenerator();
  return generator.createRing(innerRadius, outerRadius);
}

Map<String, GenerateFunction> generators = <String, GenerateFunction>{
  'cube': generateCube,
  'sphere': generateSphere,
  'circle': generateCircle,
  'cylinder': generateCylinder,
  'ring': generateRing
};

void main(List<String> args) {
  final List<String> fixedArgs = List<String>.unmodifiable(args);

  if (fixedArgs.isEmpty) {
    print('mesh_generator.dart <type> [<arg0> ... <argN>]');
    print('');
    print('<type> = cube, sphere, cylinder');
    print('mesh_generator.dart cube width height depth');
    print('mesh_generator.dart sphere radius');
    print('mesh_generator.dart circle radius');
    print('mesh_generator.dart cylinder topRadius bottomRadius height');
    print('mesh_generator.dart ring innerRadius outerRadius');
    print('');
    return;
  }
  final String type = fixedArgs.removeAt(0);
  final GenerateFunction generator = generators[type];
  if (generator == null) {
    print('Could not find generator for $type');
    return;
  }
  final MeshGeometry geometry = generator(fixedArgs);
  if (geometry == null) {
    print('Error generating geometry for $type');
    return;
  }
  print(jsonEncode(geometry));
}
