use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::TableCell;

### /usr/include/at-spi-2.0/atspi/atspi-table-cell.h

sub atspi_table_cell_get_column_header_cells (
  AtspiTableCell          $obj,
  CArray[Pointer[GError]] $error
)
  returns GPtrArray
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_column_index (
  AtspiTableCell          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_column_span (
  AtspiTableCell          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_position (
  AtspiTableCell          $obj,
  gint                    $row    is rw,
  gint                    $column is rw,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_row_column_span (
  AtspiTableCell          $obj,
  gint                    $row         is rw,
  gint                    $column      is rw,
  gint                    $row_span    is rw,
  gint                    $column_span is rw,
  CArray[Pointer[GError]] $error
)
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_row_header_cells (
  AtspiTableCell          $obj,
  CArray[Pointer[GError]] $error
)
  returns GPtrArray
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_row_span (
  AtspiTableCell          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_table (
  AtspiTableCell          $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_table_cell_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
