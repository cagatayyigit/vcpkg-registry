vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO cagatayyigit/glfwzd
  REF 4c61f025efb723c6e6b296da7fc6b1595684bb2b
  SHA512 96a5a9ad52ff1e05b54b0ce3cf903bc27638247e45d8242d2f358dc81ed3a58dd649a38550528de6dc332b4e6644134cfe58965ce0f1b08ab3ff4578e69a9b9a
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