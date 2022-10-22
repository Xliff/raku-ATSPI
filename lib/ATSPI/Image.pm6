use v6.c;

use ATSPI::Raw::Types;
use ATSPI::Raw::Image;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Image {
  has AtspiImage $!ai is implementor;

  method roleInit-AtspiImage {
    return if $!ai;

    my \i = findProperImplementor( self.^attributes );
    $!ai = cast(AtspiImage, i.get_value(self);
  }

  method ATSPI::Raw::Definitions::AtspiImage { $!ai }
  method AtspiImage                          { $!ai}

  method get_image_description (
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $r = atspi_image_get_image_description($!ai, $error);
    set_error($error);
    $r;
  }

  method get_image_extents (
    Int()                   $ctype,
    CArray[Pointer[GError]] $error
  ) {
    my AtspiCoordType $c = $ctype,

    clear_error;
    my $r = atspi_image_get_image_extents($!ai, $c, $error);
    set_error($error);
    $r;
  }

  method get_image_locale (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_image_get_image_locale($!ai, $error);
    set_error($error);
    $r;
  }

  method get_image_position (
    AtspiCoordType          $ctype,
    CArray[Pointer[GError]] $error  = gerror
  ) {
    my AtspiCoordType $c = $ctype,

    clear_error;
    my $r = atspi_image_get_image_position($!ai, $c, $error);
    set_error($error);
    $r
  }

  method get_image_size (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_image_get_image_size($!ai, $error);
    set_error($error);
    $r;
  }

  method atspiimage_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_image_get_type, $n, $t );
  }

}

our subset AtspiImageAncestry is export of Mu
  where AtspiImage | GObject;

class ATSPI::Image {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Image;

  submethod BUILD ( :$atspi-image ) {
    self.setAtspiImage($atspi-image) if $atspi-image;
  }

  method setAtspiImage (AtspiImageAncestry $_) {
    my $to-parent;

    $!ai = do {
      when AtspiImage {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiImage, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiImageAncestry $atspi-image, :$ref = True) {
    return Nil unless $atspi-image;

    my $o = self.bless( :$atspi-image );
    $o.ref if $ref;
    $o;
  }

}
