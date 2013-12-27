#include <QtQml>
#include <QtQml/QQmlApplicationEngine>
#include <QtWidgets/QApplication>

#include "textcharactermodel.h"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    app.setApplicationName("Character Codes");
    app.setOrganizationDomain("uk.me.tomleese");

    qmlRegisterType<TextCharacterModel>("CharCodes", 1, 0, "TextCharacterModel");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("textCharacterModel", new TextCharacterModel());
    engine.load(QUrl("qrc:/qml/main.qml"));

    return app.exec();
}
