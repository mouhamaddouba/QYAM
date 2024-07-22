import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

class LoginData {
  final String id;
  final String nickName;
  final String phoneNumber;
  final String email;
  final String tel;
  final String fcmToken;
  final String token;
  final bool isStudent;
  final bool isManager;
  final bool isSupervisor;
  final String image;
  final bool isTeacher;
  final bool isStaff;
  final bool isAccounter;
  final String whatsapp;
  final String fatherName;
  final String fatherMobile;
  final String fatherJob;
  final String motherName;
  final String motherMobile;
  final String motherJob;
  final String parentsWhatsapp;
  final String supervisor;
  final String staffCertificate;
  final String staffJob;
  final int groupId;

  LoginData({
    required this.id,
    required this.nickName,
    required this.phoneNumber,
    required this.email,
    required this.tel,
    required this.fcmToken,
    required this.token,
    required this.isStudent,
    required this.isManager,
    required this.isSupervisor,
    required this.image,
    required this.isTeacher,
    required this.isStaff,
    required this.isAccounter,
    required this.whatsapp,
    required this.fatherName,
    required this.fatherMobile,
    required this.fatherJob,
    required this.motherName,
    required this.motherMobile,
    required this.motherJob,
    required this.parentsWhatsapp,
    required this.supervisor,
    required this.staffCertificate,
    required this.staffJob,
    required this.groupId,
  });

  factory LoginData.fromJson(
    Map<String, dynamic> encodedData,
  ) =>
      LoginData(
        id: encodedData['id'],
        nickName: encodedData['nickName'],
        phoneNumber: encodedData['phoneNumber'],
        email: encodedData['email'],
        tel: encodedData['tel'],
        fcmToken: encodedData['fcmToken'],
        token: encodedData['token'],
        isStudent: encodedData['isStudent'],
        isManager: encodedData['isManager'],
        isSupervisor: encodedData['isSupervisor'],
        image: encodedData['image'],
        isTeacher: encodedData['isTeacher'],
        isStaff: encodedData['isStaff'],
        isAccounter: encodedData['isAccounter'],
        whatsapp: encodedData['whatsapp'],
        fatherName: encodedData['fatherName'],
        fatherMobile: encodedData['fatherMobile'],
        fatherJob: encodedData['fatherJob'],
        motherName: encodedData['motherName'] ?? AppStrings.nothing.tr,
        motherMobile: encodedData['motherMobile'] ?? AppStrings.nothing.tr,
        motherJob: encodedData['motherJob'] ?? AppStrings.nothing.tr,
        parentsWhatsapp: encodedData['parentsWhatsapp'],
        supervisor: encodedData['supervisor'],
        staffCertificate: encodedData['staffCertificate'],
        staffJob: encodedData['staffJob'],
        groupId: encodedData['groupId'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'nickName': nickName,
        'phoneNumber': phoneNumber,
        'token': token,
        'email': email,
        'tel': tel,
        'fcmToken': fcmToken,
        'isStudent': isStudent,
        'isManager': isManager,
        'isSupervisor': isSupervisor,
        'image': image,
        'isTeacher': isTeacher,
        'isStaff': isStaff,
        'isAccounter': isAccounter,
        'whatsapp': whatsapp,
        'fatherName': fatherName,
        'fatherMobile': fatherMobile,
        'fatherJob': fatherJob,
        'motherName': motherName,
        'motherMobile': motherMobile,
        'motherJob': motherJob,
        'parentsWhatsapp': parentsWhatsapp,
        'supervisor': supervisor,
        'staffCertificate': staffCertificate,
        'staffJob': staffJob,
        'groupId': groupId,
      };
}
