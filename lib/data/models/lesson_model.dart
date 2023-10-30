class Lesson {
  String? id;
  String? name;
  String? unitIcon;
  int? sumUserStudy;
  int? hamdarsUserUnitLevelIndex;
  int? hamdarsUserCurrentUnitLevelPoint;
  int? hamdarsUserMaxUnitLevelPoint;
  int? hamdarsUserMinUnitLevelPoint;

  Lesson({
    this.id,
    this.name,
    this.unitIcon,
    this.sumUserStudy,
    this.hamdarsUserUnitLevelIndex,
    this.hamdarsUserCurrentUnitLevelPoint,
    this.hamdarsUserMaxUnitLevelPoint,
    this.hamdarsUserMinUnitLevelPoint,
  });

  Lesson.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["unit_icon"] is String) {
      unitIcon = json["unit_icon"];
    }
    if (json["sum_user_study"] is int) {
      sumUserStudy = json["sum_user_study"];
    }
    if (json["hamdarsUserUnitLevelIndex"] is int) {
      hamdarsUserUnitLevelIndex = json["hamdarsUserUnitLevelIndex"];
    }
    if (json["hamdarsUserCurrentUnitLevelPoint"] is int) {
      hamdarsUserCurrentUnitLevelPoint =
          json["hamdarsUserCurrentUnitLevelPoint"];
    }
    if (json["hamdarsUserMaxUnitLevelPoint"] is int) {
      hamdarsUserMaxUnitLevelPoint = json["hamdarsUserMaxUnitLevelPoint"];
    }
    if (json["hamdarsUserMinUnitLevelPoint"] is int) {
      hamdarsUserMinUnitLevelPoint = json["hamdarsUserMinUnitLevelPoint"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["unit_icon"] = unitIcon;
    data["sum_user_study"] = sumUserStudy;
    data["hamdarsUserUnitLevelIndex"] = hamdarsUserUnitLevelIndex;
    data["hamdarsUserCurrentUnitLevelPoint"] =
        hamdarsUserCurrentUnitLevelPoint;
    data["hamdarsUserMaxUnitLevelPoint"] = hamdarsUserMaxUnitLevelPoint;
    data["hamdarsUserMinUnitLevelPoint"] = hamdarsUserMinUnitLevelPoint;
    return data;
  }
}
