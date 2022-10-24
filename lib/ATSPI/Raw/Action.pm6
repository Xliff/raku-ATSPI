use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;

unit package ATSPI::Raw::Action;

### /usr/include/at-spi-2.0/atspi/atspi-action.h

sub atspi_action_do_action (
  AtspiAction             $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_action_description (
  AtspiAction             $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_action_name (
  AtspiAction             $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_description (
  AtspiAction             $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_key_binding (
  AtspiAction             $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_localized_name (
  AtspiAction             $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_n_actions (
  AtspiAction             $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_name (
  AtspiAction             $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_action_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
