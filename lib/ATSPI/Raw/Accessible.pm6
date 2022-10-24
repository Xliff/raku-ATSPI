use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Accessible;

### /usr/include/at-spi-2.0/atspi/atspi-accessible.h

sub atspi_accessible_clear_cache (AtspiAccessible $obj)
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_accessible_id (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_action (AtspiAccessible $obj)
  returns AtspiAction
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_action_iface (AtspiAccessible $obj)
  returns AtspiAction
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_application (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_atspi_version (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_attributes (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns GHashTable
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_attributes_as_array (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns GArray
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_child_at_index (
  AtspiAccessible         $obj,
  gint                    $child_index,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_child_count (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_collection (AtspiAccessible $obj)
  returns AtspiCollection
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_collection_iface (AtspiAccessible $obj)
  returns AtspiCollection
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_component (AtspiAccessible $obj)
  returns AtspiComponent
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_component_iface (AtspiAccessible $obj)
  returns AtspiComponent
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_description (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_document (AtspiAccessible $obj)
  returns AtspiDocument
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_document_iface (AtspiAccessible $obj)
  returns AtspiDocument
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_editable_text (AtspiAccessible $obj)
  returns AtspiEditableText
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_editable_text_iface (AtspiAccessible $obj)
  returns AtspiEditableText
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_hyperlink (AtspiAccessible $obj)
  returns AtspiHyperlink
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_hypertext (AtspiAccessible $obj)
  returns AtspiHypertext
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_hypertext_iface (AtspiAccessible $obj)
  returns AtspiHypertext
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_id (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_image (AtspiAccessible $obj)
  returns AtspiImage
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_image_iface (AtspiAccessible $obj)
  returns AtspiImage
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_index_in_parent (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_interfaces (AtspiAccessible $obj)
  returns GArray
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_localized_role_name (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_name (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_object_locale (
  AtspiAccessible         $accessible,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_parent (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_process_id (
  AtspiAccessible         $accessible,
  CArray[Pointer[GError]] $error
)
  returns guint
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_relation_set (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns GArray
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_role (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns AtspiRole
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_role_name (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_selection (AtspiAccessible $obj)
  returns AtspiSelection
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_selection_iface (AtspiAccessible $obj)
  returns AtspiSelection
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_state_set (AtspiAccessible $obj)
  returns AtspiStateSet
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_table (AtspiAccessible $obj)
  returns AtspiTable
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_table_cell (AtspiAccessible $obj)
  returns AtspiTableCell
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_table_iface (AtspiAccessible $obj)
  returns AtspiTable
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_text (AtspiAccessible $obj)
  returns AtspiText
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_text_iface (AtspiAccessible $obj)
  returns AtspiText
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_toolkit_name (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_toolkit_version (
  AtspiAccessible         $obj,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_type ()
  returns GType
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_value (AtspiAccessible $obj)
  returns AtspiValue
  is native(atspi)
  is export
{ * }

sub atspi_accessible_get_value_iface (AtspiAccessible $obj)
  returns AtspiValue
  is native(atspi)
  is export
{ * }

sub atspi_accessible_set_cache_mask (
  AtspiAccessible $accessible,
  AtspiCache      $mask
)
  is native(atspi)
  is export
{ * }
