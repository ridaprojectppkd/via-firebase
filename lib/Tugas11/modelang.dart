import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnggotaModel {
  int? id;
  String nama;
  String email;
  String visimisi;
  String phone;

  AnggotaModel({
    this.id,
    required this.nama,
    required this.email,
    required this.visimisi,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email' : email,
      'visimisi' : visimisi,
      'phone' : phone,
    };
  }

  factory AnggotaModel.fromMap(Map<String, dynamic> map) {
    return AnggotaModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email:map['email'] as String,
      visimisi: map['visimisi'] as String ,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnggotaModel.fromJson(String source) =>
    AnggotaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}