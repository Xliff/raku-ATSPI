use v6.c;

use Method::Also;

use ATSPI::Raw::Types;
use ATSPI::Raw::StateSet;

use GLib::Array;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AtspiStateSetAncestry is export of Mu
  where AtspiStateSet | GObject;

class ATSPI::StateSet {
  also does GLib::Roles::Object;

  has AtspiStateSet $!ass is implementor;

  submethod BUILD ( :$atspi-state-set ) {
    self.setAtspiStateSet($atspi-state-set) if $atspi-state-set
  }

  method setAtspiStateSet (AtspiStateSetAncestry $_) {
    my $to-parent;

    $!ass = do {
      when AtspiStateSet {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiStateSet, $_);
      }
    }
    self!setObject($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiStateSet
    is also<AtspiStateSet>
  { $!ass }

  multi method new (AtspiStateSetAncestry $atspi-state-set, :$ref = True) {
    return unless $atspi-state-set;

    my $o = self.bless( :$atspi-state-set );
    $o.ref if $ref;
    $o;
  }
  multi method new (@states) {
    samewith( GLib::Array.new(@states) );
  }
  multi method new (GArray() $states) {
    my $atspi-state-set = atspi_state_set_new($states);

    $atspi-state-set ?? self.bless( :$atspi-state-set ) !! Nil
  }

  method add (Int() $state) {
    my AtspiStateType $s = $state;

    atspi_state_set_add($!ass, $s);
  }

  method compare (AtspiStateSet() $set2, :$raw = False) {
    propReturnObject(
      atspi_state_set_compare($!ass, $set2),
      $raw,
      |self.getTypePair
    );
  }

  method contains (Int() $state) {
    my AtspiStateType $s = $state;

    so atspi_state_set_contains($!ass, $state);
  }

  method equals (AtspiStateSet() $set2) {
    so atspi_state_set_equals($!ass, $set2);
  }

  method get_states  (
    :$raw    = False,
    :$garray = False,
    :$enums  = True,
    :$set    = True
  )
    is also<get-states>
  {
    my $rv = atspi_state_set_get_states($!ass);
    return $rv if $raw && $garray.not;
    $rv = GLib::Array.new($rv);
    return $rv if $garray && $raw;
    my $a = $rv.Array(typed => Int);
    $a .= map({ AtspiStateType($_) }) if $enums;
    return $a unless $set;
    $a.Set;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_state_set_get_type, $n, $t );
  }

  method is_empty is also<is-empty> {
    so atspi_state_set_is_empty($!ass);
  }

  method remove (Int() $state) {
    my AtspiStateType $s = $state;

    atspi_state_set_remove($!ass, $s);
  }

  method set_by_name (Str() $name, Int() $enabled) is also<set-by-name> {
    my gboolean $e = $enabled.so.Int;

    atspi_state_set_set_by_name($!ass, $name, $e);
  }

}
