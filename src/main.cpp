#include <QApplication>
#include <QQmlApplicationEngine>

#include "Application.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	Application monapp;
	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

	QObject::connect(engine.rootObjects().first()->findChild<QObject*>("MainButton"), SIGNAL(clicked()),
					 &monapp, SLOT(enable()));
	QObject::connect(engine.rootObjects().first()->findChild<QObject*>("BoxSelector"), SIGNAL(boxChanged(int)),
					 &monapp, SLOT(setCurrentSlot(int)));
	QObject::connect(engine.rootObjects().first()->findChild<QObject*>("Volume"), SIGNAL(volumeChanged(int)),
					 &monapp, SLOT(volume(int)));

	return app.exec();
}
