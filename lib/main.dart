import 'package:bring_me_bd/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  DependencyInjection.init();

  runApp(
    SafeArea(
      top: false,
      bottom: true,
      child: GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.comfortaaTextTheme(),
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
          )
        ),
      ),
    ),
  );
}
