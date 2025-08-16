//pluginManagement {
//    val flutterSdkPath = run {
//        val properties = java.util.Properties()
//        file("local.properties").inputStream().use { properties.load(it) }
//        val flutterSdkPath = properties.getProperty("flutter.sdk")
//        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
//        flutterSdkPath
//    }
//
//    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")
//
//    repositories {
//        google()
//        mavenCentral()
//        gradlePluginPortal()
//    }
//}
//
//plugins {
//    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
//    id("com.android.application") version "8.12.0" apply false
//    id("org.jetbrains.kotlin.android") version "1.9.24" apply false
//}
//
//include(":app")
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    // قراءة flutter.sdk من local.properties
    val props = java.util.Properties().apply {
        val f = java.io.File(settingsDir, "local.properties")
        if (f.exists()) f.inputStream().use { this.load(it) }
    }
    val flutterSdk: String = props.getProperty("flutter.sdk")
        ?: throw GradleException("flutter.sdk not set in local.properties")

    // إتاحة إضافات Flutter
    includeBuild("$flutterSdk/packages/flutter_tools/gradle")

    // تعريف نسخ الإضافات (اختياري لكن مفيد)
    plugins {
        id("dev.flutter.flutter-plugin-loader") version "1.0.0"
        id("com.android.application") version "8.12.0"
        id("com.android.library")     version "8.12.0"
        id("org.jetbrains.kotlin.android") version "1.9.24"
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "diafoot_care"
include(":app")



