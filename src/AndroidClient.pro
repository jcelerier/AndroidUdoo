TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11
SOURCES += main.cpp \
	Application.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
	Application.h \
	osc/oscmessagegenerator.h \
	osc/oscreceiver.h \
	osc/oscsender.h

#### Libraries ####
  ##  Oscpack  ##
unix:!macx: LIBS += -L$$PWD/../../git/oscpack/build/ -loscpack

INCLUDEPATH += $$PWD/../../git/oscpack/src
DEPENDPATH += $$PWD/../../git/oscpack/src

unix:!macx: PRE_TARGETDEPS += $$PWD/../../git/oscpack/build/liboscpack.a



android-g++|android-clang {
unix:!macx: LIBS += -L$$PWD/../../stage/soft/androidBuilds/oscpack/libs/armeabi-v7a/ -loscpack

INCLUDEPATH += $$PWD/../../stage/soft/androidBuilds/oscpack/src
DEPENDPATH += $$PWD/../../stage/soft/androidBuilds/oscpack/src

unix:!macx: PRE_TARGETDEPS += $$PWD/../../stage/soft/androidBuilds/oscpack/libs/armeabi-v7a/liboscpack.a


ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
	android/AndroidManifest.xml

}
