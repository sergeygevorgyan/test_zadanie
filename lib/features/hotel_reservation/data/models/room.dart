import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  final int id;
  final String name;
  final int price;
  final String price_per;
  final List<String> peculiarities;
  final List<String> image_urls;

  const Room({
    required this.id,
    required this.name,
    required this.peculiarities,
    required this.price,
    required this.price_per,
    required this.image_urls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
