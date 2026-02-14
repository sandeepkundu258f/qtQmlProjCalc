#include "CalcController.h"
#include <QDebug>

CalcController::CalcController(QObject *parent) : QObject(parent) {}

void CalcController::onButtonPressed(const QString &val)
{
    qDebug() << "Button pressed in C++:" << val;

    // 1. Handle Backspace
    if (val == "\u232b") {
        if (displayTextOnUI.length() > 1) {
            // Remove the last character
            displayTextOnUI.chop(1);
        } else {
            // If it's the last digit, reset to "0" instead of empty string
            displayTextOnUI = "0";
        }
    }
    // 2. Handle Clear All
    else if (val == "AC") {
        displayTextOnUI = "0";
    }
    // 3. Handle Numbers
    else {
        if (displayTextOnUI == "0") {
            displayTextOnUI = val;
        } else {
            displayTextOnUI += val;
        }
    }

    // CRITICAL: You must emit this signal or the UI won't update!
    emit displayTextChanged();
}
