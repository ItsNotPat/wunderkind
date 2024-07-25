#ifndef FLUTTER_PLUGIN_WUNDERKIND_PLUGIN_H_
#define FLUTTER_PLUGIN_WUNDERKIND_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace wunderkind {

class WunderkindPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WunderkindPlugin();

  virtual ~WunderkindPlugin();

  // Disallow copy and assign.
  WunderkindPlugin(const WunderkindPlugin&) = delete;
  WunderkindPlugin& operator=(const WunderkindPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace wunderkind

#endif  // FLUTTER_PLUGIN_WUNDERKIND_PLUGIN_H_
