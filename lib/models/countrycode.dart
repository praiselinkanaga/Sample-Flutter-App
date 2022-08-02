// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

//import 'dart:convert';

// List<Country> countryFromJson(String str) =>
//     List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

// String countryToJson(List<Country> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Country {
//   Country({
//     this.name,
//     this.dialCode,
//     this.isoCode,
//     this.flag,
//   });

//   String? name;
//   String? dialCode;
//   String? isoCode;
//   String? flag;

//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//         name: json["name"],
//         dialCode: json["dialCode"],
//         isoCode: json["isoCode"],
//         flag: json["flag"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "dialCode": dialCode,
//         "isoCode": isoCode,
//         "flag": flag,
//       };
// }
class CountryCode {
  late String name;
  late String code;
  late String dialCode;
  late String flagImage;

  CountryCode({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flagImage,
  });
}
