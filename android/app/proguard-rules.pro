# Reglas ProGuard/R8 para Horas Médicas
# Flutter y sus plugins se mantienen para evitar que R8 elimine clases usadas por reflexión.

# Flutter embedding y plugins
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }
-dontwarn io.flutter.embedding.**

# Plugins usados por la app (url_launcher, package_info_plus, shared_preferences)
-keep class dev.fluttercommunity.** { *; }
-keep class io.flutter.plugins.urllauncher.** { *; }
-keep class io.flutter.plugins.packageinfo.** { *; }
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# Mantener anotaciones y atributos útiles para depuración de crashes
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile
