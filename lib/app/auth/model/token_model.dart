class TokenModel {
  final String? refresh;
  final String? access;

  TokenModel({this.refresh, this.access});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(refresh: json['refresh'], access: json['access']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
