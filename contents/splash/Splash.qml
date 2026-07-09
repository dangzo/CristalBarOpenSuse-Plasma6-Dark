import QtQuick
import org.kde.kirigami 2 as Kirigami


Rectangle {
    id: root
    color: "#1a1a1a"

     property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }


        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 8

            anchors.centerIn: parent

            source: "images/opensuselogo.png"

            sourceSize.width: size
            sourceSize.height: size
        }

      AnimatedSprite {
         source: "images/sprite-cristal-bar-opensuse.png"
         frameWidth: 350
         frameHeight: 18
         frameCount: 26
        frameDuration: 75
        interpolate: true
        anchors {
            bottom: parent.bottom
            bottomMargin: 400
            horizontalCenter: parent.horizontalCenter
        }
      }

    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
