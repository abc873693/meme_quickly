// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubtitleModel _$SubtitleModelFromJson(Map<String, dynamic> json) =>
    _SubtitleModel(
      episode: (json['episode'] as num).toInt(),
      startSeconds: (json['start_seconds'] as num).toDouble(),
      endSeconds: (json['end_seconds'] as num).toDouble(),
      startFrame: (json['start_frame'] as num).toInt(),
      endFrame: (json['end_frame'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$SubtitleModelToJson(_SubtitleModel instance) =>
    <String, dynamic>{
      'episode': instance.episode,
      'start_seconds': instance.startSeconds,
      'end_seconds': instance.endSeconds,
      'start_frame': instance.startFrame,
      'end_frame': instance.endFrame,
      'text': instance.text,
    };
