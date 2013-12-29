QT += qml widgets

SOURCES += main.cpp \
    textcharactermodel.cpp \
    clipboard.cpp

OTHER_FILES += \
    qml/main.qml \
    qml/ClipboardText.qml

RESOURCES += \
    resources.qrc

HEADERS += \
    textcharactermodel.h \
    clipboard.h
