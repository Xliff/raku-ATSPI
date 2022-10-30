use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Device;

### /usr/include/at-spi-2.0/atspi/atspi-device.h

sub atspi_device_add_key_grab (
  AtspiDevice        $device,
  AtspiKeyDefinition $kd,
                     &callback (
                       AtspiDevice,
                       gboolean,
                       gint,
                       gint,
                       gint,
                       Str,
                       gpointer
                     ),
  Pointer            $user_data,
  GDestroyNotify     $callback_destroyed
)
  returns guint
  is      native(atspi)
  is      export
{ * }

sub atspi_device_add_key_watcher (
  AtspiDevice      $device,
                   &callback (
                     AtspiDevice,
                     gboolean,
                     gint,
                     gint,
                     gint,
                     Str,
                     gpointer
                   ),
  Pointer          $user_data,
  GDestroyNotify   $callback_destroyed
)
  is      native(atspi)
  is      export
{ * }

sub atspi_device_get_grab_by_id (AtspiDevice $device, guint $id)
  returns AtspiKeyDefinition
  is      native(atspi)
  is      export
{ * }

sub atspi_device_get_locked_modifiers (AtspiDevice $device)
  returns guint
  is      native(atspi)
  is      export
{ * }

sub atspi_device_get_modifier (
  AtspiDevice $device,
  gint        $keycode
)
  returns guint
  is      native(atspi)
  is      export
{ * }

sub atspi_device_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_device_grab_keyboard (AtspiDevice $device)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_device_map_modifier (
  AtspiDevice $device,
  gint        $keycode
)
  returns guint
  is      native(atspi)
  is      export
{ * }

sub atspi_device_new
  returns AtspiDevice
  is      native(atspi)
  is      export
{ * }

sub atspi_device_notify_key (
  AtspiDevice $device,
  gboolean    $pressed,
  gint        $keycode,
  gint        $keysym,
  gint        $state,
  Str         $text
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_device_remove_key_grab (AtspiDevice $device, guint $id)
  is      native(atspi)
  is      export
{ * }

sub atspi_device_ungrab_keyboard (AtspiDevice $device)
  is      native(atspi)
  is      export
{ * }

sub atspi_device_unmap_modifier (AtspiDevice $device, gint $keycode)
  is      native(atspi)
  is      export
{ * }
