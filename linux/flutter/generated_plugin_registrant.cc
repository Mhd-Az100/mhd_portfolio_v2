//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <custom_mouse_cursor/custom_mouse_cursor_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) custom_mouse_cursor_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CustomMouseCursorPlugin");
  custom_mouse_cursor_plugin_register_with_registrar(custom_mouse_cursor_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
