// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) {
  return Story(
    json['text'] as String,
    json['title'] as String,
    json['_id'] as int,
    userFromJson(json['_user']),
    DateUtils.convertDateAndIsoString(json['createdAt']),
  )
    ..location = locationFromJson(json['location'])
    ..updateAt = DateUtils.convertDateAndIsoString(json['updateAt'])
    ..published = isPublishedFromJson(json['published'])
    ..reports = (json['reports'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'text': instance.text,
      '_user': instance.user,
      'location': instance.location,
      'createdAt': DateUtils.convertDateAndIsoString(instance.createdAt),
      'updateAt': DateUtils.convertDateAndIsoString(instance.updateAt),
      'published': instance.published,
      'reports': instance.reports,
    };
