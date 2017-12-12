QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    src/display_information.h \
    src/native_app.h

SOURCES += \
    src/main.cpp \
    src/native_app.cpp \
    src/display_information.cpp

RESOURCES += qml.qrc \
    img.qrc

android {
    QT += androidextras

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources-native

    SOURCES += $$files(android-sources-qt/*.cpp)
    HEADERS += $$files(android-sources-qt/*.h)
}


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target



DISTFILES += \
    img/splash.jpg

#ANDROID
DISTFILES += $$files(android-sources-native/*.*)
DISTFILES += $$files(android-sources-native/src/org/koreatech/trizcontradiction/*.*)
#DISTFILES += $$files(android-sources-native/libs/*.*)
DISTFILES += $$files(android-sources-native/res/*.*)
DISTFILES += $$files(android-sources-native/res/layout/*.*)
DISTFILES += $$files(android-sources-native/res/values/*.*)
DISTFILES += $$files(android-sources-native/res/values-ko/*.*)
DISTFILES += $$files(android-sources-native/res/drawable/*.*)
DISTFILES += $$files(android-sources-native/res/drawable-mdpi/*.*)
DISTFILES += $$files(android-sources-native/res/drawable-hdpi/*.*)
DISTFILES += $$files(android-sources-native/res/drawable-xhdpi/*.*)
DISTFILES += $$files(android-sources-native/res/drawable-xxhdpi/*.*)
