part of attribtues;

class InvalidProperty {
  final String property;
  final String message;
  final Symbol symbol;

  InvalidProperty(this.property, this.message, [this.symbol]);
}
