use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;

unit package ATSPI::Raw::Value;

### /usr/include/at-spi-2.0/atspi/atspi-value.h

sub atspi_value_get_current_value (
  AtspiValue              $obj,
  CArray[Pointer[GError]] $error
)
  returns gdouble
  is      native(atspi)
  is      export
{ * }

sub atspi_value_get_maximum_value (
  AtspiValue              $obj,
  CArray[Pointer[GError]] $error
)
  returns gdouble
  is      native(atspi)
  is      export
{ * }

sub atspi_value_get_minimum_increment (
  AtspiValue              $obj,
  CArray[Pointer[GError]] $error
)
  returns gdouble
  is      native(atspi)
  is      export
{ * }

sub atspi_value_get_minimum_value (
  AtspiValue              $obj,
  CArray[Pointer[GError]] $error
)
  returns gdouble
  is      native(atspi)
  is      export
{ * }

sub atspi_value_get_text (
  AtspiValue              $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_value_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_value_set_current_value (
  AtspiValue              $obj,
  gdouble                 $new_value,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
