#include <QDebug>

#include "textcharactermodel.h"

struct TextCharacterModelPrivate {
    QString text;
};

TextCharacterModel::TextCharacterModel(QObject *parent)
    : QAbstractListModel(parent), d(new TextCharacterModelPrivate()) {

}

TextCharacterModel::~TextCharacterModel() {
    delete d;
}

QString TextCharacterModel::text() const {
    return this->d->text;
}

void TextCharacterModel::setText(const QString &text) {
    this->d->text = text;
    qDebug() << text;
    emit textChanged(text);
}

int TextCharacterModel::rowCount(const QModelIndex &parent) const {
    return this->d->text.length();
}

QVariant TextCharacterModel::data(const QModelIndex &index, int role) const {
    return this->d->text.at(index.row());
}
