import 'package:qyam_novers_mobile/app/features/auth/domain/entities/login_data.dart';

class LoginResponseDto extends LoginData {
  LoginResponseDto({
    required super.id,
    required super.nickName,
    required super.phoneNumber,
    required super.email,
    required super.tel,
    required super.fcmToken,
    required super.token,
    required super.isStudent,
    required super.isManager,
    required super.isSupervisor,
    required super.image,
    required super.isTeacher,
    required super.isStaff,
    required super.isAccounter,
    required super.whatsapp,
    required super.fatherName,
    required super.fatherMobile,
    required super.fatherJob,
    required super.motherName,
    required super.motherMobile,
    required super.motherJob,
    required super.parentsWhatsapp,
    required super.supervisor,
    required super.staffCertificate,
    required super.staffJob,
    required super.groupId,
  });

  factory LoginResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      LoginResponseDto(
        id: json['id'],
        nickName: json['nickName'],
        phoneNumber: json['phoneNumber'],
        token: json['token'],
        email: json['email'],
        tel: json['tel'],
        fcmToken: json['fcmToken'],
        isStudent: json['isStudent'],
        isManager: json['isManager'],
        isSupervisor: json['isSupervisor'],
        image: json['image'],
        isTeacher: json['isTeacher'],
        isStaff: json['isStaff'],
        isAccounter: json['isAccounter'],
        whatsapp: json['whatsapp'],
        fatherName: json['fatherName'],
        fatherMobile: json['fatherMobile'],
        fatherJob: json['fatherJob'],
        motherName: json['motherName'],
        motherMobile: json['motherMobile'],
        motherJob: json['motherJob'],
        parentsWhatsapp: json['parentsWhatsapp'],
        supervisor: json['supervisor'],
        staffCertificate: json['staffCertificate'],
        staffJob: json['staffJob'],
        groupId: json['groupId'],
      );
}