/*
  Copyright (C) 2013 John McCutchan <john@johnmccutchan.com>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

part of vector_math;

/// Convert [radians] to degrees.
double degrees(double radians) {
  return radians * RADIANS_2_DEGREES;
}

/// Convert [degrees] to radians.
double radians(double degrees) {
  return degrees * DEGREES_2_RADIANS;
}

/// Interpolate between [min] and [max] with the amount of [a] using a linear
/// interpolation. The computation is equivalent to the GLSL function mix.
double mix(double min, double max, double a) {
  return min + a * (max - min);
}

/// Do a smooth step (hermite interpolation) interpolation with [edge0] and
/// [edge1] by [amount]. The computation is equivalent to the GLSL function
/// smoothstep.
double smoothStep(double edge0, double edge1, double amount) {
  final t = ((amount - edge0) / (edge1 - edge0)).clamp(0.0, 1.0);

  return t * t * (3.0 - 2.0 * t);
}

/// Do a catmull rom spline interpolation with [edge0], [edge1], [edge2] and
/// [edge3] by [amount].
double catmullRom(double edge0, double edge1, double edge2, double edge3,
    double amount) {
  return 0.5 *
      ((2.0 * edge1) + (-edge0 + edge2) * amount +
       (2.0 * edge0 - 5.0 * edge1 + 4.0 * edge2 - edge3) *
       (amount * amount) + (-edge0 + 3.0 * edge1 - 3.0 * edge2 + edge3) *
       (amount * amount * amount));
}
