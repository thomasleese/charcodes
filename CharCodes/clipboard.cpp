#include <QApplication>
#include <QClipboard>

#include "clipboard.h"

struct ClipboardPrivate {
    QClipboard *clipboard;
};

Clipboard::Clipboard(QObject *parent)
    : QObject(parent), d(new ClipboardPrivate()) {
    this->d->clipboard = QApplication::clipboard();
}

Clipboard::~Clipboard() {
    delete this->d;
}

void Clipboard::setText(const QString &text) const {
    this->d->clipboard->setText(text, QClipboard::Clipboard);
    this->d->clipboard->setText(text, QClipboard::Selection);
}
