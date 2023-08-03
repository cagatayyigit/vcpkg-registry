vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO cagatayyigit/glfwzd
  REF 4c61f025efb723c6e6b296da7fc6b1595684bb2b
  SHA512 f484d355a8e838cd1c0f1377c676496149e5bfbf0c0016e174591e8b42c0a8ccbfc65941e9d114348d72853b71f166014fd68eb66463ef9080067d949ab73359
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/glfw3)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.md"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)