use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Component;

### /usr/include/at-spi-2.0/atspi/atspi-component.h

sub atspi_component_contains (
  AtspiComponent          $obj,
  gint                    $x,
  gint                    $y,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_accessible_at_point (
  AtspiComponent          $obj,
  gint                    $x,
  gint                    $y,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_alpha (
  AtspiComponent          $obj,
  CArray[Pointer[GError]] $error
)
  returns gdouble
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_extents (
  AtspiComponent          $obj,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns AtspiRect
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_layer (
  AtspiComponent          $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiComponentLayer
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_mdi_z_order (
  AtspiComponent          $obj,
  CArray[Pointer[GError]] $error
)
  returns gshort
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_position (
  AtspiComponent          $obj,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns AtspiPoint
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_size (
  AtspiComponent          $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiPoint
  is      native(atspi)
  is      export
{ * }

sub atspi_component_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_component_grab_focus (
  AtspiComponent          $obj,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_component_scroll_to (
  AtspiComponent          $obj,
  AtspiScrollType         $type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_component_scroll_to_point (
  AtspiComponent          $obj,
  AtspiCoordType          $coords,
  gint                    $x,
  gint                    $y,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_component_set_extents (
  AtspiComponent          $obj,
  gint                    $x,
  gint                    $y,
  gint                    $width,
  gint                    $height,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_component_set_position (
  AtspiComponent          $obj,
  gint                    $x,
  gint                    $y,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_component_set_size (
  AtspiComponent          $obj,
  gint                    $width,
  gint                    $height,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
