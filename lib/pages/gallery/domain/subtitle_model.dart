import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtitle_model.freezed.dart';
part 'subtitle_model.g.dart';

@freezed
abstract class SubtitleModel with _$SubtitleModel {
  const factory SubtitleModel({
    required int episode,
    @JsonKey(name: 'start_seconds') required double startSeconds,
    @JsonKey(name: 'end_seconds') required double endSeconds,
    @JsonKey(name: 'start_frame') required int startFrame,
    @JsonKey(name: 'end_frame') required int endFrame,
    required String text,
  }) = _SubtitleModel;

  factory SubtitleModel.fromJson(Map<String, dynamic> json) =>
      _$SubtitleModelFromJson(json);
}
