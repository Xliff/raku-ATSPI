use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Structs;

### /usr/include/at-spi-2.0/atspi/atspi-selection.h

sub atspi_selection_clear_selection (
  AtspiSelection          $obj,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_deselect_child (
  AtspiSelection          $obj,
  gint                    $child_index,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_deselect_selected_child (
  AtspiSelection          $obj,
  gint                    $selected_child_index,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_get_n_selected_children (
  AtspiSelection          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_get_selected_child (
  AtspiSelection          $obj,
  gint                    $selected_child_index,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_is_child_selected (
  AtspiSelection          $obj,
  gint                    $child_index,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_select_all (
  AtspiSelection          $obj,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_selection_select_child (
  AtspiSelection          $obj,
  gint                    $child_index,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
