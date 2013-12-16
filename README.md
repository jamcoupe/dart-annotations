#Annotations

This library aims to provide some non-obstructive validation to Dart properties.

**Note:** You are free to have invalid data in an object, this library does not give you warnings. You find out if there are errors when you call the objects `.isValid()` method only.

#Usage

Currently the library is not in a production ready state. *Help would be greatly appreciated.*

The only two annotations available right now are

`@required(message:"Value is required")` ensures the property is not `null` or `""` or an empty list or map.

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

You can use `required` and `range` annotations without using the `Validatable` mixin. However they will prove useless unless you implement your own way of checking for errors using the provided annotations.

`Validatable` basically adds methods to a class that allows it to check if the defined `Annotations` are valid.

