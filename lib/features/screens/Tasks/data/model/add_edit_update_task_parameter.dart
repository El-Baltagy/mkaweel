class AddEditTaskRequest {

  const AddEditTaskRequest({
    required this.projectId,
    required this.workerId,
    required this.name,
    required this.description,
    required this.status,
    required this.dueDate,
    required this.taskId,
    required this.projectPhaseId,
  });
  final String? projectId,taskId, workerId, name, description, status, dueDate, projectPhaseId;


  Map<String, dynamic> toJson() {
    Map<String,dynamic>map=.new();
    map= {
      'project_id': projectId,
      'worker_id': workerId,
      'name': name,
      'description': description,
      'status': status,
      'due_date': dueDate,
      'project_phase_id': projectPhaseId,
    };
    map.removeWhere((key, value) => value==null);
    return map;
  }
}