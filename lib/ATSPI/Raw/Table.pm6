use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Table;

### /usr/include/at-spi-2.0/atspi/atspi-table.h

sub atspi_table_add_column_selection (
  AtspiTable              $obj,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_table_add_row_selection (
  AtspiTable              $obj,
  gint                    $row,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_accessible_at (
  AtspiTable              $obj,
  gint                    $row,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_caption (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_column_at_index (
  AtspiTable              $obj,
  gint                    $index,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_column_description (
  AtspiTable              $obj,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_column_extent_at (
  AtspiTable              $obj,
  gint                    $row,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_column_header (
  AtspiTable              $obj,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_index_at (
  AtspiTable              $obj,
  gint                    $row,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_n_columns (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_n_rows (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_n_selected_columns (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_n_selected_rows (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_row_at_index (
  AtspiTable              $obj,
  gint                    $index,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_row_column_extents_at_index (
  AtspiTable              $obj,
  gint                    $index,
  gint                    $row         is rw,
  gint                    $col         is rw,
  gint                    $row_extents is rw,
  gint                    $col_extents is rw,
  gboolean                $is_selected,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_row_description (
  AtspiTable              $obj,
  gint                    $row,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_row_extent_at (
  AtspiTable              $obj,
  gint                    $row,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_row_header (
  AtspiTable              $obj,
  gint                    $row,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_selected_columns (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_selected_rows (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_summary (
  AtspiTable              $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_table_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_table_is_column_selected (
  AtspiTable              $obj,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_table_is_row_selected (
  AtspiTable              $obj,
  gint                    $row,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_table_is_selected (
  AtspiTable              $obj,
  gint                    $row,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_table_remove_column_selection (
  AtspiTable              $obj,
  gint                    $column,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_table_remove_row_selection (
  AtspiTable              $obj,
  gint                    $row,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
