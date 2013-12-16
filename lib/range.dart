part of annotations;

/**
 * For usage on [String], [List], [Map], [num] properties.
 * This will allow for an error to be sent back if the value is out with the range.
 *
 *     class ExampleClass extends Object with Validatable {
 *         @range(min:5, max:16)
 *         String exampleProperty;
 *     }
 *
 * If the ExampleClass's exampleProperty has between 5 and 16 characters the instance will be valid when [isValid()]
 * is called.
*/
class range extends Annotation {

  /// The maximum range.
  final num max;

  /// The minimum range.
  final num min;

  /// The message to be shown the property is out of the range.
  final String message;

  /**
   * Creates an new [range] instance. [max] and [min] are optional.
   * Giving a [min] value larger than [max] will only throw an [ArgumentError]
   * when you are checking if the value is valid. Not during instantiation.
   */
  const range({this.max: null, this.min: null, this.message: "Value is out of range"});

  /**
   * This takes a value and verifies that it is within the range provided
   * during instantiation.
   */
  bool isValid(value) {

    // return true because required will deal with null values
    if(value == null) return true;

    if(value is bool) {
      throw new ArgumentError("You shouldn't be trying to place a range on a [bool]");
    }


    num numberVal;

    if(value is num) numberVal = value;

    if(value is String || value is List || value is Map) numberVal = value.length;

    if(this.min != null && this.max != null) {
      if(this.min >= this.max) {
        throw new ArgumentError("Malformed Range.. min [${this.min}] must be less than max [${this.max}");
      }
      if(numberVal < this.min || numberVal > this.max) return false;
    }

    if(this.min != null) {
      if(numberVal < this.min) return false;
    }

    if(this.max != null) {
      if(numberVal > this.max) return false;
    }

    return true;
  }
}
