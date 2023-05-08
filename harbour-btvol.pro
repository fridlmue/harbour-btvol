# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-btvol

CONFIG += sailfishapp

SOURCES += src/harbour-btvol.cpp

DISTFILES += qml/harbour-btvol.qml \
    btvol.svg \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-btvol.changes.in \
    rpm/harbour-btvol.changes.run.in \
    rpm/harbour-btvol.spec \
    rpm/harbour-btvol.yaml \
    translations/*.ts \
    harbour-btvol.desktop \
    translations/harbour-btvol-sv.ts

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-btvol-de.ts \
    translations/harbour-btvol-nl.ts \
    translations/harbour-btvol-sv.ts

RESOURCES += \
    res.qrc
