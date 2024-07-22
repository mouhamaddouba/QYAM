class NotificationsData {
  final int id;
  final String title;
  final String image;
  final String content;
  final String topic;
  final DateTime addDate;
  final String senderName;
  final String senderEmail;
  final bool isSpecificParent;

  NotificationsData({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.topic,
    required this.addDate,
    required this.senderName,
    required this.senderEmail,
    required this.isSpecificParent,
  });

  @override
  String toString() {
    return title;
  }
}
