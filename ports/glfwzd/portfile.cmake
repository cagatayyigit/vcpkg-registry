vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO cagatayyigit/glfw
  REF 21b7b1c6c65f8b91e40fb6f1fe0dbf0da280d3c3
  SHA512 0
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)