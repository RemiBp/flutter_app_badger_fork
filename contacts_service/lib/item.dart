/// Represents a labeled generic item. Used for emails, phone numbers, etc.
class Item {
  String? label;
  String? value;

  Item({this.label, this.value});

  Item.fromMap(Map<dynamic, dynamic> map) {
    label = map["label"];
    value = map["value"];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'value': value,
    };
  }

  @override
  String toString() => 'Item(label: $label, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.label == label && other.value == value;
  }

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
} 