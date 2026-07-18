class GhantParameter{
  GhantParameter(this.id);
  final String id;

  Map<String, dynamic> toJson() => {
    'project_id': id
  };
}