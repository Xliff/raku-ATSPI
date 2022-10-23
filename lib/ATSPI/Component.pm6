use v6.c;

use ATSPI::Raw::Types;
use ATSPI::Raw::Component;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Component {
  has AtspiComponent $!ac is implementor;

  method roleInit-AtspiComponent {
    return if $!ai;

    my \i = findProperImplementor( self.^attributes );
    $!ai = cast(AtspiComponent, i.get_value(self);
  }

  method ATSPI::Raw::Definitions::AtspiComponent { $!ac }
  method AtspiComponent                          { $!ac }

  method contains (
    Int()                   $x,
    Int()                   $y,
    Int()                   $ctype,
    CArray[Pointer[GError]] $error  = gerror
  ) {
    my AtspiCoordType  $c                =  $ctype;
    my gint           ($xx, $yy)         = ($x, $y);

    clear_error;
    my $r = atspi_component_contains($!ac, $xx, $yy, $c, $error);
    set_error($error);
    $r
  }

  method get_accessible_at_point (
    Int()                   $x,
    Int()                   $y,
    Int()                   $ctype,
    CArray[Pointer[GError]] $error  = gerror
  ) {
    my AtspiCoordType  $c                =  $ctype;
    my gint           ($xx, $yy)         = ($x, $y);

    clear_error;
    my $r = atspi_component_get_accessible_at_point(
      $!ac,
      $xx,
      $yy,
      $c,
      $error
    );
    set_error($error);
    $r
  }

  method get_alpha (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_component_get_alpha($!ac, $error);
    set_error($error);
    $r
  }

  method get_extents (
    Int()                   $ctype,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my AtspiCoordType $c =  $ctype;

    clear_error;
    my $r = atspi_component_get_extents($!ac, $c, $error);
    set_error($error);
    $r
  }

  method get_layer (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_component_get_layer($!ac, $error);
    set_error($error);
    $r
  }

  method get_mdi_z_order (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_component_get_mdi_z_order($!ac, $error);
    set_error($error);
    $r
  }

  method get_position (
    Int()                   $ctype,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my AtspiCoordType $c =  $ctype;

    clear_error;
    my $r = atspi_component_get_position($!ac, $c, $error);
    set_error($error);
    $r
  }

  method get_size (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_component_get_size($!ac, $error);
    set_error($error);
    $r
  }

  method atspicompoent_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_component_get_type, $n, $t );
  }

  method grab_focus (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_component_grab_focus($!ac, $error);
    set_error($error);
    $r
  }

  method scroll_to (
    Int()                   $type,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my AtspiScrollType $t = $type;
    clear_error;
    my $r = atspi_component_scroll_to($!ac, $t, $error);
    set_error($error);
    $r
  }

  method scroll_to_point (
    Int()                   $coords,
    Int()                   $x,
    Int()                   $y,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my AtspiCoordType  $c                =  $ctype;
    my gint           ($xx, $yy)         = ($x, $y);

    clear_error;
    my $r = atspi_component_scroll_to_point($!ac, $c, $xx, $yy, $error);
    set_error($error);
    $r
  }

  method set_extents (
    Int()                   $x,
    Int()                   $y,
    Int()                   $width,
    Int()                   $height,
    Int()                   $ctype,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my AtspiCoordType  $c                =  $ctype;
    my gint           ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    clear_error;
    my $r = atspi_component_set_extents($!ac, $xx, $yy, $w, $h, $c, $error);
    set_error($error);
    $r
  }

  method set_position (
    Int()                   $x,
    Int()                   $y,
    Int()                   $ctype,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my AtspiCoordType  $c                =  $ctype;
    my gint           ($xx, $yy)         = ($x, $y);

    clear_error;
    my $r = atspi_component_set_position($!ac, $xx, $yy, $c, $error);
    set_error($error);
    $r
  }

  method set_size (
    Int()                   $width,
    Int()                   $height,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gint ($w, $h) = ($width, $height);

    clear_error;
    my $r = atspi_component_set_size($!ac, $w, $h, $error);
    set_error($error);
    $r
  }

}

our subset AtspiComponentAncestry is export of Mu
  where AtspiComponent | GObject;

class ATSPI::Component {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Component;

  submethod BUILD ( :$atspi-component ) {
    self.setAtspiComponent($atspi-component) if $atspi-component;
  }

  method setAtspiComponent (AtspiComponentAncestry $_) {
    my $to-parent;

    $!ai = do {
      when AtspiComponent {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiComponent, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiComponentAncestry $atspi-component, :$ref = True) {
    return Nil unless $atspi-component;

    my $o = self.bless( :$atspi-component );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.atspicomponent_get_type;
  }

}
