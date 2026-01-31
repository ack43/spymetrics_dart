// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visits_split.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitsSplitResponse _$VisitsSplitResponseFromJson(Map<String, dynamic> json) =>
    VisitsSplitResponse(
      meta: SpymetricsResponseMeta.fromJson(
        json['meta'] as Map<String, dynamic>,
      ),
      desktopVisitShare: (json['desktop_visit_share'] as num?)?.toDouble(),
      mobileWebVisitShare: (json['mobile_web_visit_share'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VisitsSplitResponseToJson(
  VisitsSplitResponse instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'desktop_visit_share': instance.desktopVisitShare,
  'mobile_web_visit_share': instance.mobileWebVisitShare,
};
