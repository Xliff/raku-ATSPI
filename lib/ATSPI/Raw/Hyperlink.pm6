use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Structs;

### /usr/include/at-spi-2.0/atspi/atspi-hyperlink.h


sub atspi_hyperlink_get_end_index (
  AtspiHyperlink          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_hyperlink_get_index_range (
  AtspiHyperlink          $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiRange
  is      native(atspi)
  is      export
{ * }

sub atspi_hyperlink_get_n_anchors (
  AtspiHyperlink          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_hyperlink_get_object (
  AtspiHyperlink          $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_hyperlink_get_start_index (
  AtspiHyperlink          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_hyperlink_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_hyperlink_get_uri (
  AtspiHyperlink          $obj,
  gint                    $i,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_hyperlink_is_valid (
  AtspiHyperlink          $obj,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
