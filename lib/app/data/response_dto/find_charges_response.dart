// To parse this JSON data, do
//
//     final findChargesResponceDto = findChargesResponceDtoFromJson(jsonString);

import 'dart:convert';

List<FindChargesResponceDto> findChargesResponceDtoFromJson(String str) =>
    List<FindChargesResponceDto>.from(
        json.decode(str).map((x) => FindChargesResponceDto.fromJson(x)));

String findChargesResponceDtoToJson(List<FindChargesResponceDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FindChargesResponceDto {
  String? logoUrl;
  String? brandName;
  String? friendlyName;
  double? distance;

  FindChargesResponceDto({
    this.logoUrl,
    this.brandName,
    this.friendlyName,
    this.distance,
  });

  factory FindChargesResponceDto.fromJson(Map<String, dynamic> json) =>
      FindChargesResponceDto(
        logoUrl: json["logo_url"] != null ? json['logo_url'] : null,
        brandName: json["brand_name"] != null ? json['brand_name'] : null,
        friendlyName:
            json["friendly_name"] != null ? json['friendly_namel'] : null,
        distance:
            json["distance"]?.toDouble() != null ? json['distance'] : null,
      );

  Map<String, dynamic> toJson() => {
        "logo_url": logoUrl,
        "brand_name": brandName,
        "friendly_name": friendlyName,
        "distance": distance,
      };
}
