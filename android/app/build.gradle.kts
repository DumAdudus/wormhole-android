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
    compileSdk = 35 // flutter.compileSdkVersion
    ndkVersion = "27.2.12479018" // flutter.ndkVersion
    val jreVer = JavaVersion.VERSION_1_8

    compileOptions {
        sourceCompatibility = jreVer
        targetCompatibility = jreVer
    }

    kotlinOptions {
        jvmTarget = jreVer.toString()
    }

    defaultConfig {
        applicationId = "dumadudus.wormhole"
        minSdk = 29 // flutter.minSdkVersion
        targetSdk = 35 // flutter.targetSdkVersion
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
    }
}

flutter {
    source = "../.."
}
