
sealed class TaskState {}

class TaskInitial extends TaskState {}

class GetDateLoadingState extends TaskState{}
class GetDateSuccessState extends TaskState{}
class GetDateFailureState extends TaskState{}

class GetStartTimeLoadingState extends TaskState{}
class GetStartTimeSuccessState extends TaskState{}
class GetStartTimeFailureState extends TaskState{}

class GetEndTimeLoadingState extends TaskState{}
class GetEndTimeSuccessState extends TaskState{}
class GetEndTimeFailureState extends TaskState{}

class ChangeColorState extends TaskState{}

class AddTaskLoadingState extends TaskState{}
class AddTaskSuccessState extends TaskState{}
class AddTaskFailureState extends TaskState{}

class GetTasksLoadingState extends TaskState{}
class GetTasksSuccessState extends TaskState{}
class GetTasksFailureState extends TaskState{}

class UpdateTaskLoadingState extends TaskState{}
class UpdateTaskSuccessState extends TaskState{}
class UpdateTaskFailureState extends TaskState{}

class DeleteTaskLoadingState extends TaskState{}
class DeleteTaskSuccessState extends TaskState{}
class DeleteTaskFailureState extends TaskState{}


class ChangeSelectedDateSuccessState extends TaskState{}