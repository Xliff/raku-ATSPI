use v6.c;

use Method::Also;

use NativeCall;

use ATSPI::Raw::Types;

use ATSPI::Device;

use GLib::Roles::Implementor;

our subset AtspiDeviceX11Ancestry is export of Mu
  where AtspiDeviceX11 | AtspiDeviceAncestry;

class ATSPI::Device::X11 is ATSPI::Device {
  has AtspiDeviceX11 $!atx is implementor;

  submethod BUILD ( :$atspi-device-x11 ) {
    self.setAtspiDeviceX11($atspi-device-x11) if $atspi-device-x11
  }

  method setAtspiDeviceX11 (AtspiDeviceX11Ancestry $_) {
    my $to-parent;

    $!atx = do {
      when AtspiDeviceX11 {
        $to-parent = cast(AtspiDevice, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiDeviceX11, $_);
      }
    }
    self.setAtspiDevice($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiDeviceX11
    is also<AtspiDeviceX11>
  { $!atx }

  multi method new (AtspiDeviceX11Ancestry $atspi-device-x11, :$ref = True) {
    return unless $atspi-device-x11;

    my $o = self.bless( :$atspi-device-x11 );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $atspi-device-x11 = atspi_device_x11_new();

    $atspi-device-x11 ?? self.bless( :$atspi-device-x11 ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_device_x11_get_type, $n, $t );
  }

}

### /usr/include/at-spi-2.0/atspi/atspi-device-x11.h

sub atspi_device_x11_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_device_x11_new
  returns AtspiDeviceX11
  is      native(atspi)
  is      export
{ * }
