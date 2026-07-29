class CreateProjectParameters {
  CreateProjectParameters({
    required this.name,
    required this.owner_name,
    required this.start_date,
    required this.end_date,
    required this.latitude,
    required this.longitude,
    required this.contract_value,
    required this.currency,
    required this.extra_details,
    required this.description,
    required this.projectId,
    required this.location,
  });

  factory CreateProjectParameters.fromJson(Map<String, dynamic> json) {
    return CreateProjectParameters(
      name: json['name'] as String,
      owner_name: json['owner_name'] as String,
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      location: json['location'] as String,
      contract_value: json['contract_value'] as String,
      currency: json['currency'] as String,
      extra_details: json['extra_details'] as String?,
      description: json['description'] as String?,
      projectId: json['projectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner_name': owner_name,
      'start_date': start_date,
      'end_date': end_date,
      'latitude': latitude,
      'longitude': longitude,
      'location': location,
      'contract_value': contract_value,
      'currency': currency,
      'extra_details': extra_details,
      'description': description,
      'projectId': projectId,
    };
  }

  Map<String, dynamic> toJsonBody() {
    final Map<String, dynamic> map = {
      'name': name,
      'owner_name': owner_name,
      'start_date': start_date,
      'end_date': end_date,
      'latitude': latitude,
      'longitude': longitude,
      'location': location,
      'contract_value': contract_value,
      'currency': currency,
      'extra_details': extra_details,
      'description': description,
    };
    map.removeWhere((key, value) => (value ?? '').toString().trim().isEmpty);
    return map;
  }

  final String name,
      owner_name,
      start_date,
      end_date,
      latitude,
      longitude,
      location,
      contract_value,
      currency;
  final String? extra_details, projectId, description;
}
