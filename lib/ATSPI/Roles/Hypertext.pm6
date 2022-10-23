use v6.c;

use NativeCall;

use ATSPI::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Hypertext {
  has AtspiHypertext $!ah is implementor;

  method roleInit-AtspiHyperText {
    return if $!ah;

    my \i = findProperImplementor( self.^attributes );
    $!ah  = cast( AtspiHypertext, i.get_value(self) );
  }

  method ATSPI::Raw::Definitions::AtspiHyperText { $!ah }
  method AtspiHyperText                          { $!ah }

  method get_link (
    Int()                   $link_index,
    CArray[Pointer[GError]] $error
  ) {
    my gint $l = $link_index;

    clear_error;
    my $r = atspi_hypertext_get_link($!ah, $l, $error);
    set_error($error);
  }

  method get_link_index (
    Int()                   $character_offset,
    CArray[Pointer[GError]] $error
  ) {
    my gint $c = $character_offset;

    clear_error;
    my $r = atspi_hypertext_get_link_index($!ah, $c, $error);
    set_error($error);
    $r;
  }

  method get_n_links (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_hypertext_get_n_links($!ah, $error);
    set_error($error);
    $r;
  }

  method elems {
    self.get_n_links;
  }

  method atspihypertext_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_hypertext_get_type, $n, $t );
  }

}

our subset AtspiHypertextAncestry is export of Mu
  where AtspiHypertext | GObject;

class ATSPI::Hypertext {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Hypertext;

  submethod BUILD ( :$atspi-hypertext ) {
    self.setAtspiHypertext($atspi-hypertext) if $atspi-hypertext;
  }

  method setAtspiHypertext (AtspiHypertextAncestry $_) {
    my $to-parent;

    $!ah = do {
      when AtspiHypertext {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiHypertext, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiHypertextAncestry $atspi-hypertext, :$ref = True) {
    return Nil unless $atspi-hypertext;

    my $o = self.bless( :$atspi-hypertext );
    $o.ref if $ref;
    $o;
  }

}

### /usr/include/at-spi-2.0/atspi/atspi-hypertext.h

sub atspi_hypertext_get_link (
  AtspiHypertext          $obj,
  gint                    $link_index,
  CArray[Pointer[GError]] $error
)
  returns AtspiHyperlink
  is      native(atspi)
  is      export
{ * }

sub atspi_hypertext_get_link_index (
  AtspiHypertext          $obj,
  gint                    $character_offset,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_hypertext_get_n_links (
  AtspiHypertext          $obj,
  CArray[Pointer[GError]] $error
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_hypertext_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
