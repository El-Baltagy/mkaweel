// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendenceResImpl _$$AttendenceResImplFromJson(Map<String, dynamic> json) =>
    _$AttendenceResImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: AttendenceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendenceResImplToJson(_$AttendenceResImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$AttendenceDataImpl _$$AttendenceDataImplFromJson(Map<String, dynamic> json) =>
    _$AttendenceDataImpl(
      worker_id: (json['worker_id'] as num).toInt(),
      worker_name: json['worker_name'] as String,
      is_checked_in: json['is_checked_in'] as bool?,
      is_checked_in_this_project: json['is_checked_in_this_project'] as bool?,
      status: json['status'] as String,
      current_attendance: json['current_attendance'] == null
          ? null
          : Currentattendance.fromJson(
              json['current_attendance'] as Map<String, dynamic>),
      last_attendance: json['last_attendance'] == null
          ? null
          : Lastattendance.fromJson(
              json['last_attendance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendenceDataImplToJson(
        _$AttendenceDataImpl instance) =>
    <String, dynamic>{
      'worker_id': instance.worker_id,
      'worker_name': instance.worker_name,
      'is_checked_in': instance.is_checked_in,
      'is_checked_in_this_project': instance.is_checked_in_this_project,
      'status': instance.status,
      'current_attendance': instance.current_attendance?.toJson(),
      'last_attendance': instance.last_attendance?.toJson(),
    };

_$CurrentattendanceImpl _$$CurrentattendanceImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentattendanceImpl(
      id: (json['id'] as num).toInt(),
      worker_id: (json['worker_id'] as num).toInt(),
      project_id: (json['project_id'] as num).toInt(),
      date: json['date'] as String?,
      check_in_time: json['check_in_time'] as String?,
      check_out_time: json['check_out_time'] as String?,
      check_in_latitude: json['check_in_latitude'] as String?,
      check_in_longitude: json['check_in_longitude'] as String?,
      check_out_latitude: json['check_out_latitude'] as String?,
      check_out_longitude: json['check_out_longitude'] as String?,
      work_done: json['work_done'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CurrentattendanceImplToJson(
        _$CurrentattendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'worker_id': instance.worker_id,
      'project_id': instance.project_id,
      'date': instance.date,
      'check_in_time': instance.check_in_time,
      'check_out_time': instance.check_out_time,
      'check_in_latitude': instance.check_in_latitude,
      'check_in_longitude': instance.check_in_longitude,
      'check_out_latitude': instance.check_out_latitude,
      'check_out_longitude': instance.check_out_longitude,
      'work_done': instance.work_done,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'project': instance.project.toJson(),
    };

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      owner_name: json['owner_name'] as String,
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      location: json['location'],
      description: json['description'] as String,
      extra_details: json['extra_details'] as String,
      currency: json['currency'] as String,
      contract_value: json['contract_value'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      progress_percentage: (json['progress_percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner_name': instance.owner_name,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
      'description': instance.description,
      'extra_details': instance.extra_details,
      'currency': instance.currency,
      'contract_value': instance.contract_value,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'progress_percentage': instance.progress_percentage,
    };

_$LastattendanceImpl _$$LastattendanceImplFromJson(Map<String, dynamic> json) =>
    _$LastattendanceImpl(
      id: (json['id'] as num).toInt(),
      worker_id: (json['worker_id'] as num).toInt(),
      project_id: (json['project_id'] as num).toInt(),
      date: json['date'] as String,
      check_in_time: json['check_in_time'] as String,
      check_out_time: json['check_out_time'] as String,
      check_in_latitude: json['check_in_latitude'] as String,
      check_in_longitude: json['check_in_longitude'] as String,
      check_out_latitude: json['check_out_latitude'] as String,
      check_out_longitude: json['check_out_longitude'] as String,
      work_done: json['work_done'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LastattendanceImplToJson(
        _$LastattendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'worker_id': instance.worker_id,
      'project_id': instance.project_id,
      'date': instance.date,
      'check_in_time': instance.check_in_time,
      'check_out_time': instance.check_out_time,
      'check_in_latitude': instance.check_in_latitude,
      'check_in_longitude': instance.check_in_longitude,
      'check_out_latitude': instance.check_out_latitude,
      'check_out_longitude': instance.check_out_longitude,
      'work_done': instance.work_done,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'project': instance.project.toJson(),
    };
