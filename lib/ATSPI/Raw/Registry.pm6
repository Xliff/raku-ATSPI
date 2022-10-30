use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Reference;

### /usr/include/at-spi-2.0/atspi/atspi-registry.h

sub atspi_deregister_device_event_listener (
  AtspiDeviceListener     $listener,
  Pointer                 $filter,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_deregister_keystroke_listener (
  AtspiDeviceListener     $listener,
  GArray                  $key_set,
  AtspiKeyMaskType        $modmask,
  AtspiKeyEventMask       $event_types,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_generate_keyboard_event (
  glong                   $keyval,
  Str                     $keystring,
  AtspiKeySynthType       $synth_type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_generate_mouse_event (
  glong                   $x,
  glong                   $y,
  Str                     $name,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_get_desktop (gint $i)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_get_desktop_count
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_get_desktop_list
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_key_definition_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_register_device_event_listener (
  AtspiDeviceListener     $listener,
  AtspiDeviceEventMask    $event_types,
  Pointer                 $filter,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_register_keystroke_listener (
  AtspiDeviceListener      $listener,
  GArray                   $key_set,
  AtspiKeyMaskType         $modmask,
  AtspiKeyEventMask        $event_types,
  AtspiKeyListenerSyncType $sync_type,
  CArray[Pointer[GError]]  $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_set_reference_window (AtspiAccessible $accessible)
  is      native(atspi)
  is      export
{ * }
