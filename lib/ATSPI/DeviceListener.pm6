use v6.c;

use Method::Also;

use ATSPI::Raw::Types;
use ATSPI::Raw::DeviceListener;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AtspiDeviceListenerAncestry is export of Mu
  where AtspiDeviceListener | GObject;

class ATSPI::DeviceListener {
  also does GLib::Roles::Object;

  has AtspiDeviceListener $!adl is implementor;

  submethod BUILD ( :$atspi-device-listener ) {
    self.setAtspiDeviceListener($atspi-device-listener)
      if $atspi-device-listener
  }

  method setAtspiDeviceListener (AtspiDeviceListenerAncestry $_) {
    my $to-parent;

    $!adl = do {
      when AtspiDeviceListener {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiDeviceListener, $_);
      }
    }
    self!setObject($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiDeviceListener
    is also<AtspiDeviceListener>
  { $!adl }

  multi method new (
    AtspiDeviceListenerAncestry  $atspi-device-listener,
                                :$ref                    = True
  ) {
    return unless $atspi-device-listener;

    my $o = self.bless( :$atspi-device-listener );
    $o.ref if $ref;
    $o;
  }
  multi method new (
             &callback,
    gpointer $user_data          = gpointer,
             &callback_destroyed = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) {
    my $atspi-device-listener = atspi_device_listener_new(
      &callback,
      $user_data,
      &callback_destroyed
    );

    $atspi-device-listener ?? self.bless( :$atspi-device-listener ) !! Nil;
  }

  method new_simple (
    &callback,
    &callback_destroyed = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<new-simple>
  {
    my $atspi-device-listener = atspi_device_listener_new_simple(
      &callback,
      &callback_destroyed
    );

    $atspi-device-listener ?? self.bless( :$atspi-device-listener ) !! Nil;
  }

  method add_callback (
           &callback,
  gpointer $user_data          = gpointer,
           &callback_destroyed = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<add-callback>
  {
    atspi_device_listener_add_callback(
      &callback,
      $user_data,
      &callback_destroyed
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_device_listener_get_type, $n, $t );
  }

  method remove_callback (&callback) is also<remove-callback> {
    atspi_device_listener_remove_callback($!adl, &callback);
  }

}
