use v6.c;

use GLib::Raw::Definitions;
use ATSPI::Raw::Definitions;

unit package ATSPI::Raw::Geometry;

### /usr/include/at-spi-2.0/atspi/atspi-component.h

sub atspi_point_copy (
  AtspiPoint $src
)
  returns AtspiPoint
  is      native(atspi)
  is      export
{ * }

sub atspi_point_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_rect_copy (
  AtspiRect $src
)
  returns AtspiRect
  is      native(atspi)
  is      export
{ * }

sub atspi_rect_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
