/**
 * The annotations library provides a simple way to add
 * annotation to your properties and get validation results
 *
 * This package is meant to provide an unobtrusive validation mechanism.
 */
library annotations;

import 'dart:mirrors';

part 'validatable.dart';
part 'invalidproperty.dart';
part 'range.dart';
part 'required.dart';


/**
  * All attributes that you want to have validated must
  * extend this class to be caught by the [Validatable] class.
  */
abstract class Annotation {
  const Annotation();
  bool isValid(value);
}