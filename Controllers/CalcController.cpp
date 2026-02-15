#include "CalcController.h"
#include <QDebug>
#include <QJSEngine>
#include <QRegularExpression>

CalcController::CalcController(QObject *parent) : QObject(parent) {}

void CalcController::onButtonPressed(const QString &val) {
    QString operators = "+-\u00d7\u00f7";

    // Handle Clear
    if (val == "AC") {
        m_displayText = "0";
        m_lastOpEqual = false;
    }
    // Handle Backspace
    else if (val == "\u232b") {
        if (m_displayText.length() > 1) {
            m_displayText.chop(1);
        }
        else{
            m_displayText = "0";
        }
        m_lastOpEqual = false;
    }
    // Handle Operators
    else if (operators.contains(val)) {
        QString lastChar = m_displayText.right(1);

        // If last char is an operator, replace it (prevents 6 x +)
        if (operators.contains(lastChar)) {
            m_displayText.chop(1);
        }
        m_displayText += val;
        m_lastOpEqual = false;
    }
    // Handle Equals (The Math)
    else if (val == "=") {
        m_displayText = solveExpression(m_displayText);
        m_lastOpEqual = true;
    }
    // Handle decimal
    else if (val == ".") {
        // Get the last "chunk" (the number currently being typed)
        QStringList parts = m_displayText.split(QRegularExpression("[+\\-\u00d7\u00f7]"));
        QString currentNumber = parts.last();

        if(m_lastOpEqual == false){
            // Only add a dot if the current number doesn't have one
            if (!currentNumber.contains(".")) {
                if(currentNumber.isEmpty()){
                    m_displayText += "0.";
                }
                else{
                    m_displayText += ".";
                }
            }
        }
        else{
            m_lastOpEqual = false;
            m_displayText = "0.";
        }

    }
    // Handle Numbers
    else {
        if (m_displayText == "0" || m_lastOpEqual == true) {
            m_displayText = val;
            m_lastOpEqual = false;
        }
        else {
            m_displayText += val;
        }
    }

    emit displayTextChanged(); // Refresh UI
}

#include <QJSEngine>

QString CalcController::solveExpression(QString exp) {
    // Replace visual symbols with math symbols for the engine
    exp.replace("\u00d7", "*");
    exp.replace("\u00f7", "/");

    QJSEngine engine;
    QJSValue result = engine.evaluate(exp);

    if (result.isError()) return "Error";

    // Format the result to look nice (max 6 decimal places)
    return QString::number(result.toNumber(), 'g', 13);

    //return result.toString();
}
