use v6.c;

use Method::Also;

use NativeCall;

use GLib::Array;

use ATSPI::Raw::Types;
use ATSPI::Raw::Registry;

use GLib::Roles::StaticClass;

class ATSPI::Registry {
  also does Positional;
  also does GLib::Roles::StaticClass;

  method Array {
    my @rv;
    @rv.push: self[$_] for ^self.elems;
    @rv;
  }

  method generate_keyboard_event (
    Int()                   $keyval,
    Str()                   $keystring,
    Int()                   $synth_type,
    CArray[Pointer[GError]] $error       = gerror
  )
    is also<generate-keyboard-event>
  {
    my glong             $k = $keyval;
    my AtspiKeySynthType $s = $synth_type,

    clear_error;
    my $rv = atspi_generate_keyboard_event($k, $keystring, $s, $error);
    set_error($error);
    $rv;
  }

  method generate_mouse_event (
    Int()                   $x,
    Int()                   $y,
    Str()                   $name,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<generate-mouse-event>
  {
    my glong ($xx, $yy) = ($x, $y);

    clear_error;
    my $rv = atspi_generate_mouse_event($xx, $yy, $name, $error);
    set_error($error);
    $rv;
  }

  method desktop {
    self.get_desktop(0);
  }

  method get_desktop (Int $desktop, :$raw = False) is also<get-desktop> {
    my gint $d = $desktop;

    propReturnObject(
      atspi_get_desktop($d),
      $raw,
      |::('ATSPI::Accessible').getTypePair
    );
  }

  method AT-POS (\k) {
    self.get-desktop(k);
  }

  method get_desktop_count
    is also<
      get-desktop-count
      elems
    >
  {
    atspi_get_desktop_count();
  }

  method get_desktop_list ( :$raw = False, :$garray = False )
    is also<
      get-desktop-list
      desktop-list
    >
  {
    returnGArray(
      atspi_get_desktop_list(),
      $raw,
      $garray,
      |::('ATSPI::Accessible').getTypePair
    );
  }

  method set_reference_window (AtspiAccessible() $window)
    is also<set-reference-window>
  {
    atspi_set_reference_window($window);
  }

}

constant ATSPI-Registry is export := ATSPI::Registry;


use MONKEY-TYPING;

use ATSPI::DeviceListener;
augment class ATSPI::DeviceListener {

  method atspi_deregister_device_event_listener (
    gpointer                $filter, # cw: There is a chance this is a Callable
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<atspi-deregister-device-event-listener>
  {
    atspi_deregister_device_event_listener(
      self.AtspiDeviceListener,
      $filter,
      $error
    );
  }

  method atspi_deregister_keystroke_listener (
    GArray()                $key_set,
    Int()                   $modmask,
    Int()                   $event_types,
    CArray[Pointer[GError]] $error        = gerror
  )
    is also<atspi-deregister-keystroke-listener>
  {
    my AtspiKeyMaskType  $m = $modmask;
    my AtspiKeyEventMask $e = $event_types;

    atspi_deregister_keystroke_listener(
      self.AtspiDeviceListener,
      $key_set,
      $m,
      $e,
      $error
    );
  }

  method atspi_register_device_event_listener (
    Int()                   $event_types,
    gpointer                $filter,
    CArray[Pointer[GError]] $error        = gerror;
  )
    is also<atspi-register-device-event-listener>
  {
    my AtspiDeviceEventMask $e = $event_types,

    clear_error;
    my $rv = atspi_register_device_event_listener(
      self.AtspiDeviceListener,
      $e,
      $filter,
      $error
    );
    set_error($error);
    $rv;
  }

  method atspi_register_keystroke_listener (
    GArray()                $key_set,
    Int()                   $modmask,
    Int()                   $event_types,
    Int()                   $sync_type,
    CArray[Pointer[GError]] $error         = gerror
  )
    is also<atspi-register-keystroke-listener>
  {
    my AtspiKeyMaskType         $m = $modmask;
    my AtspiKeyEventMask        $e = $event_types;
    my AtspiKeyListenerSyncType $s = $sync_type;

    clear_error;
    my $rv = atspi_register_keystroke_listener(
      self.AtspiDeviceListener,
      $key_set,
      $m,
      $e,
      $s,
      $error
    );
    set_error($error);
    $rv;
  }

}
