use v6.c;

use NativeCall;


use ATSPI::Raw::Types;
use ATSPI::Raw::Action;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Action {
  has AtspiAction $!aa is implementor;

  method roleInit-AtspiAction {
    return if $!aa;

    my \i = findProperImplementor( self.^attributes );
    $!aa = cast( AtspiAction, i.get_value(self) );
  }

  method ATSPI::Raw::Definitions::AtspiAction { $!aa }
  method AtspiAction                          { $!aa }

  method do_action (
    Int()                   $i,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ii = $i;

    clear_error;
    my $r = so atspi_action_do_action($!aa, $ii, $error);
    set_error($error);
    $r
  }

  method get_action_description (
    Int()                   $i,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_action_get_action_description($!aa, $ii, $error);
    set_error($error);
    $r
  }

  method get_action_name (
    Int()                   $i,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_action_get_action_name($!aa, $ii, $error);
    set_error($error);
    $r
  }

  method get_description (
    Int()                   $i,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_action_get_description($!aa, $ii, $error);
    set_error($error);
    $r
  }

  method get_key_binding (
    Int()                   $i,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_action_get_key_binding($!aa, $ii, $error);
    set_error($error);
    $r
  }

  method get_localized_name (
    Int()                   $i,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_action_get_localized_name($!aa, $ii, $error);
    set_error($error);
    $r
  }

  method get_n_actions (
    CArray[Pointer[GError]] $error
  ) {
    clear_error;
    my $r = atspi_action_get_n_actions($!aa, $error);
    set_error($error);
    $r
  }

  method get_name (
    Int()                   $i,
    CArray[Pointer[GError]] $error
  ) {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_action_get_name($!aa, $ii, $error);
    set_error($error);
    $r
  }

  method atspiaction_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_action_get_type, $n, $t );
  }

}

our subset AtspiActionAncestry is export of Mu
  where AtspiAction | GObject;

class ATSPI::Action {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Action;

  submethod BUILD ( :$atspi-action ) {
    self.setAtspiAction($atspi-action) if $atspi-action;
  }

  method setAtspiAction (AtspiActionAncestry $_) {
    my $to-parent;

    $!aa = do {
      when AtspiAction {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiAction, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiActionAncestry $atspi-action, :$ref = True) {
    return Nil unless $atspi-action;

    my $o = self.bless( :$atspi-action );
    $o.ref if $ref;
    $o;
  }

  method elems {
    self.get_n_actions;
  }

  method get_type {
    self.atspiaction_get_type;
  }
}
