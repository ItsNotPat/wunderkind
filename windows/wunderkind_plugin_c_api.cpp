#include "include/wunderkind/wunderkind_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "wunderkind_plugin.h"

void WunderkindPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  wunderkind::WunderkindPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
