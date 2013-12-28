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
    const int lenDiff = text.length() - this->d->text.length();
    qDebug() << this->d->text << "to" << text << lenDiff;
    if (lenDiff > 0) {
        this->beginInsertRows(QModelIndex(), this->d->text.length(), text.length()-1);
        this->endInsertRows();
    } else if (lenDiff < 0) {
        this->beginRemoveRows(QModelIndex(), text.length(), this->d->text.length()-1);
        this->endRemoveRows();
    }

    this->d->text = text;
    emit textChanged(text);

    emit dataChanged(this->index(0), this->index(this->rowCount() - 1));
}

QHash<int, QByteArray> TextCharacterModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[RawRole] = "raw";
    roles[UnicodeRole] = "unicode";
    roles[HtmlEntityRole] = "htmlEntity";
    return roles;
}

int TextCharacterModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return this->d->text.length();
}

QVariant TextCharacterModel::data(const QModelIndex &index, int role) const {
    QChar c = this->d->text.at(index.row());

    switch (role) {
    case RawRole:
        return "“" + QString(c) + "”";
    case UnicodeRole:
        return "\\u" + QString::number(c.unicode());
    case HtmlEntityRole:
        return "&#" + QString::number(c.unicode()) + ";";
    default:
        return "";
    }
}
