import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  final int id;
  final String name;
  final String adress;
  final int minimal_price;
  final String price_for_it;
  final int rating;
  final String rating_name;
  final List<String> image_urls;
  final Map<String, dynamic> about_the_hotel;

  const Place({
    required this.id,
    required this.adress,
    required this.name,
    required this.minimal_price,
    required this.price_for_it,
    required this.rating,
    required this.rating_name,
    required this.image_urls,
    required this.about_the_hotel,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
