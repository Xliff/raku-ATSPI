use v6.c;

use Method::Also;

use NativeCall;

use ATSPI::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AtspiObjectAncestry is export of Mu
  where AtspiObject | GObject;

class ATSPI::Object {
  also does GLib::Roles::Object;

  has AtspiObject $!ao is implementor;

  submethod BUILD ( :$atspi-object ) {
    self.setAtspiObject($atspi-object) if $atspi-object
  }

  method setAtspiObject (AtspiObjectAncestry $_) {
    my $to-parent;

    $!ao = do {
      when AtspiObject {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiObject, $_);
      }
    }
    self!setObject($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiObject
    is also<AtspiObject>
  { $!ao }

  multi method new (AtspiObjectAncestry $atspi-object, :$ref = True) {
    return unless $atspi-object;

    my $o = self.bless( :$atspi-object );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_object_get_type, $n, $t );
  }

}

### /usr/include/at-spi-2.0/atspi/atspi-object.h

sub atspi_object_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
