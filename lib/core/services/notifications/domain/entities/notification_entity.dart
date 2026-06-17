class NotificationEntity {
  const NotificationEntity({
    required this.title,
    required this.body,
    this.data = const {},
    this.imageUrl,
  });

  final String title;
  final String body;
  final Map<String, dynamic> data;
  final String? imageUrl;
}
