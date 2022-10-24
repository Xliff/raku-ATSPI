use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::Collection;

### /usr/include/at-spi-2.0/atspi/atspi-collection.h

sub atspi_collection_get_active_descendant (
  AtspiCollection         $collection,
  CArray[Pointer[GError]] $error
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_collection_get_matches (
  AtspiCollection          $collection,
  AtspiMatchRule           $rule,
  AtspiCollectionSortOrder $sortby,
  gint                     $count,
  gboolean                 $traverse,
  CArray[Pointer[GError]]  $error
)
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_collection_get_matches_from (
  AtspiCollection                  $collection,
  AtspiAccessible                  $current_object,
  AtspiMatchRule                   $rule,
  AtspiCollectionSortOrder         $sortby,
  AtspiCollectionTreeTraversalType $tree,
  gint                             $count,
  gboolean                         $traverse,
  CArray[Pointer[GError]]          $error
)
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_collection_get_matches_to (
  AtspiCollection                  $collection,
  AtspiAccessible                  $current_object,
  AtspiMatchRule                   $rule,
  AtspiCollectionSortOrder         $sortby,
  AtspiCollectionTreeTraversalType $tree,
  gboolean                         $limit_scope,
  gint                             $count,
  gboolean                         $traverse,
  CArray[Pointer[GError]]          $error
)
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_collection_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_collection_is_ancestor_of (
  AtspiCollection         $collection,
  AtspiAccessible         $test,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(atspi)
  is      export
{ * }
