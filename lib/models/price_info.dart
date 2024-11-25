import 'dart:convert';

PriceModel priceModelFromJson(String str) =>
    PriceModel.fromJson(json.decode(str));

String priceModelToJson(PriceModel data) => json.encode(data.toJson());

class PriceModel {
  PriceModel({
    this.id,
    this.brandName,
    this.productName,
    this.pack,
    this.mrp,
    this.ptr,
    this.pts,
    this.createdAt,
    this.updatedAt,
    // this.pivot,
  });

  int? id;
  String? brandName;
  String? productName;
  String? pack;
  String? mrp;
  String? ptr;
  String? pts;
  DateTime? createdAt;
  DateTime? updatedAt;
  // Pivot? pivot;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        id: json["id"],
        brandName: json["brand_name"],
        productName: json["product_name"],
        pack: json["pack"],
        mrp: json["mrp"],
        ptr: json["ptr"],
        pts: json["pts"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_name": brandName,
        "product_name": productName,
        "pack": pack,
        "mrp": mrp,
        "ptr": ptr,
        "pts": pts,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        // "pivot": pivot!.toJson(),
      };
}

// class Pivot {
//   Pivot({
//     this.teamId,
//     this.priceId,
//   });

//   String? teamId;
//   String? priceId;

//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         teamId: json["team_id"],
//         priceId: json["price_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "team_id": teamId,
//         "price_id": priceId,
//       };
// }
