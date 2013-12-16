#Annotations

This library aims to provide some non-obstructive validation to Dart.

#Usage

Currently the library is not in a production ready state. *Help would be greatly appreciated.*

The only two annotations available right now are

`@require(message:"Value is required")` ensures the property is not `null` or `""` or an empty list or map.
`@range(min:10, max:20, message:"Value must be between 10 and 20")` ensures that the property's `.length` value or `num` value is between the specified range.

    import 'package:annotations/annotation.dart';

    class Person extends Object with Validatable {

      @required(message:"Please provide a name.")
      String name;

      @required()
      @range(min:13, max:99)
      int age;

      Person(this.name, this.age);

    }

You can use `require` and `range` annotations without using the `Validatable` mixin. However they will prove useless unless you implement your own way of checking for errors.

`Validatable` basically adds methods to a class that finds all properties that have an attribute that extends from the `Annotation` class and if so it will validate the the property is correct or not.




