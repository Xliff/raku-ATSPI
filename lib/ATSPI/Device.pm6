use v6.c;

use Method::Also;

use ATSPI::Raw::Types;
use ATSPI::Raw::Device;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AtspiDeviceAncestry is export of Mu
  where AtspiDevice | GObject;

class ATSPI::Device {
  also does GLib::Roles::Object;

  has AtspiDevice $!ad is implementor;

  submethod BUILD ( :$atspi-device ) {
    self.setAtspiDevice($atspi-device) if $atspi-device
  }

  method setAtspiDevice (AtspiDeviceAncestry $_) {
    my $to-parent;

    $!ad = do {
      when AtspiDevice {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiDevice, $_);
      }
    }
    self!setObject($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiDevice
    is also<AtspiDevice>
  { $!ad }

  multi method new (AtspiDeviceAncestry $atspi-device, :$ref = True) {
    return unless $atspi-device;

    my $o = self.bless( :$atspi-device );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $atspi-device = atspi_device_new();

    $atspi-device ?? self.bless( :$atspi-device ) !! Nil;
  }

  method add_key_grab (
    Int()    $kd,
             &callback,
    gpointer  $user_data          = gpointer,
             $callback_destroyed = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<add-key-grab>
  {
    my AtspiKeyDefinition $k = $kd;

    atspi_device_add_key_grab(
      $!ad,
      $k,
      &callback,
      $user_data,
      $callback_destroyed
    );
  }

  method add_key_watcher (
             &callback,
    gpointer $user_data          = gpointer,
             $callback_destroyed = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<add-key-watcher>
  {
    atspi_device_add_key_watcher(
      $!ad,
      &callback,
      $user_data,
      $callback_destroyed
    );
  }

  method get_grab_by_id (Int() $id) is also<get-grab-by-id> {
    atspi_device_get_grab_by_id($!ad, $id);
  }

  method get_locked_modifiers is also<get-locked-modifiers> {
    atspi_device_get_locked_modifiers($!ad);
  }

  method get_modifier (Int() $keycode) is also<get-modifier> {
    atspi_device_get_modifier($!ad, $keycode);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_device_get_type, $n, $t );
  }

  method grab_keyboard is also<grab-keyboard> {
    atspi_device_grab_keyboard($!ad);
  }

  method map_modifier (Int() $keycode) is also<map-modifier> {
    my gint $k = $keycode;

    atspi_device_map_modifier($!ad, $k);
  }

  method notify_key (
    Int() $pressed,
    Int() $keycode,
    Int() $keysym,
    Int() $state,
    Str() $text
  )
    is also<notify-key>
  {
    my gboolean  $p            =  $pressed.so.Int;
    my gint     ($kc, $ks, $s) = ($keycode, $keysym, $state);

    atspi_device_notify_key($!ad, $p, $kc, $ks, $s, $text);
  }

  method remove_key_grab (Int() $id) is also<remove-key-grab> {
    my gint $i = $id;

    atspi_device_remove_key_grab($!ad, $i);
  }

  method ungrab_keyboard is also<ungrab-keyboard> {
    atspi_device_ungrab_keyboard($!ad);
  }

  method unmap_modifier (Int() $keycode) is also<unmap-modifier> {
    my gint $k = $keycode;

    atspi_device_unmap_modifier($!ad, $k);
  }

}
