#ifndef CALCCONTROLLER_H
#define CALCCONTROLLER_H

#include <QObject>
#include <QString>

class CalcController : public QObject
{
    Q_OBJECT
    // This allows QML to 'read' the text and get notified when it changes
    Q_PROPERTY(QString displayText READ displayTextFunc NOTIFY displayTextChanged)

public:
    explicit CalcController(QObject *parent = nullptr);

    // Getter for the property
    QString displayTextFunc() const { return m_displayText; }

    // Q_INVOKABLE makes this function visible to QML
    Q_INVOKABLE void onButtonPressed(const QString &val);

signals:
    // This signal tells QML "Hey, I updated the number, redraw yourself!"
    void displayTextChanged();

private:
    QString m_displayText = "0"; // The actual data stored
    double m_firstValue = 0;
    QString m_pendingOperator = "";
    bool m_waitingForSecondValue = false; // This tracks if we just hit an operator
    bool m_lastOpEqual = false;

    QString solveExpression(QString exp);
};

#endif // CALCCONTROLLER_H
