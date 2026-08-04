class AddEditTaskRequest {

    AddEditTaskRequest({
    required this.projectId,
    required this.workerId,
    required this.name,
    required this.description,
    required this.status,
    required this.dueDate,
    required this.taskId,
    required this.projectPhaseId,
  });
  final String? projectId,  workerId, name, description, status, dueDate, projectPhaseId;
    String? taskId;

  AddEditTaskRequest copyWith({
    String? projectId,
    String? taskId,
    String? workerId,
    String? name,
    String? description,
    String? status,
    String? dueDate,
    String? projectPhaseId,
  }) {
    return AddEditTaskRequest(
      projectId: projectId ?? this.projectId,
      taskId: taskId ?? this.taskId,
      workerId: workerId ?? this.workerId,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      projectPhaseId: projectPhaseId ?? this.projectPhaseId,
    );
  }
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
      'task_id': taskId,
    };
    map.removeWhere((key, value) => value==null);
    return map;
  }

  factory AddEditTaskRequest.fromJson(Map<String, dynamic> json) {
    return AddEditTaskRequest(
      projectId: json['project_id']as String?,
      workerId: json['worker_id']as String?,
      name: json['name']as String?,
      description: json['description']as String?,
      status: json['status']as String?,
      dueDate: json['due_date']as String?,
      projectPhaseId: json['project_phase_id']as String?,
      taskId: json['task_id']as String?,
    );
  }
}