//TODO
class ExtensionUpdateNotifier {
  //FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        //FlutterLocalNotificationsPlugin();
  //flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  //    AndroidFlutterLocalNotificationsPlugin>().requestNotificationsPermission();
  // See https://pub.dev/packages/flutter_local_notifications#custom-notification-sounds
  void promptUpdates(List<String> names) {
    //context.notify(
    //  Notifications.ID_UPDATES_TO_EXTS,
    //  Notifications.CHANNEL_EXTENSIONS_UPDATE,
    //) {
    //  setContentTitle(
    //    lang.update_check_notification_ext_updates(names.size, names.size),
    //  );
    //  final extNames = names.joinToString(", ");
    //  setContentText(extNames);
    //  setStyle(NotificationCompat.BigTextStyle().bigText(extNames));
    //  setSmallIcon(R.drawable.ic_extension_24dp);
    //  setContentIntent(NotificationReceiver.openExtensionsPendingActivity(context));
    //  setAutoCancel(true);
    //}
  }

  void dismiss() {
    //context.cancelNotification(Notifications.ID_UPDATES_TO_EXTS);
  }
}
