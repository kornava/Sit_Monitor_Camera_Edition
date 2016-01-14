import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.5
import my.cool.stuff 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Label {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
    Item {
        width: 640
        height: 360

        Camera {
            id: camera

            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

            exposure {
                exposureCompensation: -1.0
                exposureMode: Camera.ExposurePortrait
            }

            flash.mode: Camera.FlashRedEyeReduction

            imageCapture {
                onImageCaptured: {
                    photoPreview.source = preview  // Show the preview in an Image
                }
            }
        }

        VideoOutput {
            source: camera
            anchors.fill: parent
            focus : visible // to receive focus and capture key events when visible
        }

        FaceRecognizer {
            id: faceRecognitionFilter
            property real scaleFactor: 1.1 // Define properties either in QML or in C++. Can be animated too.
                   onFinished: {
                       console.log("Found " + result.rects.length + " faces");
                       //s... // do something with the rectangle list

        }

    }
}

}
