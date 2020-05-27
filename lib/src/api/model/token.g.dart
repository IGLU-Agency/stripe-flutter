// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    bankAccount: json['bank_account'] == null
        ? null
        : BankAccount.fromJson(json['bank_account'] as Map<String, dynamic>),
    clientIp: json['client_ip'] as String,
    created: json['created'] as int,
    id: json['id'] as String,
    livemode: json['livemode'] as bool,
    object: json['object'] as String,
    type: json['type'] as String,
    used: json['used'] as bool,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'bank_account': instance.bankAccount?.toJson(),
      'client_ip': instance.clientIp,
      'created': instance.created,
      'livemode': instance.livemode,
      'type': instance.type,
      'used': instance.used,
    };
