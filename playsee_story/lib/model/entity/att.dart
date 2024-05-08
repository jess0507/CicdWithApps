import 'dart:convert';

class Att {
  final String? id;
  final int? l;
  final String? pIds;
  final String? type;

  Att({
    this.id,
    this.l,
    this.pIds,
    this.type,
  });

  Att copyWith({
    String? id,
    int? l,
    String? pIds,
    String? type,
  }) =>
      Att(
        id: id ?? this.id,
        l: l ?? this.l,
        pIds: pIds ?? this.pIds,
        type: type ?? this.type,
      );

  factory Att.fromJson(String str) => Att.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Att.fromMap(Map<String, dynamic> json) => Att(
        id: json["id"],
        l: json["l"],
        pIds: json["p_ids"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "l": l,
        "p_ids": pIds,
        "type": type,
      };
}
