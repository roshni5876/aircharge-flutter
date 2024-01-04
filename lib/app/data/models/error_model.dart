class ErrorResponse {
  ErrorResponse({
    this.error,
  });

  final Error? error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: Error(detail: json["msg"]),
      );

  Map<String, String> _simplify() {
    Map<String, String> errorsMap = {};

    if (error?.source?.pointer?.isNotEmpty ?? false) {
      errorsMap[error!.source!.pointer!] = error?.detail ?? '';
    }

    if (errorsMap.isEmpty) {
      errorsMap = {
        'general': (error?.detail ?? '').toLowerCase().contains('sqlstate') ||
                error?.status == '500'
            ? 'Something went wrong'
            : error!.detail!,
        'code': error?.status ?? ''
      };
    } else {
      errorsMap['general'] = errorsMap.values.first;
    }
    return errorsMap;
  }

  String get generalError => _simplify()['general']!;
}

class Error {
  Error({
    this.status,
    this.code,
    this.title,
    this.detail,
    this.source,
  });

  final String? status;
  final String? code;
  final String? title;
  final String? detail;
  final Source? source;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        status: json["status"],
        code: json["code"],
        title: json["title"],
        detail: json["detail"],
        source: Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "title": title,
        "detail": detail,
        "source": source?.toJson(),
      };
}

class Source {
  Source({
    this.pointer,
  });

  final String? pointer;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        pointer: json["pointer"],
      );

  Map<String, dynamic> toJson() => {
        "pointer": pointer,
      };
}
