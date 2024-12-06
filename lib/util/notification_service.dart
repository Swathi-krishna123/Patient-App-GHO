import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/routes.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // Request permission for iOS
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true, badge: true, sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Set up local notifications
      await _initializeLocalNotifications();

      // Generate and print fcm token for testing
      String? token = await _firebaseMessaging.getToken();
      print("FCM Token: $token");

      //Listen for messages when the app is in the foreground.
      FirebaseMessaging.onMessage.listen(_onMessageHandler);

//Listen for notifications that open the app.
      FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedAppHandler);

      // Handle notifications when app is opened from a terminated state
      RemoteMessage? initialMessage =
          await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        _handleNotificationData(initialMessage);
      }
    }
  }

  // Initialize local notifications
  static Future<void> _initializeLocalNotifications() async {
    //Specifies the settings for android to view the notification icon we have to pass the icon path in res/drawable folder
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('gho_logo_png');

//IOS settings
    const DarwinInitializationSettings iosInitSettings =
        DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

//which will handle the actions when the user taps the notification
    await _localNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse);
  }

  // Handle foreground notifications
  static Future<void> _onMessageHandler(RemoteMessage message) async {
    showLocalNotification(
        message); //Listen to the incoming notification while the app is in foreground
  }

  // Handle notification tap when app is in background or terminated
  static Future<void> _onMessageOpenedAppHandler(RemoteMessage message) async {
    _handleNotificationData(
        message); //Here we have to handle the Notification Like while clicking on the notification it should open appropriate page in the app.
  }

  // Display local notification for foreground messages
  static Future<void> showLocalNotification(RemoteMessage message) async {
    //configuration for android specific notification details
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'main_channel', // Channel ID
      'Main Channel', // Channel Name
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      badgeNumber: 1,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

//displays the local notification
    await _localNotificationsPlugin.show(
      message.notification.hashCode, // Unique ID
      message.notification?.title,
      message.notification?.body,
      platformDetails,
      payload: message.data.toString(),
    );
  }

  // Handle custom data from notifications
  static void _handleNotificationData(RemoteMessage message) {
    // Here you can navigate to specific screens based on message data
    print("Handling notification data: ${message.data}");
    Get.toNamed(PageRouteName.profile);
  }

  // Called when a notification is tapped
  static Future<void> _onDidReceiveNotificationResponse(
      NotificationResponse response) async {
    if (response.payload != null) {
      print("Notification payload: ${response.payload}");
      Get.toNamed(PageRouteName.telemedicine);
      // Handle navigation or specific action based on payload
    } else {}
  }

//This function is created to test the forground notificaton
  static Future<void> triggerTestNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
            'main_channel', // Channel ID
            'Main Channel', // Channel Name
            importance: Importance.max,
            priority: Priority.high,
            color: Color(0xFF014EC4), //Notification Icon color
            largeIcon: DrawableResourceAndroidBitmap('gho_logo_png'),
            icon: 'gho_logo_png'); //Notification Icon

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      badgeNumber: 1,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

//This is to pass the platform which that the user is using
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _localNotificationsPlugin.show(
      0, // Unique ID for this notification
      'Welcome Back.', // Title
      'Hi Akhil Welcome Back to GHO', // Body
      platformDetails, //Here it should mention that platform details such as Android or IOS
      payload: 'Test payload data', // Any custom data you want to add
    );
  }
}
