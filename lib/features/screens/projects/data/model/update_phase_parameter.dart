import 'dart:io';

import 'package:dio/dio.dart';

class UpdateProjectPhaseRequest {
  final int phaseId;
  final String updateDate,progressPercentage;
   final String notes;
  final String? plannedStartDate;
  final String? plannedEndDate;
  final String? actualStartDate;
  final String? actualEndDate;
  final List<File> photos;

  UpdateProjectPhaseRequest({
    required this.phaseId,
    required this.progressPercentage,
    required this.updateDate,
     required this.notes,
    required this.plannedStartDate,
    required this.plannedEndDate,
    required this.actualStartDate,
    required  this.actualEndDate,
    required this.photos  ,
  });

  Map<String, dynamic> toJson() {
    return {
      'progress_percentage': progressPercentage,
      'update_date': updateDate,
      // 'status': status,
      'notes': notes,
      'planned_start_date': plannedStartDate,
      'planned_end_date': plannedEndDate,
      'actual_start_date': actualStartDate,
      'actual_end_date': actualEndDate,
    }..removeWhere((key, value) => value == null);
  }
  Future<FormData> toFormData(UpdateProjectPhaseRequest request) async {
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