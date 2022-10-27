use v6.c;

use Method::Also;
use NativeCall;

use GLib::Compat::Definitions;
use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Subs;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GIO::Raw::Structs;
use GIO::DBus::Raw::Types;
use ATSPI::Raw::Definitions;
use ATSPI::Raw::Enums;

use GLib::Roles::Pointers;

unit package ATSPI::Raw::Structs;

class AtspiAccessible
  is   repr<CStruct>
  does GLib::Roles::Pointers
  is   export
{ ... }

class AtspiApplication is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS GObject          $.parent;
  has GHashTable       $!hash;
  has Str              $!bus_name;
  has GDBusConnection  $!bus;
  has AtspiAccessible  $!root;
  has AtspiCache       $.cache             is rw;
  has Str              $!toolkit_name;
  has Str              $!toolkit_version;
  has Str              $!atspi_version;
  HAS timeval          $.time_added;

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

class AtspiObject is repr<CStruct> is export {
	HAS GObject          $.parent;
	has AtspiApplication $!app   ;
	has Str              $!path  ;

  method app is rw {
    Proxy.new:
      FETCH => -> $     { $!app },
      STORE => -> $, \v { $!app := v };
  }

  method path is rw {
    Proxy.new:
      FETCH => -> $     { $!path },
      STORE => -> $, \v { $!path := v };
  }
}

class AtspiStateSet is repr<CStruct> is export {
	HAS GObject          $.parent    ;
	has AtspiAccessible  $!accessible;
	has gint64           $!states    ;
}

class AtspiAccessible {
	HAS AtspiObject            $.parent           ;
	has AtspiAccessible        $!accessible_parent;
	has GPtrArray              $!children         ;
	has AtspiRole              $!role             ;
	has gint                   $!interfaces       ;
	has Str                   $!name             ;
	has Str                   $!description      ;
	has AtspiStateSet          $!states           ;
	has GHashTable             $!attributes       ;
	has guint                  $!cached_properties;
	has Pointer $!priv             ;
}

# class AtspiApplicationClass is repr<CStruct> is export {
# 	has GObjectClass $!parent_class;
# }

class AtspiDevice is repr<CStruct> is export {
	HAS GObject $.parent;
}

class AtspiDeviceEvent is repr<CStruct> is export {
	has AtspiEventType $!type;
	has guint          $.id            is rw;
	has gushort        $.hw_code       is rw;
	has gushort        $.modifiers     is rw;
	has guint          $.timestamp     is rw;
	has Str            $!event_string;
	has gboolean       $.is_text       is rw;

  method type(:$enum) is rw {
    Proxy.new:
      FETCH => -> $           { $enum ?? AtspiEventTypeEnum($!type)
                                      !! $!type },
      STORE => -> $, Int() \v { $!type = v; }
  }

  method event_string is also<event-string> is rw {
    Proxy.new:
      FETCH => -> $           { $!event_string },
      STORE => -> $, Str() \v { $!event_string := v };
  }

  method get_type {
    sub atspi_device_event_get_type
      returns GType
      is      native(atspi)
      is      export
    { * }
    
    atspi_device_event_get_type();
  }
}

class AtspiDeviceLegacy is repr<CStruct> is export {
	HAS AtspiDevice $.parent;
}

# class AtspiDeviceLegacyClass is repr<CStruct> is export {
# 	has AtspiDeviceClass $!parent_class;
# }

class AtspiDeviceListener is repr<CStruct> is export {
	HAS GObject $.parent   ;
	has guint   $!id       ;
	has GList   $!callbacks;
}

class AtspiEvent is repr<CStruct> is export {
	has Str             $.type    ;
	has AtspiAccessible $!source  ;
	has gint            $.detail1   is rw;
	has gint            $.detail2   is rw;
	has GValue          $!any_data;
	has AtspiAccessible $!sender  ;

  method source ( :$raw = False ) {
    propReturnObject($!source, $raw, |::('ATSPI::Accessible').getTypePair)
  }

  method any_data ( :$raw = False) is also<any-data> {
    propReturnObject($!any_data, $raw, |::('GLib::Value').getTypePair)
  }

  method sender ( :$raw = False ) {
    propReturnObject($!sender, $raw, |::('ATSPI::Accessible').getTypePair)
  }
}

class AtspiEventListener is repr<CStruct> is export {
	HAS GObject              $.parent      ;
	has Pointer $!callback    ; #= AtspiEventListenerCB
	has Pointer                 $!user_data   ;
	has Pointer        $!cb_destroyed; #= GDestroyNotify
}

# class AtspiEventListenerClass is repr<CStruct> is export {
# 	has GObjectClass $!parent_class;
# }

class AtspiEventListenerMode is repr<CStruct> is export {
	has gboolean $.synchronous;
	has gboolean $.preemptive ;
	has gboolean $.global     ;
}

class AtspiHyperlink is repr<CStruct> is export {
	HAS AtspiObject $.parent;
}

# class AtspiHyperlinkClass is repr<CStruct> is export {
# 	has AtspiObjectClass $!parent_class;
# }

class AtspiKeyDefinition is repr<CStruct> is export {
	has gint  $!keycode  ;
	has gint  $!keysym   ;
	has Str   $!keystring;
	has guint $!modifiers;
}

class AtspiKeySet is repr<CStruct> is export {
	has guint   $!keysyms   ;
	has gushort $!keycodes  ;
	has Str   $!keystrings;
	has gshort  $!len       ;
}

class AtspiMatchRule is repr<CStruct> is export {
	HAS GObject                  $.parent            ;
	has AtspiStateSet            $!states            ;
	has AtspiCollectionMatchType $!statematchtype    ;
	has GHashTable               $!attributes        ;
	has AtspiCollectionMatchType $!attributematchtype;
	has GArray                   $!interfaces        ;
	has AtspiCollectionMatchType $!interfacematchtype;
	has gint                     $!roles             ;
	has AtspiCollectionMatchType $!rolematchtype     ;
	has gboolean                 $!invert            ;
}

# class AtspiMatchRuleClass is repr<CStruct> is export {
# 	has GObjectClass $!parent_class;
# }

# class AtspiObjectClass is repr<CStruct> is export {
# 	has GObjectClass $!parent_class;
# }

class AtspiPoint is repr<CStruct> is export {
	has gint $.x is rw;
	has gint $.y is rw;
}

class AtspiRange is repr<CStruct> is export {
	has gint $.start_offset is rw;
	has gint $.end_offset   is rw;
}

class AtspiRect is repr<CStruct> is export {
	has gint $.x      is rw;
	has gint $.y      is rw;
	has gint $.width  is rw;
	has gint $.height is rw;
}

class AtspiRelation is repr<CStruct> is export {
	HAS GObject           $.parent       ;
	has AtspiRelationType $!relation_type;
	has GArray            $!targets      ;
}

# class AtspiRelationClass is repr<CStruct> is export {
# 	has GObjectClass $!parent_class;
# }

# class AtspiStateSetClass is repr<CStruct> is export {
# 	has GObjectClass $!parent_class;
# }

class AtspiTextRange is repr<CStruct> is export {
	has gint  $!start_offset;
	has gint  $!end_offset  ;
	has Str $!content     ;
}
