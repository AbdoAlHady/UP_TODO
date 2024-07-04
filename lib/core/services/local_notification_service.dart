import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

import '../../features/task/data/model/task_model.dart';

class LocalNotificationService {
  // Inilize package
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Stream Notification used to get the data when i taped on notification
  static StreamController<NotificationResponse> streamController =
      StreamController();

  //! onTap Notification
  static void onTap(NotificationResponse response) {
    streamController.add(response);
  }

  //! Notification Initialization
  static Future<void> init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      // Work when i want to do something when i taped notification when the app is oppened
      onDidReceiveNotificationResponse: onTap,
      // when i tabed on notification  when app Work in Backgorund
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //! Basic Notification
  static void showBasicNotification() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'id 0',
      'basic notification',
      // to make notification visibale on the app
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound(
          'notification_sound.wav'.split('.').first),
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      0, // id
      'Basic_Notification', // title
      'Body', // body
      details,
      payload: 'Payload data',
    );

    // payload => is the data that i want to send with the notification
  }

  //! Repeated Notification
  static void showRepeatedNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      'id 1',
      'repeated_notification',
      // to make notification visibale on the app
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1, // id
      'Repeated Notification', // title
      'Body', // body
      RepeatInterval.hourly,
      details,
      payload: 'Repeated Payload data',
    );
  }

  //! Scheduled Notification
  static void showScheduledNotification(
      {required DateTime currentDate, required TimeOfDay schduledTime, required TaskModel taskModel , required int notificationId}) async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      'id 3',
      'scheduled_notification',
      // to make notification visibale on the app
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    log(tz.local.name);
    log('before ${tz.TZDateTime.now(tz.local).hour.toString()}');
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    log(tz.local.name);
    log('after ${tz.TZDateTime.now(tz.local).hour.toString()}');
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      taskModel.title,
      taskModel.note,
      tz.TZDateTime(
        tz.local,
        currentDate.year,
        currentDate.month,
        currentDate.day,
        schduledTime.hour,
        schduledTime.minute,
      ).subtract(const Duration(minutes: 1)), // iam added substrct to make the notification show before 1 minute of real time
      details,
      payload: 'Title: ${taskModel.title} Note: ${taskModel.note}',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //! Cancel Notification
  static void cancelNotification({required int notificationId}) async {
    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  //! Cancel All Notification
  static void cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static void showDailyScheduledNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'daily schduled notification',
      'id 4',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    var currentTime = tz.TZDateTime.now(tz.local);
    log("currentTime.year:${currentTime.year}");
    log("currentTime.month:${currentTime.month}");
    log("currentTime.day:${currentTime.day}");
    log("currentTime.hour:${currentTime.hour}");
    log("currentTime.minute:${currentTime.minute}");
    log("currentTime.second:${currentTime.second}");
    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      21,
    );
    log("scheduledTime.year:${scheduleTime.year}");
    log("scheduledTime.month:${scheduleTime.month}");
    log("scheduledTime.day:${scheduleTime.day}");
    log("scheduledTime.hour:${scheduleTime.hour}");
    log("scheduledTime.minute:${scheduleTime.minute}");
    log("scheduledTime.second:${scheduleTime.second}");
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(hours: 1));
      log("AfterAddedscheduledTime.year:${scheduleTime.year}");
      log("AfterAddedscheduledTime.month:${scheduleTime.month}");
      log("AfterAddedscheduledTime.day:${scheduleTime.day}");
      log("AfterAddedscheduledTime.hour:${scheduleTime.hour}");
      log("AfterAddedscheduledTime.minute:${scheduleTime.minute}");
      log("AfterAddedscheduledTime.second:${scheduleTime.second}");
      log('Added Duration to scheduled time');
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'Write your task for tomorrow',
      'Have a productive day!',
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      scheduleTime,
      details,
      payload: 'zonedSchedule',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}

// 1.settup 
// 2.basic notification 
// 3.repeated notification
// 4.schedule notification
// 5.custom sound
// 6.onTap Notification
// 7.daily notification
  