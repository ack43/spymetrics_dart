import 'package:json_annotation/json_annotation.dart';

import '../client/response.dart';

part 'visits_split.g.dart';

// @JsonSerializable(fieldRename: FieldRename.snake)
class VisitsSplitEntity {
  VisitsSplitEntity({
    required this.desktopVisitShare,
    required this.mobileWebVisitShare,
  });
  final double? desktopVisitShare;
  final double? mobileWebVisitShare;

  // factory VisitsSplitEntity.fromJson(Map<String, dynamic> json) =>
  //     _$VisitsSplitEntityFromJson(json);

  // Map<String, dynamic> toJson() => _$VisitsSplitEntityToJson(this);
}

//
//
//
//// Maybe use direct keys, without VisitsSplitEntity wrapper
//// but now i do that.
@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class VisitsSplitResponse extends SpymetricsResponse {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final VisitsSplitEntity? visitsSplit;

  const VisitsSplitResponse({super.meta, this.visitsSplit});

  factory VisitsSplitResponse.fromJson(Map<String, dynamic> json) {
    final meta = SpymetricsResponseMeta.fromJson(
      json['meta'] as Map<String, dynamic>,
    );
    return VisitsSplitResponse(
      meta: meta,
      visitsSplit: VisitsSplitEntity(
        desktopVisitShare: (json['desktop_visit_share'] as num?)?.toDouble(),
        mobileWebVisitShare: (json['mobile_web_visit_share'] as num?)
            ?.toDouble(),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    ..._$VisitsSplitResponseToJson(this),
    'desktop_visit_share': visitsSplit?.desktopVisitShare,
    'mobile_web_visit_share': visitsSplit?.mobileWebVisitShare,
  };
}

// fallback converter for future
class VisitsSplitEntityConverter
    implements JsonConverter<VisitsSplitEntity?, Map<String, dynamic>> {
  const VisitsSplitEntityConverter();

  @override
  VisitsSplitEntity? fromJson(Map<String, dynamic> json) {
    print('json');
    print(json);
    return VisitsSplitEntity(
      desktopVisitShare: (json['desktop_visit_share'] as num?)?.toDouble(),
      mobileWebVisitShare: (json['mobile_web_visit_share'] as num?)?.toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson(VisitsSplitEntity? object) {
    if (object == null) return {};

    return {
      'desktop_visit_share': object.desktopVisitShare,
      'mobile_web_visit_share': object.mobileWebVisitShare,
    };
  }
}
