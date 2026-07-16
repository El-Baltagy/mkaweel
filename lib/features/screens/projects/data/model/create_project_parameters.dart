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
Map<String,dynamic >toJsonBody(){
  final Map<String,dynamic > map={
    'name':name,
    'owner_name':owner_name,
    'start_date':start_date,
    'end_date':end_date,
    'latitude':latitude,
    'longitude':longitude,
    'location':location,
    'contract_value':contract_value,
    'currency':currency,
    'extra_details':extra_details,
    'description':description,
  };
  map.removeWhere((key, value) => (value??'').toString().trim().isEmpty);
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
  final String? extra_details,projectId, description;
}
