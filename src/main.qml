import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

ApplicationWindow {
	visible: true
	width: 640
	height: 480
	title: qsTr("Hello World")

	menuBar: MenuBar {
		Menu {
			title: qsTr("File")
			MenuItem {
				text: qsTr("Exit")
				onTriggered: Qt.quit();
			}
		}
	}

	ColumnLayout
	{
		anchors
		{
			top: parent.top
			left: parent.left
			right: parent.right
			bottom: parent.bottom
			margins: 10
		}

		Slider
		{
			id: boxSelector
			signal boxChanged (int val)

			objectName: "BoxSelector"
			Layout.alignment: Qt.AlignCenter
			orientation: Qt.Horizontal
			minimumValue: 0
			maximumValue: 7
			tickmarksEnabled: true
			stepSize: 1

			onValueChanged: boxSelector.boxChanged(boxSelector.value)
		}

		Button
		{
			objectName: "MainButton"
			Layout.alignment: Qt.AlignCenter
			text: "Push"
			Layout.minimumWidth: 200
			Layout.minimumHeight: 200
			checkable: true
		}

		Slider
		{
			id: volume

			signal volumeChanged (int val)
			objectName: "Volume"
			Layout.alignment: Qt.AlignCenter
			orientation: Qt.Vertical

			Layout.minimumHeight: 400

			minimumValue: 0
			maximumValue: 100

			onValueChanged: volume.volumeChanged(volume.value)
		}
	}
}
