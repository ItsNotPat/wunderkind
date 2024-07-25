//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <wunderkind/wunderkind_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) wunderkind_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WunderkindPlugin");
  wunderkind_plugin_register_with_registrar(wunderkind_registrar);
}
