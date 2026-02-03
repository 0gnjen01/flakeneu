{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  options.noctalia = {
    enable = lib.mkEnableOption "enables noctalia-shell";
  };

  config = lib.mkIf config.noctalia.enable {
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      brightnessctl
      gpu-screen-recorder
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.dejavu-sans-mono
    ];

    services.noctalia-shell.enable = true;

    hjem.users.ignis = {
      xdg.config.files = {
        "noctalia/settings.json".text = ''
                    {
            "settingsVersion": 46,
            "bar": {
              "barType": "simple",
              "position": "top",
              "monitors": [],
              "density": "default",
              "showOutline": false,
              "showCapsule": true,
              "capsuleOpacity": 1,
              "backgroundOpacity": 0.93,
              "useSeparateOpacity": false,
              "floating": false,
              "marginVertical": 4,
              "marginHorizontal": 4,
              "frameThickness": 8,
              "frameRadius": 12,
              "outerCorners": true,
              "exclusive": true,
              "hideOnOverview": false,
              "displayMode": "always_visible",
              "autoHideDelay": 500,
              "autoShowDelay": 150,
              "widgets": {
                "left": [
                  {
                    "colorizeDistroLogo": false,
                    "colorizeSystemIcon": "none",
                    "customIconPath": "",
                    "enableColorization": false,
                    "icon": "noctalia",
                    "id": "ControlCenter",
                    "useDistroLogo": false
                  },
                  {
                    "characterCount": 2,
                    "colorizeIcons": false,
                    "emptyColor": "secondary",
                    "enableScrollWheel": true,
                    "focusedColor": "primary",
                    "followFocusedScreen": false,
                    "groupedBorderOpacity": 1,
                    "hideUnoccupied": false,
                    "iconScale": 0.8,
                    "id": "Workspace",
                    "labelMode": "index",
                    "occupiedColor": "secondary",
                    "reverseScroll": false,
                    "showApplications": false,
                    "showBadge": true,
                    "showLabelsOnlyWhenOccupied": true,
                    "unfocusedIconsOpacity": 1
                  },
                  {
                    "colorizeIcons": false,
                    "hideMode": "hidden",
                    "id": "ActiveWindow",
                    "maxWidth": 145,
                    "scrollingMode": "hover",
                    "showIcon": true,
                    "useFixedWidth": false
                  },
                  {
                    "compactMode": false,
                    "compactShowAlbumArt": true,
                    "compactShowVisualizer": false,
                    "hideMode": "hidden",
                    "hideWhenIdle": false,
                    "id": "MediaMini",
                    "maxWidth": 145,
                    "panelShowAlbumArt": true,
                    "panelShowVisualizer": true,
                    "scrollingMode": "hover",
                    "showAlbumArt": true,
                    "showArtistFirst": true,
                    "showProgressRing": true,
                    "showVisualizer": false,
                    "useFixedWidth": false,
                    "visualizerType": "linear"
                  }
                ],
                "center": [
                  {
                    "customFont": "",
                    "formatHorizontal": "HH:mm ddd, MMM dd",
                    "formatVertical": "HH mm - dd MM",
                    "id": "Clock",
                    "tooltipFormat": "HH:mm ddd, MMM dd",
                    "useCustomFont": false,
                    "usePrimaryColor": false
                  }
                ],
                "right": [
                  {
                    "blacklist": [],
                    "colorizeIcons": false,
                    "drawerEnabled": true,
                    "hidePassive": false,
                    "id": "Tray",
                    "pinned": []
                  },
                  {
                    "hideWhenZero": false,
                    "hideWhenZeroUnread": false,
                    "id": "NotificationHistory",
                    "showUnreadBadge": true,
                    "unreadBadgeColor": "primary"
                  },
                  {
                    "displayMode": "onhover",
                    "id": "Volume",
                    "middleClickCommand": "pwvucontrol || pavucontrol"
                  },
                  {
                    "deviceNativePath": "__default__",
                    "displayMode": "onhover",
                    "hideIfIdle": false,
                    "hideIfNotDetected": true,
                    "id": "Battery",
                    "showNoctaliaPerformance": false,
                    "showPowerProfiles": false,
                    "warningThreshold": 30
                  },
                  {
                    "displayMode": "onhover",
                    "id": "Brightness"
                  },
                  {
                    "defaultSettings": {
                      "audioCodec": "opus",
                      "audioSource": "default_output",
                      "colorRange": "limited",
                      "copyToClipboard": false,
                      "directory": "",
                      "filenamePattern": "recording_yyyyMMdd_HHmmss",
                      "frameRate": "60",
                      "hideInactive": false,
                      "quality": "very_high",
                      "resolution": "original",
                      "showCursor": true,
                      "videoCodec": "h264",
                      "videoSource": "portal"
                    },
                    "id": "plugin:screen-recorder"
                  }
                ]
              },
              "screenOverrides": []
            },
            "general": {
              "avatarImage": "/home/ignis/.face",
              "dimmerOpacity": 0.2,
              "showScreenCorners": true,
              "forceBlackScreenCorners": false,
              "scaleRatio": 1,
              "radiusRatio": 0,
              "iRadiusRatio": 0,
              "boxRadiusRatio": 1,
              "screenRadiusRatio": 1,
              "animationSpeed": 1,
              "animationDisabled": true,
              "compactLockScreen": false,
              "lockOnSuspend": false,
              "showSessionButtonsOnLockScreen": true,
              "showHibernateOnLockScreen": false,
              "enableShadows": true,
              "shadowDirection": "bottom_right",
              "shadowOffsetX": 2,
              "shadowOffsetY": 3,
              "language": "",
              "allowPanelsOnScreenWithoutBar": true,
              "showChangelogOnStartup": true,
              "telemetryEnabled": false,
              "enableLockScreenCountdown": true,
              "lockScreenCountdownDuration": 10000,
              "autoStartAuth": false,
              "allowPasswordWithFprintd": false
            },
            "ui": {
              "fontDefault": "DejaVu Sans",
              "fontFixed": "DejaVu Sans Mono",
              "fontDefaultScale": 1,
              "fontFixedScale": 1,
              "tooltipsEnabled": true,
              "panelBackgroundOpacity": 0.93,
              "panelsAttachedToBar": true,
              "settingsPanelMode": "attached",
              "wifiDetailsViewMode": "grid",
              "bluetoothDetailsViewMode": "grid",
              "networkPanelView": "wifi",
              "bluetoothHideUnnamedDevices": false,
              "boxBorderEnabled": true
            },
            "location": {
              "name": "Belgrade",
              "weatherEnabled": true,
              "weatherShowEffects": true,
              "useFahrenheit": false,
              "use12hourFormat": false,
              "showWeekNumberInCalendar": false,
              "showCalendarEvents": true,
              "showCalendarWeather": true,
              "analogClockInCalendar": false,
              "firstDayOfWeek": -1,
              "hideWeatherTimezone": false,
              "hideWeatherCityName": false
            },
            "calendar": {
              "cards": [
                {
                  "enabled": true,
                  "id": "calendar-header-card"
                },
                {
                  "enabled": true,
                  "id": "calendar-month-card"
                },
                {
                  "enabled": true,
                  "id": "weather-card"
                }
              ]
            },
            "wallpaper": {
              "enabled": false,
              "overviewEnabled": false,
              "directory": "/home/ignis/Pictures/Wallpapers",
              "monitorDirectories": [],
              "enableMultiMonitorDirectories": false,
              "showHiddenFiles": false,
              "viewMode": "single",
              "setWallpaperOnAllMonitors": true,
              "fillMode": "crop",
              "fillColor": "#000000",
              "useSolidColor": false,
              "solidColor": "#1a1a2e",
              "automationEnabled": false,
              "wallpaperChangeMode": "random",
              "randomIntervalSec": 300,
              "transitionDuration": 1500,
              "transitionType": "random",
              "transitionEdgeSmoothness": 0.05,
              "panelPosition": "follow_bar",
              "hideWallpaperFilenames": false,
              "useWallhaven": false,
              "wallhavenQuery": "",
              "wallhavenSorting": "relevance",
              "wallhavenOrder": "desc",
              "wallhavenCategories": "111",
              "wallhavenPurity": "100",
              "wallhavenRatios": "",
              "wallhavenApiKey": "",
              "wallhavenResolutionMode": "atleast",
              "wallhavenResolutionWidth": "",
              "wallhavenResolutionHeight": ""
            },
            "appLauncher": {
              "enableClipboardHistory": false,
              "autoPasteClipboard": false,
              "enableClipPreview": true,
              "clipboardWrapText": true,
              "clipboardWatchTextCommand": "wl-paste --type text --watch cliphist store",
              "clipboardWatchImageCommand": "wl-paste --type image --watch cliphist store",
              "position": "center",
              "pinnedApps": [],
              "useApp2Unit": false,
              "sortByMostUsed": false,
              "terminalCommand": "alacritty -e",
              "customLaunchPrefixEnabled": false,
              "customLaunchPrefix": "",
              "viewMode": "list",
              "showCategories": false,
              "iconMode": "tabler",
              "showIconBackground": false,
              "enableSettingsSearch": false,
              "enableWindowsSearch": false,
              "ignoreMouseInput": false,
              "screenshotAnnotationTool": ""
            },
            "controlCenter": {
              "position": "close_to_bar_button",
              "diskPath": "/",
              "shortcuts": {
                "left": [
                  {
                    "id": "Network"
                  },
                  {
                    "id": "Bluetooth"
                  },
                  {
                    "id": "WallpaperSelector"
                  },
                  {
                    "id": "NoctaliaPerformance"
                  }
                ],
                "right": [
                  {
                    "id": "Notifications"
                  },
                  {
                    "id": "PowerProfile"
                  },
                  {
                    "id": "KeepAwake"
                  },
                  {
                    "id": "NightLight"
                  }
                ]
              },
              "cards": [
                {
                  "enabled": true,
                  "id": "profile-card"
                },
                {
                  "enabled": true,
                  "id": "shortcuts-card"
                },
                {
                  "enabled": true,
                  "id": "audio-card"
                },
                {
                  "enabled": false,
                  "id": "brightness-card"
                },
                {
                  "enabled": true,
                  "id": "weather-card"
                },
                {
                  "enabled": true,
                  "id": "media-sysmon-card"
                }
              ]
            },
            "systemMonitor": {
              "cpuWarningThreshold": 80,
              "cpuCriticalThreshold": 90,
              "tempWarningThreshold": 80,
              "tempCriticalThreshold": 90,
              "gpuWarningThreshold": 80,
              "gpuCriticalThreshold": 90,
              "memWarningThreshold": 80,
              "memCriticalThreshold": 90,
              "swapWarningThreshold": 80,
              "swapCriticalThreshold": 90,
              "diskWarningThreshold": 80,
              "diskCriticalThreshold": 90,
              "cpuPollingInterval": 3000,
              "tempPollingInterval": 3000,
              "gpuPollingInterval": 3000,
              "enableDgpuMonitoring": false,
              "memPollingInterval": 3000,
              "diskPollingInterval": 30000,
              "networkPollingInterval": 3000,
              "loadAvgPollingInterval": 3000,
              "useCustomColors": false,
              "warningColor": "",
              "criticalColor": "",
              "externalMonitor": "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor"
            },
            "dock": {
              "enabled": false,
              "position": "bottom",
              "displayMode": "auto_hide",
              "backgroundOpacity": 1,
              "floatingRatio": 1,
              "size": 1,
              "onlySameOutput": true,
              "monitors": [],
              "pinnedApps": [],
              "colorizeIcons": false,
              "pinnedStatic": false,
              "inactiveIndicators": false,
              "deadOpacity": 0.6,
              "animationSpeed": 1
            },
            "network": {
              "wifiEnabled": true,
              "bluetoothRssiPollingEnabled": false,
              "bluetoothRssiPollIntervalMs": 10000,
              "wifiDetailsViewMode": "grid",
              "bluetoothDetailsViewMode": "grid",
              "bluetoothHideUnnamedDevices": false
            },
            "sessionMenu": {
              "enableCountdown": true,
              "countdownDuration": 10000,
              "position": "center",
              "showHeader": true,
              "largeButtonsStyle": false,
              "largeButtonsLayout": "grid",
              "showNumberLabels": true,
              "powerOptions": [
                {
                  "action": "lock",
                  "command": "",
                  "countdownEnabled": true,
                  "enabled": true
                },
                {
                  "action": "suspend",
                  "command": "",
                  "countdownEnabled": true,
                  "enabled": true
                },
                {
                  "action": "hibernate",
                  "command": "",
                  "countdownEnabled": true,
                  "enabled": true
                },
                {
                  "action": "reboot",
                  "command": "",
                  "countdownEnabled": true,
                  "enabled": true
                },
                {
                  "action": "logout",
                  "command": "",
                  "countdownEnabled": true,
                  "enabled": true
                },
                {
                  "action": "shutdown",
                  "command": "",
                  "countdownEnabled": true,
                  "enabled": true
                }
              ]
            },
            "notifications": {
              "enabled": true,
              "monitors": [],
              "location": "top_right",
              "overlayLayer": true,
              "backgroundOpacity": 1,
              "respectExpireTimeout": false,
              "lowUrgencyDuration": 3,
              "normalUrgencyDuration": 8,
              "criticalUrgencyDuration": 15,
              "enableKeyboardLayoutToast": true,
              "saveToHistory": {
                "low": true,
                "normal": true,
                "critical": true
              },
              "sounds": {
                "enabled": false,
                "volume": 0.5,
                "separateSounds": false,
                "criticalSoundFile": "",
                "normalSoundFile": "",
                "lowSoundFile": "",
                "excludedApps": "discord,firefox,chrome,chromium,edge"
              },
              "enableMediaToast": false
            },
            "osd": {
              "enabled": true,
              "location": "top_right",
              "autoHideMs": 2000,
              "overlayLayer": true,
              "backgroundOpacity": 1,
              "enabledTypes": [
                0,
                1,
                2
              ],
              "monitors": []
            },
            "audio": {
              "volumeStep": 5,
              "volumeOverdrive": false,
              "cavaFrameRate": 30,
              "visualizerType": "linear",
              "mprisBlacklist": [],
              "preferredPlayer": "",
              "volumeFeedback": false
            },
            "brightness": {
              "brightnessStep": 5,
              "enforceMinimum": true,
              "enableDdcSupport": false
            },
            "colorSchemes": {
              "useWallpaperColors": false,
              "predefinedScheme": "Eldritch",
              "darkMode": true,
              "schedulingMode": "off",
              "manualSunrise": "06:30",
              "manualSunset": "18:30",
              "generationMethod": "tonal-spot",
              "monitorForColors": ""
            },
            "templates": {
              "activeTemplates": [],
              "enableUserTheming": false
            },
            "nightLight": {
              "enabled": false,
              "forced": false,
              "autoSchedule": true,
              "nightTemp": "4000",
              "dayTemp": "6500",
              "manualSunrise": "06:30",
              "manualSunset": "18:30"
            },
            "hooks": {
              "enabled": false,
              "wallpaperChange": "",
              "darkModeChange": "",
              "screenLock": "",
              "screenUnlock": "",
              "performanceModeEnabled": "",
              "performanceModeDisabled": "",
              "startup": "",
              "session": ""
            },
            "desktopWidgets": {
              "enabled": false,
              "gridSnap": false,
              "monitorWidgets": []
            }
          }
        '';
        "noctalia/colors.json".text = ''
          {
              "mError": "#e46876",
              "mHover": "#7fb4ca",
              "mOnError": "#23262d",
              "mOnHover": "#23262d",
              "mOnPrimary": "#23262d",
              "mOnSecondary": "#23262d",
              "mOnSurface": "#c5c9c7",
              "mOnSurfaceVariant": "#938aa9",
              "mOnTertiary": "#23262d",
              "mOutline": "#5c6066",
              "mPrimary": "#7aa89f",
              "mSecondary": "#7fb4ca",
              "mShadow": "#23262d",
              "mSurface": "#23262d",
              "mSurfaceVariant": "#43464e",
              "mTertiary": "#938aa9"
          }
        '';
      };
    };
  };
}
