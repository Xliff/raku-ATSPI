use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;

use GLib::Roles::Pointers;

unit package ATSPI::Raw::Structs;

class AtspiApplication is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS GObject         $.parent;
  has GHashTable      $!hash;
  has Str             $!bus_name;
  has DBusConnection  $!bus;
  has AtspiAccessible $!root;
  has AtspiCache      $.cache             is rw;
  has Str             $!toolkit_name;
  has Str             $!toolkit_version;
  has Str             $!atspi_version;
  HAS timeval         $.time_added;

  method cache-enum is also<cache_enum> {
    AtspiCacheEnum( $!cache );
  }

  method hash is rw {
    Proxy.new:
      FETCH => -> $     { $!hash },
      STORE => -> $, \v { $!hash := v };
  }

  method bus_name is rw {
    Proxy.new:
      FETCH => -> $     { $!bus_name },
      STORE => -> $, \v { $!bus_name := v };
  }

  method bus is rw {
    Proxy.new:
      FETCH => -> $     { $!bus },
      STORE => -> $, \v { $!bus := v };
  }

  method root is rw {
    Proxy.new:
      FETCH => -> $     { $!root },
      STORE => -> $, \v { $!root := v };
  }

  method toolkit_name is rw {
    Proxy.new:
      FETCH => -> $     { $!toolkit_name },
      STORE => -> $, \v { $!toolkit_name := v };
  }

  method toolkit_version is rw {
    Proxy.new:
      FETCH => -> $     { $!toolkit_version },
      STORE => -> $, \v { $!toolkit_version := v };
  }

  method atspi_version is rw {
    Proxy.new:
      FETCH => -> $     { $!atspi_version },
      STORE => -> $, \v { $!atspi_version := v };
  }

}
