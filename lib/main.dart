// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'logic/provider/complaint_provider.dart';
import 'logic/provider/leave_provider.dart';
import 'logic/provider/notice_provider.dart';
import 'logic/provider/service_provider.dart';
import 'logic/provider/userData_provider.dart';
import 'logic/service/auth_services/auth_service.dart';
import 'logic/service/fireStoreServices/complaint_firestore_service.dart';
import 'logic/service/fireStoreServices/leave_firestore_service.dart';
import 'logic/service/fireStoreServices/notice_firestore_service.dart';
import 'logic/service/fireStoreServices/service_firestore_service.dart';
import 'logic/service/fireStoreServices/user_firestore_services.dart';
import 'presentation/router/route.dart';
import 'presentation/screen/onBordingScreen.dart';
import 'presentation/screen/onboard_model.dart';

Future<void> main() async {
  int? initScreen;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(
    MultiProvider(
      providers: [
        StreamProvider.value(
          value: ServiceFirestoreService().getService(),
          initialData: null,
        ),
        StreamProvider.value(
          value: LeaveFirestoreService().getLeave(),
          initialData: null,
        ),
        StreamProvider.value(
          value: NoticeFirestoreService().getNotice(),
          initialData: null,
        ),
        StreamProvider.value(
          value: ComplaintFirestoreService().getComplaintForAdmin(),
          initialData: null,
        ),
        StreamProvider.value(
          value: UserDataFirestoreService().getUserData(),
          initialData: null,
        ),
        ChangeNotifierProvider.value(
          value: NoticeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ComplaintProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UsereDataProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LeaveProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ServiceProvider(),
        ),
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<UserDataFirestoreService>(
          create: (_) => UserDataFirestoreService(),
        ),
        Provider(create: (_) => OnboardingScreen()),
        Provider(create: (_) => SplashModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal.shade900,
        fontFamily: "Brazila",
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
