import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/model/task_model.dart';
import 'add_task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  String currentDate = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //! Get Date
  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      currentDate = DateFormat.yMd().format(selectedDate);
      emit(GetDateSuccessState());
    } else {
      emit(GetDateFailureState());
    }
  }

  //! GetStartTime
  void getSartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? selectedStartTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (selectedStartTime != null) {
      startTime = selectedStartTime.format(context);
      emit(GetStartTimeSuccessState());
    } else {
      emit(GetStartTimeFailureState());
    }
  }

  //! Get End Time
  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? selectedEndTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (selectedEndTime != null) {
      endTime = selectedEndTime.format(context);
      emit(GetEndTimeSuccessState());
    } else {
      emit(GetEndTimeFailureState());
    }
  }

  //! Get Color
  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.purple;
      case 5:
        return AppColors.orange;
      default:
        return AppColors.grey;
    }
  }

  void changeColorIndex(index) {
    currentIndex = index;
    emit(ChangeColorState());
  }

  List<TaskModel> tasksList = [
    TaskModel(
        title: 'Flutter',
        id: '1',
        note: 'Learn Dart',
        startTime: '09:33 PM',
        endTime: '09:45 PM',
        isComplete: false,
        color: 1,
        date: '20/2/2023'),
    TaskModel(
        title: 'Node Js',
        id: '2',
        note: 'Learn JaveScript',
        startTime: '09:33 PM',
        endTime: '09:45 PM',
        isComplete: true,
        color: 3,
        date: '20/2/2023'),
  ];

  //! Add Task
  void addTask() async {
    emit(AddTaskLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      final task = TaskModel(
        title: title.text,
        note: note.text,
        startTime: startTime,
        endTime: endTime,
        date: currentDate,
        id: '5',
        isComplete: false,
        color: currentIndex,
      );
      tasksList.add(task);
      title.clear();
      note.clear();
      currentIndex = 0;
      currentDate = DateFormat.yMd().format(DateTime.now());
      startTime = DateFormat('hh:mm a').format(DateTime.now());
      endTime=DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 30)));
      emit(AddTaskSuccessState());
    } catch (e) {
      emit(AddTaskFailureState());
    }
  }
}
