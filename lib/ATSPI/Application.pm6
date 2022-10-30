use v6.c;

use Method::Also;

use NativeCall;

use ATSPI::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AtspiApplicationAncestry is export of Mu
  where AtspiApplication | GObject;

class ATSPI::Application {
  also does GLib::Roles::Object;

  has AtspiApplication $!aa is implementor;

  submethod BUILD ( :$atspi-application ) {
    self.setAtspiApplication($atspi-application) if $atspi-application
  }

  method setAtspiApplication (AtspiApplicationAncestry $_) {
    my $to-parent;

    $!aa = do {
      when AtspiApplication {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiApplication, $_);
      }
    }
    self!setObject($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiApplication
    is also<AtspiApplication>
  { $!aa }

  multi method new (
    AtspiApplicationAncestry  $atspi-application,
                             :$ref                = True
  ) {
    return unless $atspi-application;

    my $o = self.bless( :$atspi-application );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $atspi-application = self.GLib::Roles::Object::new-object-ptr(
      self.get_type
    );

    $atspi-application ?? self.bless( :$atspi-application ) !! Nil
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_application_get_type, $n, $t );
  }

}


### /usr/include/at-spi-2.0/atspi/atspi-application.h

sub atspi_application_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
