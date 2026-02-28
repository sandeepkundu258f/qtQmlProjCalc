cmake_minimum_required(VERSION 3.16)

project(QtQMLProjCalc VERSION 0.1.2 LANGUAGES CXX)

# --- 1. BASIC CONFIGURATION ---
set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Qt 6
find_package(Qt6 REQUIRED COMPONENTS Quick)
qt_standard_project_setup(REQUIRES 6.8)

# --- 2. TARGET & QML MODULE ---
qt_add_executable(appQtQMLProjCalc

)

qt_add_qml_module(appQtQMLProjCalc
    URI QtQMLProjCalc
    QML_FILES

    RESOURCES InstallScripts/qtqmlprojcalc.desktop
    RESOURCES .gitignore
    RESOURCES
    RESOURCES Icons/developer128.png Icons/developer16.png Icons/developer256.png
    RESOURCES
    RESOURCES InstallScripts/postinst.sh
    SOURCES
    QML_FILES
    SOURCES main.cpp
    QML_FILES Main.qml
    SOURCES Controllers/CalcController.cpp Controllers/CalcController.h
    QML_FILES QmlComponents/Buttons/BackButton.qml QmlComponents/Buttons/ButtonBase.qml QmlComponents/Buttons/EqualButton.qml QmlComponents/Buttons/NumberButton.qml QmlComponents/Buttons/OperationButton.qml
    QML_FILES QmlComponents/Layouts/BasicCalcColumnLayout.qml QmlComponents/Outputs/CalcOutput.qml QmlComponents/Outputs/CalcPartialOutput.qml
    RESOURCES InstallScripts/prerm.sh
    RESOURCES generateRPM.sh
    RESOURCES generateDEB.sh
    RESOURCES README.md
    RESOURCES LICENSE
)

target_link_libraries(appQtQMLProjCalc
    PRIVATE Qt6::Quick
)

# --- 3. INSTALLATION LOGIC (Standard Linux) ---
include(GNUInstallDirs)

# Install Binary to /opt/qtqmlprojcalc/bin/ via CPACK_PACKAGING_INSTALL_PREFIX
install(TARGETS appQtQMLProjCalc
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Deployment script for QML dependencies (Qt 6.10+)
qt_generate_deploy_qml_app_script(
    TARGET appQtQMLProjCalc
    OUTPUT_SCRIPT deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})

# System Integration: Desktop File
install(FILES InstallScripts/qtqmlprojcalc.desktop
        DESTINATION /usr/share/applications)

# System Integration: Icons (Different sizes)
install(FILES Icons/developer256.png
        DESTINATION /usr/share/icons/hicolor/256x256/apps/
        RENAME qtqmlprojcalc-icon.png)
install(FILES Icons/developer128.png
        DESTINATION /usr/share/icons/hicolor/128x128/apps/
        RENAME qtqmlprojcalc-icon.png)
install(FILES Icons/developer16.png
        DESTINATION /usr/share/icons/hicolor/16x16/apps/
        RENAME qtqmlprojcalc-icon.png)

# --- 4. PACKAGING (CPACK) ---
# Prepare the post-install script for Debian
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/InstallScripts/postinst.sh" "${CMAKE_BINARY_DIR}/InstallScripts/postinst" COPYONLY)

# Prepare the pre-remove script for Debian
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/InstallScripts/prerm.sh" "${CMAKE_BINARY_DIR}/InstallScripts/prerm" COPYONLY)

# --- CPACK CONFIG ---
#set(CPACK_GENERATOR "DEB")

# General CPack Settings
set(CPACK_PACKAGE_NAME "qtqmlprojcalc")
set(CPACK_PACKAGE_VENDOR "Sandeep")

# The first line is the summary, following lines are the long description
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A sleek Qt6 QML Calculator for Linux.")
# Use this variable to override the default CPack boilerplate
set(CPACK_RPM_PACKAGE_DESCRIPTION "QT Calculator is a modern calculator application built with Qt 6.10 and QML. It features a clean interface and is optimized for both Fedora KDE and Linux Mint.")
set(CPACK_PACKAGE_DESCRIPTION "${CPACK_RPM_PACKAGE_DESCRIPTION}")
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/qtqmlprojcalc")

# Versioning
set(CPACK_PACKAGE_VERSION_MAJOR "${PROJECT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${PROJECT_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${PROJECT_VERSION_PATCH}")

# This combines them for the installer UI
set(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")

# DEBIAN Specific
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Sandeep <sandeepkundu258@gmail.com>")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libxcb-cursor0, libc6, libstdc++6")
set(CPACK_DEBIAN_PACKAGE_RECOMMENDS "qgnomeplatform-qt6, adwaita-qt6")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
    "${CMAKE_BINARY_DIR}/InstallScripts/postinst"
    "${CMAKE_BINARY_DIR}/InstallScripts/prerm"
)

# RPM (Fedora) Specific
set(CPACK_RPM_PACKAGE_LICENSE "GNU GPL v3")
set(CPACK_RPM_PACKAGE_RELEASE "1")
set(CPACK_RPM_PACKAGE_AUTOREQ "YES")
set(CPACK_RPM_PACKAGE_PACKAGER "Sandeep")
set(CPACK_RPM_POST_INSTALL_SCRIPT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/InstallScripts/postinst.sh")
set(CPACK_RPM_POST_UNINSTALL_SCRIPT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/InstallScripts/prerm.sh")


include(CPack)

# creating DEB package CMAKE commands
#[[

rm -rf build
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
cd build
cpack -G DEB

// Install & Test
sudo dpkg -i qtqmlprojcalc_0.1.0_amd64.deb

// force uninstall
sudo dpkg --purge qtqmlprojcalc

]]


# creating RPM package CMAKE commands
#[[

rm -rf build
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
cd build
cpack -G RPM

// Verify Scripts (Optional but helpful)
// This will show you the %post and %postun logic inside the RPM
rpm -qp --scripts qtqmlprojcalc-0.1.0-Linux.rpm

// Install & Test
sudo dnf install ./qtqmlprojcalc-0.1.0-Linux.rpm

// Uninstall (To test the cleanup)
sudo dnf remove qtqmlprojcalc

]]
