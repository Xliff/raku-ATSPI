use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use ATSPI::Raw::Types;
use ATSPI::Raw::EventListener;

my \DC := %DEFAULT-CALLBACKS;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class ATSPI::EventListener {
  also does GLib::Roles::Object;

  has AtspiEventListener $!ael is implementor;

  method new (
             &callback,
    gpointer $user_data           = gpointer,
             :&callback_destroyed = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) {
    my $atspi-event-listener = atspi_event_listener_new(
      &callback,
      $user_data,
      &callback_destroyed
    );

    $atspi-event-listener ?? self.bless( :$atspi-event-listener ) !! Nil;
  }

  method new_simple (
    &callback,
    $callback_destroyed = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) {
    my $atspi-event-listener = atspi_event_listener_new_simple(
      &callback,
      $callback_destroyed
    );

    $atspi-event-listener ?? self.bless( :$atspi-event-listener ) !! Nil;
  }

  method deregister (
    Str                     $event_type,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    clear_error;
    my $mrv = so atspi_event_listener_deregister($!ael, $event_type, $error);
    set_error($error);
    $mrv;
  }

  proto method deregister_from_callback (|)
    is static
  { * }

  multi method deregister_from_callback (
                             &callback,
    Str()                    $event_type,
    CArray[Pointer[GError]]  $error       = gerror,
    gpointer                :$user_data   = gpointer
  ) {
    samewith(&callback, $user_data, $event_type, $error);
  }
  multi method deregister_from_callback (
                            &callback,
    gpointer                $user_data,
    Str()                   $event_type,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    clear_error;
    my $mrv = atspi_event_listener_deregister_from_callback(
      &callback,
      $user_data,
      $event_type,
      $error
    );
    set_error($error);
    $mrv;
  }

  method deregister_no_data (
                            &callback,
    Str()                   $event_type,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    clear_error;
    my $mrv = so atspi_event_listener_deregister_no_data(
      &callback,
      $event_type,
      $error
    );
    set_error($error);
    $mrv;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_event_listener_get_type, $n, $t );
  }

  method register (
    Str()                   $event_type,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    clear_error;
    my $mrv = so atspi_event_listener_register($!ael, $event_type, $error);
    set_error($error);
    $mrv;
  }

  proto method register_from_callback (|)
    is static
  { * }

  multi method register_from_callback (
                            &callback,
    Str                     $event_type,
    CArray[Pointer[GError]] $error              = gerror,
    gpointer                $user_data          = gpointer,
                            &callback_destroyed = DC<GDestroyNotify>
  ) {
    samewith(&callback, $user_data, &callback_destroyed, $event_type, $error);
  }
  multi method register_from_callback (
                            &callback,
    gpointer                $user_data,
                            &callback_destroyed,
    Str                     $event_type,
    CArray[Pointer[GError]] $error               = gerror
  ) {
    clear_error;
    my $mrv = so atspi_event_listener_register_from_callback(
      &callback,
      $user_data,
      &callback_destroyed,
      $event_type,
      $error
    );
    set_error($error);
    $mrv;
  }

  proto method register_from_callback_full (|)
    is static
  { * }

  multi method register_from_callback_full (
                             &callback,
    Str                      $event_type,
    GArray                   $properties,
    CArray[Pointer[GError]]  $error              = gerror,
    Pointer                 :$user_data          = gpointer,
                            :&callback_destroyed = DC<GDestroyNotify>
  ) {
    samewith(
      &callback,
      $user_data,
      &callback_destroyed,
      $event_type,
      $properties,
      $error
    );
  }
  multi method register_from_callback_full (
                            &callback,
    Pointer                 $user_data,
                            &callback_destroyed,
    Str                     $event_type,
    GArray                  $properties,
    CArray[Pointer[GError]] $error               = gerror
  ) {
    clear_error;
    my $mrv = so atspi_event_listener_register_from_callback_full(
      $!ael,
      $user_data,
      &callback_destroyed,
      $event_type,
      $properties,
      $error
    );
    set_error($error);
    $mrv;
  }

  method register_full (
    Str()                   $event_type,
    GArray()                $properties,
    CArray[Pointer[GError]] $error      = gerror
  ) {
    clear_error;
    my $mrv = so atspi_event_listener_register_full(
      $!ael,
      $event_type,
      $properties,
      $error
    );
    set_error($error);
    $mrv;
  }

  proto method register_no_data (|)
    is static
  { * }

  multi method register_no_data (
                             &callback,
    Str                      $event_type,
    CArray[Pointer[GError]]  $error               = gerror,
                            :&callback_destroyed  = DC<GDestroyNotify>
  ) {
    samewith(&callback, &callback_destroyed, $event_type, $error);
  }
  multi method register_no_data (
                            &callback,
                            &callback_destroyed,
    Str                     $event_type,
    CArray[Pointer[GError]] $error              = gerror
  ) {
    clear_error;
    my $mrv = so atspi_event_listener_register_no_data(
      &callback,
      &callback_destroyed,
      $event_type,
      $error
    );
    set_error($error);
    $mrv;
  }

}

class ATSPI::Event {

  method get_type is static {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_event_get_type, $n, $t );
  }

}
