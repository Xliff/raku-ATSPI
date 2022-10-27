use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Enums;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::DeviceListener;

### /usr/include/at-spi-2.0/atspi/atspi-device-listener.h

sub atspi_device_listener_add_callback (
  AtspiDeviceListener $listener,
                      &callback (AtspiDeviceEvent, gpointer --> gboolean),
  GDestroyNotify      $callback_destroyed,
  Pointer             $user_data
)
  is      native(atspi)
  is      export
{ * }

sub atspi_device_listener_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_device_listener_new (
                 &callback (AtspiDeviceEvent, gpointer --> gboolean),
  Pointer        $user_data,
  GDestroyNotify $callback_destroyed
)
  returns AtspiDeviceListener
  is      native(atspi)
  is      export
{ * }

sub atspi_device_listener_new_simple (
                 &callback (AtspiDeviceEvent --> gboolean),
  GDestroyNotify $callback_destroyed
)
  returns AtspiDeviceListener
  is      native(atspi)
  is      export
{ * }

sub atspi_device_listener_remove_callback (
  AtspiDeviceListener $listener,
                      &callback (AtspiDeviceEvent, gpointer --> gboolean)
)
  is      native(atspi)
  is      export
{ * }
