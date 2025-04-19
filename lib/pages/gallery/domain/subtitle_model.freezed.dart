// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubtitleModel {

 int get episode;@JsonKey(name: 'start_seconds') double get startSeconds;@JsonKey(name: 'end_seconds') double get endSeconds;@JsonKey(name: 'start_frame') int get startFrame;@JsonKey(name: 'end_frame') int get endFrame; String get text;
/// Create a copy of SubtitleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtitleModelCopyWith<SubtitleModel> get copyWith => _$SubtitleModelCopyWithImpl<SubtitleModel>(this as SubtitleModel, _$identity);

  /// Serializes this SubtitleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtitleModel&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.startSeconds, startSeconds) || other.startSeconds == startSeconds)&&(identical(other.endSeconds, endSeconds) || other.endSeconds == endSeconds)&&(identical(other.startFrame, startFrame) || other.startFrame == startFrame)&&(identical(other.endFrame, endFrame) || other.endFrame == endFrame)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episode,startSeconds,endSeconds,startFrame,endFrame,text);

@override
String toString() {
  return 'SubtitleModel(episode: $episode, startSeconds: $startSeconds, endSeconds: $endSeconds, startFrame: $startFrame, endFrame: $endFrame, text: $text)';
}


}

/// @nodoc
abstract mixin class $SubtitleModelCopyWith<$Res>  {
  factory $SubtitleModelCopyWith(SubtitleModel value, $Res Function(SubtitleModel) _then) = _$SubtitleModelCopyWithImpl;
@useResult
$Res call({
 int episode,@JsonKey(name: 'start_seconds') double startSeconds,@JsonKey(name: 'end_seconds') double endSeconds,@JsonKey(name: 'start_frame') int startFrame,@JsonKey(name: 'end_frame') int endFrame, String text
});




}
/// @nodoc
class _$SubtitleModelCopyWithImpl<$Res>
    implements $SubtitleModelCopyWith<$Res> {
  _$SubtitleModelCopyWithImpl(this._self, this._then);

  final SubtitleModel _self;
  final $Res Function(SubtitleModel) _then;

/// Create a copy of SubtitleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episode = null,Object? startSeconds = null,Object? endSeconds = null,Object? startFrame = null,Object? endFrame = null,Object? text = null,}) {
  return _then(_self.copyWith(
episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as int,startSeconds: null == startSeconds ? _self.startSeconds : startSeconds // ignore: cast_nullable_to_non_nullable
as double,endSeconds: null == endSeconds ? _self.endSeconds : endSeconds // ignore: cast_nullable_to_non_nullable
as double,startFrame: null == startFrame ? _self.startFrame : startFrame // ignore: cast_nullable_to_non_nullable
as int,endFrame: null == endFrame ? _self.endFrame : endFrame // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SubtitleModel implements SubtitleModel {
  const _SubtitleModel({required this.episode, @JsonKey(name: 'start_seconds') required this.startSeconds, @JsonKey(name: 'end_seconds') required this.endSeconds, @JsonKey(name: 'start_frame') required this.startFrame, @JsonKey(name: 'end_frame') required this.endFrame, required this.text});
  factory _SubtitleModel.fromJson(Map<String, dynamic> json) => _$SubtitleModelFromJson(json);

@override final  int episode;
@override@JsonKey(name: 'start_seconds') final  double startSeconds;
@override@JsonKey(name: 'end_seconds') final  double endSeconds;
@override@JsonKey(name: 'start_frame') final  int startFrame;
@override@JsonKey(name: 'end_frame') final  int endFrame;
@override final  String text;

/// Create a copy of SubtitleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtitleModelCopyWith<_SubtitleModel> get copyWith => __$SubtitleModelCopyWithImpl<_SubtitleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtitleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtitleModel&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.startSeconds, startSeconds) || other.startSeconds == startSeconds)&&(identical(other.endSeconds, endSeconds) || other.endSeconds == endSeconds)&&(identical(other.startFrame, startFrame) || other.startFrame == startFrame)&&(identical(other.endFrame, endFrame) || other.endFrame == endFrame)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episode,startSeconds,endSeconds,startFrame,endFrame,text);

@override
String toString() {
  return 'SubtitleModel(episode: $episode, startSeconds: $startSeconds, endSeconds: $endSeconds, startFrame: $startFrame, endFrame: $endFrame, text: $text)';
}


}

/// @nodoc
abstract mixin class _$SubtitleModelCopyWith<$Res> implements $SubtitleModelCopyWith<$Res> {
  factory _$SubtitleModelCopyWith(_SubtitleModel value, $Res Function(_SubtitleModel) _then) = __$SubtitleModelCopyWithImpl;
@override @useResult
$Res call({
 int episode,@JsonKey(name: 'start_seconds') double startSeconds,@JsonKey(name: 'end_seconds') double endSeconds,@JsonKey(name: 'start_frame') int startFrame,@JsonKey(name: 'end_frame') int endFrame, String text
});




}
/// @nodoc
class __$SubtitleModelCopyWithImpl<$Res>
    implements _$SubtitleModelCopyWith<$Res> {
  __$SubtitleModelCopyWithImpl(this._self, this._then);

  final _SubtitleModel _self;
  final $Res Function(_SubtitleModel) _then;

/// Create a copy of SubtitleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episode = null,Object? startSeconds = null,Object? endSeconds = null,Object? startFrame = null,Object? endFrame = null,Object? text = null,}) {
  return _then(_SubtitleModel(
episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as int,startSeconds: null == startSeconds ? _self.startSeconds : startSeconds // ignore: cast_nullable_to_non_nullable
as double,endSeconds: null == endSeconds ? _self.endSeconds : endSeconds // ignore: cast_nullable_to_non_nullable
as double,startFrame: null == startFrame ? _self.startFrame : startFrame // ignore: cast_nullable_to_non_nullable
as int,endFrame: null == endFrame ? _self.endFrame : endFrame // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
