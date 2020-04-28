import 'package:flutter/foundation.dart';
import 'address.dart';

class Consumer {
  final String cId;
  final String cName;
  final String cGender;
  final int cPhone;
  final String cEmail;
  final DateTime cBirthDay;
  final Address cAddress;
  final String cImg;

  Consumer({
    @required this.cId,
    @required this.cName,
    @required this.cGender,
    @required this.cPhone,
    @required this.cEmail,
    @required this.cBirthDay,
    @required this.cAddress,
    @required this.cImg,
  });
}
