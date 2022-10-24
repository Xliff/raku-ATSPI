use v6.c;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::Value;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Value {
  has AtspiValue $!av is implementor;

  method ATSPI::Raw::Definitions::AtspiValue { $!av }
  method AtspiValue                          { $!av }

  method roleInit-AtspiValue {
    return if $!av;

    my \i = findProperImplementor( self.^attributes );
    $!av  = cast( AtspiValue, i.get_value(self) );
  }

  method get_current_value (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_value_get_current_value($!av, $error);
    set_error($error);
    $r
  }

  method get_maximum_value (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_value_get_maximum_value($!av, $error);
    set_error($error);
    $r
  }

  method get_minimum_increment (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_value_get_minimum_increment($!av, $error);
    set_error($error);
    $r
  }

  method get_minimum_value (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_value_get_minimum_value($!av, $error);
    set_error($error);
    $r
  }

  method get_text (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_value_get_text($!av, $error);
    set_error($error);
    $r
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_value_get_type, $n, $t );
  }

  method set_current_value (
    Num()                   $new_value,
    CArray[Pointer[GError]] $error      = gerror
  ) {
    my gdouble $n = $new_value;

    clear_error;
    my $r = atspi_value_set_current_value($!av, $n, $error);
    set_error($error);
    $r
  }

}

our subset AtspiValueAncestry is export of Mu
  where AtspiValue | GObject;

class ATSPI::Value {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Value;

  submethod BUILD ( :$atspi-value ) {
    self.setAtspiValue($atspi-value) if $atspi-value;
  }

  method setAtspiValue (AtspiValueAncestry $_) {
    my $to-parent;

    $!av = do {
      when AtspiValue {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiValue, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiValueAncestry $atspi-value, :$ref = True) {
    return Nil unless $atspi-value;

    my $o = self.bless( :$atspi-value );
    $o.ref if $ref;
    $o;
  }

}
