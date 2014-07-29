#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include <QDebug>
#include "osc/oscsender.h"
#include "osc/oscmessagegenerator.h"
class Application : public QObject
{
		Q_OBJECT
		Q_PROPERTY(int currentSlot READ currentSlot WRITE setCurrentSlot)
	public:
		explicit Application(QObject *parent = 0);

		int currentSlot() const
		{
			return m_currentSlot;
		}

	public slots:
		void enable()
		{ sender.send(osc::MessageGenerator()("/box/enable", currentSlot())); }
		void volume(int vol)
		{ sender.send(osc::MessageGenerator()("/box/volume", currentSlot(), vol)); }

		void setCurrentSlot(int arg)
		{ m_currentSlot = arg; }

	private:
		OscSender sender{"192.170.0.1", 9988};
		int m_currentSlot{};
};

#endif // APPLICATION_H
