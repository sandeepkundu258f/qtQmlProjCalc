cmake_minimum_required(VERSION 3.16)

project(QtQMLProj VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appQtQMLProj
    main.cpp
)

qt_add_qml_module(appQtQMLProj
    URI QtQMLProj
    QML_FILES
        Main.qml
        RESOURCES qtqmlproj.desktop
        RESOURCES .gitignore
        RESOURCES
        RESOURCES Icons/developer128.png Icons/developer16.png Icons/developer256.png
        RESOURCES
        RESOURCES InstallScripts/postinst.sh
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtQMLProj PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtQMLProj
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtQMLProj
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQtQMLProj
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# --- DEPLOYMENT & PACKAGING SECTION (Must be at the bottom) ---

# 1. Standard Install
install(TARGETS appQtQMLProj
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# 2. Generate QML Deployment Script (Using Qt 6.10+ syntax)
qt_generate_deploy_qml_app_script(
    TARGET appQtQMLProj
    OUTPUT_SCRIPT deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)

# 3. Run the script during installation
install(SCRIPT ${deploy_script})

# Adding Debian control files
# Copy and rename the script to the build directory (without the .sh)
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/InstallScripts/postinst.sh" "${CMAKE_BINARY_DIR}/InstallScripts/postinst" COPYONLY)

# Point CPack to the renamed file in the build directory
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_BINARY_DIR}/InstallScripts/postinst")

# Use an absolute path to bypass the /opt/qtqmlproj prefix
install(FILES qtqmlproj.desktop
        DESTINATION /usr/share/applications)

# Install the icon to the system icon cache
# This ensures Linux can find it by name
install(FILES Icons/developer256.png
        DESTINATION /usr/share/icons/hicolor/256x256/apps/
        RENAME qtqmlproj-icon.png)
install(FILES Icons/developer128.png
        DESTINATION /usr/share/icons/hicolor/128x128/apps/
        RENAME qtqmlproj-icon.png)
install(FILES Icons/developer16.png
        DESTINATION /usr/share/icons/hicolor/16x16/apps/
        RENAME qtqmlproj-icon.png)

# --- CPACK CONFIG ---
set(CPACK_GENERATOR "DEB")
set(CPACK_PACKAGE_NAME "qtqmlproj")
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Sandeep <sandeepkundu258@gmail.com>")
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/qtqmlproj")

# Add the missing xcb-cursor library to the dependencies
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libxcb-cursor0, libc6, libstdc++6")

# Description for the installer window
# set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "This is my custom application description that will show in the installer.")

# The first line is the summary, following lines are the long description
set(CPACK_PACKAGE_DESCRIPTION "QtQmlProj: A Professional UML Tool
 This application provides a comprehensive suite of tools for
 designing and visualizing QML-based architectures.
 .
 Features:
  - Real-time QML rendering
  - UML diagramming components
  - Export to multiple formats")

# Define app version:
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0")
# This combines them for the installer UI
set(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")

include(CPack)

# creating DEB package CMAKE commands
#[[

rm -rf build
qt-cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
cd build
cpack -G DEB

]]
