use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;
use ATSPI::Raw::Structs;

unit package ATSPI::Raw::StateSet;

### /usr/include/at-spi-2.0/atspi/atspi-stateset.h

sub atspi_state_set_add (
  AtspiStateSet  $set,
  AtspiStateType $state
)
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_compare (
  AtspiStateSet $set,
  AtspiStateSet $set2
)
  returns AtspiStateSet
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_contains (
  AtspiStateSet  $set,
  AtspiStateType $state
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_equals (
  AtspiStateSet $set,
  AtspiStateSet $set2
)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_get_states (AtspiStateSet $set)
  returns GArray
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_is_empty (AtspiStateSet $set)
  returns uint32
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_new (GArray $states)
  returns AtspiStateSet
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_remove (
  AtspiStateSet  $set,
  AtspiStateType $state
)
  is      native(atspi)
  is      export
{ * }

sub atspi_state_set_set_by_name (
  AtspiStateSet $set,
  Str           $name,
  gboolean      $enabled
)
  is      native(atspi)
  is      export
{ * }
