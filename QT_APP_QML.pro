QT += qml quick
QT += quick


CONFIG += c++17

SOURCES += \
    main.cpp

RESOURCES += qml.qrc

TARGET = MyCarApp

QML_IMPORT_PATH += /usr/lib/x86_64-linux-gnu/qt5/qml

QML_DESIGNER_IMPORT_PATH = /usr/lib/x86_64-linux-gnu/qt5/qml

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

