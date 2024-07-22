class NotificationsEntity {
  final int id;
  final String title;
  final String image;
  final String content;
  final String topic;
  final DateTime addDate;
  final String senderName;
  final String senderEmail;
  final bool isSpecificParent;

  NotificationsEntity({
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

  factory NotificationsEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      NotificationsEntity(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        content: json['content'],
        topic: json['topic'],
        addDate: DateTime.parse(json['addDate']),
        senderName: json['senderName'],
        senderEmail: json['senderEmail'],
        isSpecificParent: json['isSpecificParent'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'image': image,
        'content': content,
        'topic': topic,
        'addDate': addDate.toIso8601String(),
        'senderName': senderName,
        'senderEmail': senderEmail,
        'isSpecificParent': isSpecificParent,
      };
}
