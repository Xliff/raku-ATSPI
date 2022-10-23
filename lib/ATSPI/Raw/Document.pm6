use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Document;

### /usr/include/at-spi-2.0/atspi/atspi-document.h

sub atspi_document_get_attribute_value (
  AtspiDocument           $obj,
  Str                     $attribute,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_document_get_attributes (
  AtspiDocument           $obj,
  CArray[Pointer[GError]] $error
)
  returns GHashTable
  is      native(atspi)
  is      export
{ * }

sub atspi_document_get_current_page_number (
  AtspiDocument           $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_document_get_document_attribute_value (
  AtspiDocument           $obj,
  Str                     $attribute,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_document_get_document_attributes (
  AtspiDocument           $obj,
  CArray[Pointer[GError]] $error
)
  returns GHashTable
  is      native(atspi)
  is      export
{ * }

sub atspi_document_get_locale (
  AtspiDocument           $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(atspi)
  is      export
{ * }

sub atspi_document_get_page_count (
  AtspiDocument           $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_document_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
