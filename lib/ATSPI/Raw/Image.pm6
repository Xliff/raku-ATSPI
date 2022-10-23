use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Image;

### /usr/include/at-spi-2.0/atspi/atspi-image.h

sub atspi_image_get_image_description (
  AtspiImage              $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_image_get_image_extents (
  AtspiImage              $obj,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns AtspiRect
  is      native(atspi)
  is      export
{ * }

sub atspi_image_get_image_locale (
  AtspiImage              $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_image_get_image_position (
  AtspiImage              $obj,
  AtspiCoordType          $ctype,
  CArray[Pointer[GError]] $error
)
  returns AtspiPoint
  is      native(atspi)
  is      export
{ * }

sub atspi_image_get_image_size (
  AtspiImage              $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiPoint
  is      native(atspi)
  is      export
{ * }

sub atspi_image_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
