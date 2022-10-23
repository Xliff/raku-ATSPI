use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Text;

### /usr/include/at-spi-2.0/atspi/atspi-text.h

sub atspi_text_add_selection (
  AtspiText               $obj,
  gint                    $start_offset,
  gint                    $end_offset,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_range_copy (AtspiRange $src)
  returns AtspiRange
  is      native(atspi)
  is      export
{ * }

sub atspi_range_get_type ()
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_attribute_run (
  AtspiText               $obj,
  gint                    $offset,
  gboolean                $include_defaults,
  gint                    $start_offset      is rw,
  gint                    $end_offset        is rw,
  CArray[Pointer[GError]] $error
)
  returns GHashTable
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_attribute_value (
  AtspiText               $obj,
  gint                    $offset,
  Str                     $attribute_name,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_attributes (
  AtspiText               $obj,
  gint                    $offset,
  gint                    $start_offset is rw,
  gint                    $end_offset   is rw,
  CArray[Pointer[GError]] $error
)
  returns GHashTable
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_bounded_ranges (
  AtspiText               $obj,
  gint                    $x,
  gint                    $y,
  gint                    $width,
  gint                    $height,
  AtspiCoordType          $type,
  AtspiTextClipType       $clipTypeX,
  AtspiTextClipType       $clipTypeY,
  CArray[Pointer[GError]] $error
)
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_caret_offset (
  AtspiText               $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_character_at_offset (
  AtspiText               $obj,
  gint                    $offset,
  CArray[Pointer[GError]] $error
)
  returns guint
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_character_count (
  AtspiText               $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_character_extents (
  AtspiText               $obj,
  gint                    $offset,
  AtspiCoordType          $type,
  CArray[Pointer[GError]] $error
)
  returns AtspiRect
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_default_attributes (
  AtspiText               $obj,
  CArray[Pointer[GError]] $error
)
  returns GHashTable
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_n_selections (
  AtspiText               $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_offset_at_point (
  AtspiText               $obj,
  gint                    $x,
  gint                    $y,
  AtspiCoordType          $type,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_range_extents (
  AtspiText               $obj,
  gint                    $start_offset,
  gint                    $end_offset,
  AtspiCoordType          $type,
  CArray[Pointer[GError]] $error
)
  returns AtspiRect
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_selection (
  AtspiText               $obj,
  gint                    $selection_num,
  CArray[Pointer[GError]] $error
)
  returns AtspiRange
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_string_at_offset (
  AtspiText               $obj,
  gint                    $offset,
  AtspiTextGranularity    $granularity,
  CArray[Pointer[GError]] $error
)
  returns AtspiTextRange
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_text (
  AtspiText               $obj,
  gint                    $start_offset,
  gint                    $end_offset,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_text_after_offset (
  AtspiText               $obj,
  gint                    $offset,
  AtspiTextBoundaryType   $type,
  CArray[Pointer[GError]] $error
)
  returns AtspiTextRange
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_text_at_offset (
  AtspiText               $obj,
  gint                    $offset,
  AtspiTextBoundaryType   $type,
  CArray[Pointer[GError]] $error
)
  returns AtspiTextRange
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_text_attribute_value (
  AtspiText               $obj,
  gint                    $offset,
  Str                     $attribute_name,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_text_attributes (
  AtspiText               $obj,
  gint                    $offset,
  gint                    $start_offset is rw,
  gint                    $end_offset   is rw,
  CArray[Pointer[GError]] $error
)
  returns GHashTable
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_text_before_offset (
  AtspiText               $obj,
  gint                    $offset,
  AtspiTextBoundaryType   $type,
  CArray[Pointer[GError]] $error
)
  returns AtspiTextRange
  is      native(atspi)
  is      export
{ * }

sub atspi_text_get_type ()
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_text_range_get_type ()
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_text_remove_selection (
  AtspiText               $obj,
  gint                    $selection_num,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_text_scroll_substring_to (
  AtspiText               $obj,
  gint                    $start_offset,
  gint                    $end_offset,
  AtspiScrollType         $type,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_text_scroll_substring_to_point (
  AtspiText               $obj,
  gint                    $start_offset,
  gint                    $end_offset,
  AtspiCoordType          $coords,
  gint                    $x,
  gint                    $y,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_text_set_caret_offset (
  AtspiText               $obj,
  gint                    $new_offset,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_text_set_selection (
  AtspiText               $obj,
  gint                    $selection_num,
  gint                    $start_offset,
  gint                    $end_offset,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
