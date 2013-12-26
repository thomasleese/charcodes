#include <QtWidgets/QApplication>
#include <QtQml/QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    app.setApplicationName("Character Codes");
    app.setOrganizationDomain("uk.me.tomleese");

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/qml/main.qml"));

    return app.exec();
}
