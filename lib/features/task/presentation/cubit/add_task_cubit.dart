import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:todo_app/core/di/dependancy_jnjection.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/model/task_model.dart';
import 'add_task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  String currentDate = DateFormat.yMd().format(DateTime.now());
  String selectedDate = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<TaskModel> tasksList = [];

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

  //! Change Selected Date

  void changeSelectedDate(date) {
    selectedDate = DateFormat.yMd().format(date);
    emit(ChangeSelectedDateSuccessState());
    getTasks();
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

  //! Add Task
  void addTask() async {
    emit(AddTaskLoadingState());
    try {
      final task = TaskModel(
        title: title.text,
        note: note.text,
        startTime: startTime,
        endTime: endTime,
        date: currentDate,
        isComplete: 0,
        color: currentIndex,
      );
      await getIt<SqfliteHelper>().insertToDB(task);
      await getTasks();
      title.clear();
      note.clear();
      currentIndex = 0;
      currentDate = DateFormat.yMd().format(DateTime.now());
      startTime = DateFormat('hh:mm a').format(DateTime.now());
      endTime = DateFormat('hh:mm a')
          .format(DateTime.now().add(const Duration(minutes: 30)));

      emit(AddTaskSuccessState());
    } catch (e) {
      emit(AddTaskFailureState());
    }
  }

  //! get tasks
  Future<void> getTasks() async {
    emit(GetTasksLoadingState());
    try {
      final response = await getIt<SqfliteHelper>().getFromDB();
      tasksList = response
          .map((item) => TaskModel.fromJson(item))
          .toList()
          .where((element) => element.date == selectedDate)
          .toList();
      emit(GetTasksSuccessState());
    } catch (e) {
      emit(GetTasksFailureState());
    }
  }

  //! update Task
  Future<void> updateTask(int id) async {
    emit(UpdateTaskLoadingState());
    try {
      await getIt<SqfliteHelper>().updateDB(id);
      emit(UpdateTaskSuccessState());
      getTasks();
    } catch (e) {
      emit(UpdateTaskFailureState());
    }
  }

  //! delete Task
  Future<void> deleteTask(int id) async {
    emit(DeleteTaskLoadingState());
    try {
      await getIt<SqfliteHelper>().deleteFromDB(id);
      emit(DeleteTaskSuccessState());
      getTasks();
    } catch (e) {
      emit(DeleteTaskFailureState());
    }
  }
}
