
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