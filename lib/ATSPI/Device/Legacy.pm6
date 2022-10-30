use v6.c;

use Method::Also;

use NativeCall;

use ATSPI::Raw::Types;

use ATSPI::Device;

use GLib::Roles::Implementor;

our subset AtspiDeviceLegacyAncestry is export of Mu
  where AtspiDeviceLegacy | AtspiDeviceAncestry;

class ATSPI::Device::Legacy is ATSPI::Device {
  has AtspiDeviceLegacy $!atx is implementor;

  submethod BUILD ( :$atspi-device-legacy ) {
    self.setAtspiDeviceLegacy($atspi-device-legacy) if $atspi-device-legacy
  }

  method setAtspiDeviceLegacy (AtspiDeviceLegacyAncestry $_) {
    my $to-parent;

    $!atx = do {
      when AtspiDeviceLegacy {
        $to-parent = cast(AtspiDevice, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiDeviceLegacy, $_);
      }
    }
    self.setAtspiDevice($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiDeviceLegacy
    is also<AtspiDeviceLegacy>
  { $!atx }

  multi method new (
    AtspiDeviceLegacyAncestry  $atspi-device-legacy,
                              :$ref                  = True
  ) {
    return unless $atspi-device-legacy;

    my $o = self.bless( :$atspi-device-legacy );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $atspi-device-legacy = atspi_device_legacy_new();

    $atspi-device-legacy ?? self.bless( :$atspi-device-legacy ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_device_legacy_get_type, $n, $t );
  }

}

### /usr/include/at-spi-2.0/atspi/atspi-device-legacy.h

sub atspi_device_legacy_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_device_legacy_new
  returns AtspiDeviceLegacy
  is      native(atspi)
  is      export
{ * }
