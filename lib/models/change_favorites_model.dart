class ChangeFavoriteModel {
  final bool status;
  final String message;

  ChangeFavoriteModel({
    required this.status,
    required this.message,
  });

  factory ChangeFavoriteModel.fromJson(json) {
    return ChangeFavoriteModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
