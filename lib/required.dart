part of annotations;

/**
* Provides checking that this attribute is not null.
*/
class required extends Annotation {

  /// The message to be displayed if the property is null or empty.
  /// Defaults to "This value is required."
  final String message;


  /// Creates a new [required] annotation object that can take the optional [message] [String] value
  const required({this.message:"This value is required."});

  /// If the [value] is a [null] value returns false
  ///
  /// If the [value] is a [String], [List], [Map] value it checks that the length of the value does not equal 0
  bool isValid(value) {
    if(value == null) {
      return false;

    } else if(value is String || value is List || value is Map) {

      if(value.length == 0) return false;
    }

    return true;
  }
}


