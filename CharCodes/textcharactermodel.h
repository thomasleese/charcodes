#ifndef TEXTCHARACTERMODEL_H
#define TEXTCHARACTERMODEL_H

#include <QAbstractListModel>

class TextCharacterModel : public QAbstractListModel {

    Q_OBJECT

    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

public:
    enum TextRoles {
        RawRole = Qt::UserRole + 1,
        UnicodeRole,
        HtmlEntityRole
    };

    explicit TextCharacterModel(QObject *parent = 0);
    virtual ~TextCharacterModel();

    QString text() const;
    void setText(const QString &text);

    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role) const;

signals:
    void textChanged(const QString &text);

private:
    struct TextCharacterModelPrivate *d;

};

#endif // TEXTCHARACTERMODEL_H
