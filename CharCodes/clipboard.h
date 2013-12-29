#ifndef CLIPBOARD_H
#define CLIPBOARD_H

#include <QObject>

class Clipboard : public QObject {

    Q_OBJECT

public:
    explicit Clipboard(QObject *parent = 0);
    virtual ~Clipboard();

    Q_INVOKABLE void setText(const QString &text) const;

private:
    struct ClipboardPrivate *d;
};

#endif // CLIPBOARD_H
