use v6.c;

unit package ATSPI::Raw::Exports;

our @atspi-exports is export;

BEGIN {
  @atspi-exports = <
    ATSPI::Raw::Definitions
    ATSPI::Raw::Enums
    ATSPI::Raw::Structs
  >;
}
