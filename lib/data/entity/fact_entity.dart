import 'package:cat_trivia/domain/models/fact.dart';
import 'package:json_annotation/json_annotation.dart';

// flutter packages pub run build_runner build
part 'fact_entity.g.dart';

@JsonSerializable()
class FactEntity implements Fact {
  const FactEntity({
    required this.text,
    required this.updatedAt,
  });

  //flutter pub run build_runner build
  factory FactEntity.fromJson(Map<String, dynamic> json) =>
      _$FactEntityFromJson(json);

  @override
  @JsonKey(name: 'text')
  final String text;

  @override
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
}
