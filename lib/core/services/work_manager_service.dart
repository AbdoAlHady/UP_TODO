import 'package:workmanager/workmanager.dart';

import 'local_notification_service.dart';

class WorkManagerService {
  //! Initialize the WorkManager service
  Future<void> init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    // Register My Task
    registerMyTask();
  }

  /// Register Task
  void registerMyTask() async {
    // كدا انا بسجل تاسك هيشتغل مره واحده يس
    await Workmanager().registerPeriodicTask(
      'id 1', // unique name
      'show simple notification',
      frequency: const Duration(hours: 12) // taskName
    );
  }

  /// Cancel Task By Unique Name
  void cancelTask({required String uniqueName}) {
    Workmanager().cancelByUniqueName(uniqueName);
  }
}

// 1. init workmanager
// 2. create a method that i want to run in background
// 3. register the task

/// Method that i want to run in background
@pragma('vm:entry-point')
  void actionTask() {
    // Show Notification
    Workmanager().executeTask(
      (taskName, inputData) {
        LocalNotificationService.showDailyScheduledNotification();
        return Future.value(true);
      },
    );
  }


  // 1. Schedule notification at 9 pm.
  // 2. execute for this notification.