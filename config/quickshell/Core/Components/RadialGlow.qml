import QtQuick
import QtQuick.Shapes

// Elliptical radial glow used by the lock screen background.
//
// Qt 6 has no direct replacement for the deprecated Qt5Compat RadialGradient,
// so the glow is drawn as a circular QtQuick.Shapes radial gradient which is
// then non-uniformly scaled around its center to obtain the ellipse. The
// gradient falls off linearly from the center color down to transparent,
// matching the old Qt5Compat behavior.
Item {
    id: root

    property color glowColor: "transparent"
    property real glowCenterX: width / 2
    property real glowCenterY: height / 2
    property real glowRadiusX: width / 3
    property real glowRadiusY: height / 3

    readonly property real glowRadius: Math.max(1, glowRadiusX)

    Shape {
        width: root.glowRadius * 2
        height: root.glowRadius * 2
        x: root.glowCenterX - root.glowRadius
        y: root.glowCenterY - root.glowRadius

        transform: Scale {
            origin.x: root.glowRadius
            origin.y: root.glowRadius
            yScale: root.glowRadiusY / root.glowRadius
        }

        ShapePath {
            fillGradient: RadialGradient {
                centerX: root.glowRadius
                centerY: root.glowRadius
                centerRadius: root.glowRadius

                GradientStop {
                    position: 0
                    color: root.glowColor
                }

                GradientStop {
                    position: 1
                    color: "transparent"
                }

            }

            startX: 0
            startY: 0

            PathLine {
                x: root.glowRadius * 2
                y: 0
            }

            PathLine {
                x: root.glowRadius * 2
                y: root.glowRadius * 2
            }

            PathLine {
                x: 0
                y: root.glowRadius * 2
            }

        }

    }

}
