use v6.c;

use NativeCall;

use GLib::Raw::Exports;
use GIO::Raw::Exports;
use ATSPI::Raw::Exports;

my constant forced = 61;

unit package GEGL::Raw::Types;

need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Struct_Subs;
need GLib::Raw::Subs;
need GLib::Roles::Pointers;
need GLib::Roles::Implementor;
need GIO::Raw::Definitions;
need GIO::Raw::Enums;
need GIO::Raw::Quarks;
need GIO::Raw::Structs;
need GIO::Raw::Subs;
need GIO::DBus::Raw::Types;
need GIO::Raw::Exports;
need ATSPI::Raw::Definitions;
need ATSPI::Raw::Enums;
need ATSPI::Raw::Structs;

BEGIN {
  glib-re-export($_) for |@glib-exports,
                         |@gio-exports,
                         |@atspi-exports;
}
