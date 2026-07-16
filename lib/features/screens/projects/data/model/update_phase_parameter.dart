import 'dart:io';

import 'package:dio/dio.dart';

class CreateProjectPhaseRequest {
  final int progressPercentage;
  final String updateDate;
  final String status;
  final String notes;
  final String? plannedStartDate;
  final String? plannedEndDate;
  final String? actualStartDate;
  final String? actualEndDate;
  final List<File> photos;

  CreateProjectPhaseRequest({
    required this.progressPercentage,
    required this.updateDate,
    required this.status,
    required this.notes,
    this.plannedStartDate,
    this.plannedEndDate,
    this.actualStartDate,
    this.actualEndDate,
    this.photos = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'progress_percentage': progressPercentage,
      'update_date': updateDate,
      'status': status,
      'notes': notes,
      'planned_start_date': plannedStartDate,
      'planned_end_date': plannedEndDate,
      'actual_start_date': actualStartDate,
      'actual_end_date': actualEndDate,
    }..removeWhere((key, value) => value == null);
  }
  Future<FormData> toFormData(CreateProjectPhaseRequest request) async {
    final map = Map<String, dynamic>.from(request.toJson());

    map['photos[]'] = await Future.wait(
      request.photos.map(
            (file) => MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      ),
    );

    return FormData.fromMap(map);
  }
}