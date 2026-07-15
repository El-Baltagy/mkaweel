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
  });
Map<String,dynamic >toJsonBody()=>{
  'name':name,
  'owner_name':owner_name,
  'start_date':start_date,
  'end_date':end_date,
  'latitude':latitude,
  'longitude':longitude,
  'contract_value':contract_value,
  'currency':currency,
  if(extra_details!=null)
  'extra_details':extra_details,
  if(description!=null)
  'description':description,
};
  final String name,
      owner_name,
      start_date,
      end_date,
      latitude,
      longitude,
      contract_value,
      currency;
  final String? extra_details,projectId, description;
}
