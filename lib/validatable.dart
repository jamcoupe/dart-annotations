part of annotations;

abstract class Validatable {

  InstanceMirror _reflection;

  get invalidProperties => getValidationErrors();

  static bool Validate(Validatable d) {
    return d.isValid();
  }

  bool isValid() {
    this._reflection = reflect(this);
    return _validateProperties();
  }

  List<InvalidProperty> getValidationErrors() {
    List<InvalidProperty> invalidProps = [];
    this._reflection = reflect(this);
    for(var property in __getAnnotatedProperties()) {
      var value = _reflection.getField(property.simpleName);
      String name = MirrorSystem.getName(property.simpleName);
      for(var prop in property.metadata) {
        Annotation annotation = prop.reflectee;
        if(!annotation.isValid(value.reflectee)) {
            invalidProps.add(new InvalidProperty(name, annotation.message, property.simpleName));
        }
      }
    }
    return invalidProps;
  }



  /// Loops over each annotations annotation and checks if its valid.
  /// If there is more than one validation and one fails the rest is
  /// not checked it will just return false
  bool __isPropertyValid(VariableMirror property) {
    var value = _reflection.getField(property.simpleName);
    for(var validator in property.metadata) {
      Annotation d = validator.reflectee;
      if(!d.isValid(value.reflectee)) return false;
    }
    return true;
  }

  /// Validates the properties, when one is invalid it returns false without checking the rest.
  bool _validateProperties() {
    for(VariableMirror annotation in __getAnnotatedProperties()) {
      if(!__isPropertyValid(annotation)) return false;
    }
    return true;
  }

  /// Returns all the properties that have an [Annotation] meta tag
  List<VariableMirror> __getAnnotatedProperties() {
    List<VariableMirror> attributes = [];
    for(VariableMirror property in __getProperyDeclarations()) {
      for(InstanceMirror d in property.metadata) {
        if(d.reflectee is Annotation){
          attributes.add(property);
          break; //this is so we dont add an attribute that has two annotations twice
        }
      }
    }
    return attributes;
  }

  /// Returns all the properties of the [Validatable] object.
  List<VariableMirror> __getProperyDeclarations() {
    List<VariableMirror> properties = [];
    for(DeclarationMirror declaration in __getDeclarations()) {
      if(declaration is VariableMirror) {
        properties.add(declaration);
      }
    }
    return properties;
  }

  /// Returns all the methods and properties of the [Validatable] object.
  List<DeclarationMirror> __getDeclarations() {
    ClassMirror myClass = _reflection.type;
    return myClass.declarations.values;
  }

}

