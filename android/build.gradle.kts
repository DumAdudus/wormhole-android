import com.android.build.gradle.api.AndroidBasePlugin
import com.android.build.gradle.BaseExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
//     afterEvaluate {
//         if (project.hasProperty("android")) {
//             project.android {
//                 if (!hasProperty("namespace") || namespace == null || namespace.isEmpty()) {
//                     // Assign a default namespace based on the project name or group
//                     namespace = project.group.toString() ?: "com.example.${project.name}"
//                 }

//                 ndkVersion = "27.2.12479018"
//             }
//         }
//     }
    // project.plugins.configure(project)

    plugins.withType<AndroidBasePlugin> {
        // BaseExtension is the common superclass of the AppExtension and LibraryExtension which are the extension classes registered by the two plugins to the name "android"
        configure<BaseExtension> {
            // This block is typed correctly
            defaultConfig {
                if (!hasProperty("namespace") || namespace == null /*|| namespace.isEmpty()*/) {
                    // Assign a default namespace based on the project name or group
                    namespace = project.group.toString() ?: "com.example.${project.name}"
                }
                ndkVersion = "27.2.12479018"
            }
        }
    }
}
// fun PluginContainer.configure(project: Project) {
//     whenPluginAdded {
//         if (this is AndroidBasePlugin) {
//             project.extensions
//                 .getByType<BaseExtension>()
//                 .apply {
//                     applyAndroidCommons()
//                 }
//         }
//     }
// }

// fun BaseExtension.applyAndroidCommons() {
//     compileSdkVersion(BuildConfig.COMPILE_SDK)

//     defaultConfig {
//         minSdkVersion(BuildConfig.MIN_SDK)
//         targetSdkVersion(BuildConfig.TARGET_SDK)
//     }

//     // other stuff you would put into android{}
// }
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
