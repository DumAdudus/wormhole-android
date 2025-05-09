import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "dumadudus.wormhole"
    ndkVersion = "27.2.12479018"
    compileSdk = 35
    var minSdkVer = 29
    val javaVer = JavaVersion.VERSION_21

    compileOptions {
        sourceCompatibility = javaVer
        targetCompatibility = javaVer
    }

    kotlinOptions {
        jvmTarget = javaVer.toString()
    }

    defaultConfig {
        applicationId = "dumadudus.wormhole"
        minSdk = minSdkVer
        targetSdk = compileSdk
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    val keystorePropertiesFile = rootProject.file("key.properties")
    val keystoreProperties = Properties().apply {
        load(FileInputStream(keystorePropertiesFile))
    }
    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
        debug {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
