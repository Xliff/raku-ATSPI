  method atspi_deregister_device_event_listener (
    AtspiDeviceListener     $listener,
    Pointer                 $filter,
    CArray[Pointer[GError]] $error
  ) {
    atspi_deregister_device_event_listener($!ar, $filter, $error);
  }

  method atspi_deregister_keystroke_listener (
    AtspiDeviceListener     $listener,
    GArray                  $key_set,
    AtspiKeyMaskType        $modmask,
    AtspiKeyEventMask       $event_types,
    CArray[Pointer[GError]] $error
  ) {
    atspi_deregister_keystroke_listener($!ar, $key_set, $modmask, $event_types, $error);
  }

  method atspi_generate_keyboard_event (
    glong                   $keyval,
    Str                     $keystring,
    AtspiKeySynthType       $synth_type,
    CArray[Pointer[GError]] $error
  ) {
    atspi_generate_keyboard_event($!ar, $keystring, $synth_type, $error);
  }

  method atspi_generate_mouse_event (
    glong                   $x,
    glong                   $y,
    Str                     $name,
    CArray[Pointer[GError]] $error
  ) {
    atspi_generate_mouse_event($!ar, $y, $name, $error);
  }

  method atspi_get_desktop {
    atspi_get_desktop($!ar);
  }

  method atspi_get_desktop_count {
    atspi_get_desktop_count($!ar);
  }

  method atspi_get_desktop_list {
    atspi_get_desktop_list($!ar);
  }

  method atspi_key_definition_get_type {
    atspi_key_definition_get_type();
  }

  method atspi_register_device_event_listener (
    AtspiDeviceListener     $listener,
    AtspiDeviceEventMask    $event_types,
    Pointer                 $filter,
    CArray[Pointer[GError]] $error
  ) {
    atspi_register_device_event_listener($!ar, $event_types, $filter, $error);
  }

  method atspi_register_keystroke_listener (
    AtspiDeviceListener      $listener,
    GArray                   $key_set,
    AtspiKeyMaskType         $modmask,
    AtspiKeyEventMask        $event_types,
    AtspiKeyListenerSyncType $sync_type,
    CArray[Pointer[GError]]  $error
  ) {
    atspi_register_keystroke_listener($!ar, $key_set, $modmask, $event_types, $sync_type, $error);
  }

  method atspi_set_reference_window {
    atspi_set_reference_window($!ar);
  }

