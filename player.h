#ifndef PLAYER_H
#define PLAYER_H

#include <QQuickItem>
#include <QTimer>
#include <QVector>

class CustomPlayer : public QQuickItem
{
    Q_OBJECT
public:
    explicit CustomPlayer(QQuickItem *parent = 0);

public slots:
    void startRecord();
    void stopRecord();
    void startReplay();

signals:
    void replayStopped();
    void replayStarted();

private slots:
    void recordMovement();
    void replayMovement();

private:
    QTimer m_timer;
    QVector<int> m_xPos;
    QVector<int> m_yPos;
    int m_index;

};

#endif // PLAYER_H
