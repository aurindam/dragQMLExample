#include "player.h"

#include <QDebug>

CustomPlayer::CustomPlayer(QQuickItem *parent) :
    QQuickItem(parent),
    m_index(0)
{
    m_timer.setInterval(100);

}

void CustomPlayer::stopRecord()
{
    if (m_timer.isActive()) {
        m_timer.stop();
        disconnect(&m_timer, SIGNAL(timeout()), this, SLOT(recordMovement()));
    }
}

void CustomPlayer::startRecord()
{
    if (m_timer.isActive())
        return;
    m_xPos.clear();
    m_xPos.clear();
    connect(&m_timer, SIGNAL(timeout()), SLOT(recordMovement()));
    m_timer.start();
}

void CustomPlayer::startReplay()
{
    if (m_timer.isActive())
        return;
    m_index = 0;
    connect(&m_timer, SIGNAL(timeout()), SLOT(replayMovement()));
    m_timer.start();
}

void CustomPlayer::recordMovement()
{
    m_xPos.append(x());
    m_yPos.append(y());
}

void CustomPlayer::replayMovement()
{
    if (m_index >= m_xPos.count()) {
        m_timer.stop();
        disconnect(&m_timer, SIGNAL(timeout()), this, SLOT(replayMovement()));
        emit replayStopped();
        m_index = 0;
        return;
    }

    setX(m_xPos.at(m_index++));
    setY(m_yPos.at(m_index++));
}
