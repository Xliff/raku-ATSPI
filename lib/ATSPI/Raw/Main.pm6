use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;

unit package ATSPI::Raw::Main;

### /usr/include/at-spi-2.0/atspi/atspi-misc.h

sub atspi_event_main
  is      native(atspi)
  is      export
{ * }

sub atspi_event_quit
  is      native(atspi)
  is      export
{ * }

sub atspi_exit
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_get_a11y_bus
  returns GDBusConnection
  is      native(atspi)
  is      export
{ * }

sub atspi_init
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_is_initialized
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_role_get_name (AtspiRole $role)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_set_main_context (
  GMainContext $cnx
)
  is      native(atspi)
  is      export
{ * }

sub atspi_set_timeout (
  gint $val,
  gint $startup_time
)
  is      native(atspi)
  is      export
{ * }
