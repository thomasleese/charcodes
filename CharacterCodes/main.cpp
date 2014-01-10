#include <QtQml>
#include <QtGui/QFont>
#include <QtQml/QQmlApplicationEngine>
#include <QtWidgets/QApplication>

#include "clipboard.h"
#include "qtquick2applicationviewer.h"
#include "textcharactermodel.h"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    app.setApplicationName("Character Codes");
    app.setOrganizationDomain("uk.me.tomleese");
    app.setFont(QFont("Monospace", 11));

    qmlRegisterType<TextCharacterModel>("CharacterCodes", 1, 0, "TextCharacterModel");
    qmlRegisterType<Clipboard>("CharacterCodes", 1, 0, "Clipboard");

    QtQuick2ApplicationViewer viewer;
    viewer.rootContext()->setContextProperty("textCharacterModel", new TextCharacterModel());
    viewer.setMainQmlFile("qml/CharacterCodes/main.qml");
    viewer.showExpanded();

    return app.exec();
}
