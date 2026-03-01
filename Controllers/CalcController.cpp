#include "CalcController.h"
#include <QDebug>
#include <QJSEngine>
#include <QRegularExpression>

CalcController::CalcController(QObject *parent) : QObject(parent) {}

void CalcController::onButtonPressed(const QString &val) {

    // Handle Clear
    if (val == "AC") {
        m_displayText = "0";
        m_partialCalcText = "";
        m_lastOpEqual = false;
    }
    // Handle Backspace
    else if (val == "\u232b") {
        if (m_displayText.length() > 1) {
            m_displayText.chop(1);
            solvePartialExpression(m_displayText);
        }
        else{
            m_displayText = "0";
            m_partialCalcText = "";
        }
        m_lastOpEqual = false;
    }
    // Handle Operators
    else if (m_operators.contains(val)) {
        // If last char is an operator, replace it (prevents 6 x +)
        m_displayText = removeLastOp(m_displayText);

        m_displayText += val;
        m_lastOpEqual = false;
    }
    // Handle Equals (The Math)
    else if (val == "=") {
        m_displayText = solveExpression(m_displayText);
        m_partialCalcText = "";
        m_lastOpEqual = true;
    }
    // Handle % button
    else if (val == "%") {
        // Split the string into chunks based on operators
        QStringList parts = m_displayText.split(QRegularExpression("[\u00d7\u00f7+\\-]"));

        if (parts.size() >= 1) {
            QString currentNumberStr = parts.last(); // The "10" in "200 + 10"
            double currentVal = currentNumberStr.toDouble();
            double percentResult = 0;

            // If there's a number before this one (e.g., "200 + 10")
            if (parts.size() >= 2) {
                double previousVal = parts.at(parts.size() - 2).toDouble(); // The "200"
                percentResult = (previousVal * currentVal) / 100.0;
            } else {
                // just a single number (e.g., "50")
                percentResult = currentVal / 100.0;
            }

            // Update the display
            m_displayText.chop(currentNumberStr.length());
            m_displayText += QString::number(percentResult, 'g', 13);

            m_lastOpEqual = false;
        }

        solvePartialExpression(m_displayText);
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

        solvePartialExpression(m_displayText);
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

        solvePartialExpression(m_displayText);
    }

    emit displayTextChanged(); // Refresh UI
    emit partialTextChanged();
}


QString CalcController::solveExpression(QString exp) {

    exp = removeLastOp(exp);

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

void CalcController::solvePartialExpression(QString exp){

    QStringList parts = m_displayText.split(QRegularExpression("[\u00d7\u00f7+\\-]"));
    if(!(parts.size()==2 && parts[1].isEmpty()) && parts.size()>1){
        QString result = solveExpression(exp);

        if(result != "Error"){
            m_partialCalcText = result;
        }
    }
    else{
        m_partialCalcText = "";
    }
}

QString CalcController::removeLastOp(QString exp){
    QString lastChar = exp.right(1);

    // If last char is an operator, remove it
    if (m_operators.contains(lastChar)) {
        exp.chop(1);
    }

    return exp;
}
