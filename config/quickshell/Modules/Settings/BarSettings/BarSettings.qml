import QtQuick
import Quickshell
import Quickshell.Io
import qs.Core
import qs.Core.Components
import qs.Core.Services
import qs.Core.Utils
import qs.Modules.Settings.Components

AppContainer {
    id: barSettingsRoot

    AppGroup {
        title: "Bar Style"
        icon: "bar"

        SettingSegmented {
            label: "Style"
            description: "Choose between Convex or Island"
            model: [{
                "text": "Convex",
                "value": "convex"
            }, {
                "text": "Island",
                "value": "island"
            }]
            currentValue: SettingsService.barStyle
            onActivated: (value) => {
                SettingsService.barStyle = value;
            }
        }

    }

    // ISLAND MODE WIDGETS
    AppGroup {
        title: "Island Bar Widgets"
        icon: "widgets"
        visible: SettingsService.barIslandMode

        SettingToggle {
            label: "Single Island"
            description: "Show only the center pill with the star, clock and music cava. Workspaces and tray are hidden."
            checked: SettingsService.islandSinglePill
            onCheckedChanged: {
                SettingsService.islandSinglePill = checked;
            }
        }

        SettingSegmented {
            label: "Right Circular Island"
            description: "Choose what to display in the right circular island (Music cover or Control Center)"
            visible: !SettingsService.islandSinglePill
            model: [{
                "text": "Auto (Music or Tune)",
                "value": "auto"
            }, {
                "text": "Always Music",
                "value": "music"
            }, {
                "text": "Always Control Center",
                "value": "control_center"
            }]
            currentValue: SettingsService.islandRightMode
            onActivated: (value) => {
                SettingsService.islandRightMode = value;
            }
        }

        SettingToggle {
            label: "Show Workspaces"
            description: "Display interactive workspace indicators in the left island"
            visible: !SettingsService.islandSinglePill
            checked: SettingsService.islandShowWorkspaces
            onCheckedChanged: {
                SettingsService.islandShowWorkspaces = checked;
            }
        }

        SettingToggle {
            label: "Show System Tray"
            description: "Display system tray icons in the right island"
            visible: !SettingsService.islandSinglePill
            checked: SettingsService.islandShowTray
            onCheckedChanged: {
                SettingsService.islandShowTray = checked;
            }
        }

    }

    AppGroup {
        title: "Clock Format"
        icon: "clock"

        SettingToggle {
            label: "24-Hour Time"
            description: "Use 24-hour time format instead of 12-hour AM/PM"
            checked: SettingsService.clock24h
            onCheckedChanged: {
                SettingsService.clock24h = checked;
            }
        }

        SettingToggle {
            label: "Show Seconds"
            description: "Display seconds on the main clock"
            checked: SettingsService.clockSeconds
            onCheckedChanged: {
                SettingsService.clockSeconds = checked;
            }
        }

        SettingToggle {
            label: "Show Date"
            description: "Display the current date next to the clock"
            checked: SettingsService.clockShowDate
            onCheckedChanged: {
                SettingsService.clockShowDate = checked;
            }
        }

    }

    AppGroup {
        title: "Workspaces"
        icon: "slider"

        SettingSpinBox {
            label: "Number of Workspaces"
            description: "Set the total number of workspaces shown on the bar"
            value: SettingsService.numberOfWorkspaces
            from: 1
            to: 20
            stepSize: 1
            decimals: 0
            suffix: ""
            onMoved: (val) => {
                SettingsService.numberOfWorkspaces = val;
            }
        }

    }

}
