vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO cagatayyigit/glfw
  REF 21b7b1c6c65f8b91e40fb6f1fe0dbf0da280d3c3
  SHA512 3d614f8b2bd0b31bb4d3a5f78f8224197a8ed8183a406dcae96b9548a3c23c2da2a36556758aa9336bbbb8140631636555163a866dc349832b68b12772c46fa9
  HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    wayland         GLFW_USE_WAYLAND
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DGLFW_BUILD_EXAMPLES=OFF
        -DGLFW_BUILD_TESTS=OFF
        -DGLFW_BUILD_DOCS=OFF
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/glfw3)

vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

vcpkg_copy_pdbs()