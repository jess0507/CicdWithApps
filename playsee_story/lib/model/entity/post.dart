import 'dart:convert';

import 'att.dart';

class Post {
  final int? at;
  final Att? att;
  final List<int>? count;
  final String? desc;
  final String? id;
  final bool? isFavorite;
  final String? isPrv;
  final List<List<dynamic>>? pStk;
  final List<String>? plc;
  final List<dynamic>? private;
  final List<List<dynamic>>? reply;
  final List<dynamic>? source;

  Post({
    this.at,
    this.att,
    this.count,
    this.desc,
    this.id,
    this.isFavorite,
    this.isPrv,
    this.pStk,
    this.plc,
    this.private,
    this.reply,
    this.source,
  });

  Post copyWith({
    int? at,
    Att? att,
    List<int>? count,
    String? desc,
    String? id,
    bool? isFavorite,
    String? isPrv,
    List<List<dynamic>>? pStk,
    List<String>? plc,
    List<dynamic>? private,
    List<List<dynamic>>? reply,
    List<dynamic>? source,
  }) =>
      Post(
        at: at ?? this.at,
        att: att ?? this.att,
        count: count ?? this.count,
        desc: desc ?? this.desc,
        id: id ?? this.id,
        isFavorite: isFavorite ?? this.isFavorite,
        isPrv: isPrv ?? this.isPrv,
        pStk: pStk ?? this.pStk,
        plc: plc ?? this.plc,
        private: private ?? this.private,
        reply: reply ?? this.reply,
        source: source ?? this.source,
      );

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        at: json["at"],
        att: json["att"] == null ? null : Att.fromMap(json["att"]),
        count: json["count"] == null
            ? []
            : List<int>.from(json["count"]!.map((x) => x)),
        desc: json["desc"],
        id: json["id"],
        isFavorite: json["is_favorite"],
        isPrv: json["is_prv"],
        pStk: json["p_stk"] == null
            ? []
            : List<List<dynamic>>.from(
                json["p_stk"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        plc: json["plc"] == null
            ? []
            : List<String>.from(json["plc"]!.map((x) => x)),
        private: json["private"] == null
            ? []
            : List<dynamic>.from(json["private"]!.map((x) => x)),
        reply: json["reply"] == null
            ? []
            : List<List<dynamic>>.from(
                json["reply"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        source: json["source"] == null
            ? []
            : List<dynamic>.from(json["source"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "at": at,
        "att": att?.toMap(),
        "count": count == null ? [] : List<dynamic>.from(count!.map((x) => x)),
        "desc": desc,
        "id": id,
        "is_favorite": isFavorite,
        "is_prv": isPrv,
        "p_stk": pStk == null
            ? []
            : List<dynamic>.from(
                pStk!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "plc": plc == null ? [] : List<dynamic>.from(plc!.map((x) => x)),
        "private":
            private == null ? [] : List<dynamic>.from(private!.map((x) => x)),
        "reply": reply == null
            ? []
            : List<dynamic>.from(
                reply!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "source":
            source == null ? [] : List<dynamic>.from(source!.map((x) => x)),
      };

  String get userId {
    if (source != null && source!.length >= 3) {
      var userArray = source![2] as List<dynamic>;
      if (userArray.isNotEmpty) {
        return userArray[0].toString();
      }
    }
    return ''; // 返回空字符串表示無法獲取userid
  }

  String get userName {
    if (source != null && source!.length >= 3) {
      var userArray = source![2] as List<dynamic>;
      if (userArray.length > 3) {
        return userArray[2].toString();
      }
    }
    return ''; // 返回空字符串表示無法獲取userid
  }
}
