// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactEntity _$FactEntityFromJson(Map<String, dynamic> json) => FactEntity(
      text: json['text'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$FactEntityToJson(FactEntity instance) =>
    <String, dynamic>{
      'text': instance.text,
      'updatedAt': instance.updatedAt,
    };
