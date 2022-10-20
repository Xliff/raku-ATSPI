use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ATSPI::Raw::Definitions;

unit package ATSPI::Raw::EventListener;

### /usr/include/at-spi-2.0/atspi/atspi-event-listener.h

sub atspi_event_get_type ()
  returns GType
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_deregister (
  AtspiEventListener      $listener,
  Str                     $event_type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_deregister_from_callback (
                          &callback (AtspiEvent, gpointer),
  Pointer                 $user_data,
  Str                     $event_type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_deregister_no_data (
                          &callback (AtspiEvent),
  Str                     $event_type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_get_type ()
  returns GType
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_new (
          &callback (AtspiEvent, gpointer),
  gpointer $user_data,
           &callback_destroyed (gpointer)
)
  returns AtspiEventListener
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_new_simple (
  &callback (AtspiEvent),
  &callback_destroyed (gpointer)
)
  returns AtspiEventListener
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_register (
  AtspiEventListener      $listener,
  Str                     $event_type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_register_from_callback (
                          &callback (AtspiEvent, gpointer),
  Pointer                 $user_data,
                          &callback_destroyed (gpointer),
  Str                     $event_type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_register_from_callback_full (
                          &callback (AtspiEvent, gpointer),
  Pointer                 $user_data,
                          &callback_destroyed (gpointer),
  Str                     $event_type,
  GArray                  $properties,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_register_full (
  AtspiEventListener      $listener,
  Str                     $event_type,
  GArray                  $properties,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }

sub atspi_event_listener_register_no_data (
                          &callback (AtspiEvent),
                          &callback_destroyed (gpointer),
  Str                     $event_type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(atspi)
  is export
{ * }
