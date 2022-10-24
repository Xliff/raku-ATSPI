use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::EditableText;

### /usr/include/at-spi-2.0/atspi/atspi-editabletext.h

sub atspi_editable_text_copy_text (
  AtspiEditableText       $obj,
  gint                    $start_pos,
  gint                    $end_pos,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_editable_text_cut_text (
  AtspiEditableText       $obj,
  gint                    $start_pos,
  gint                    $end_pos,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_editable_text_delete_text (
  AtspiEditableText       $obj,
  gint                    $start_pos,
  gint                    $end_pos,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_editable_text_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_editable_text_insert_text (
  AtspiEditableText       $obj,
  gint                    $position,
  Str                     $text,
  gint                    $length,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_editable_text_paste_text (
  AtspiEditableText       $obj,
  gint                    $position,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_editable_text_set_attributes (
  AtspiEditableText       $obj,
  Str                     $attributes,
  gint                    $start_pos,
  gint                    $end_pos,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_editable_text_set_text_contents (
  AtspiEditableText       $obj,
  Str                     $new_contents,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
