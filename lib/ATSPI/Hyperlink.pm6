use v6.c;

use Method::Also;
use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::Hyperlink;

use ATSPI::Object;

use GLib::Roles::Implementor;

class ATSPI::Hyperlink is ATSPI::Object {
  has AtspiHyperlink $!ahl is implementor;

  method new (
    AtspiApplication() $app,
    Str()              $path
  ) {
    # cw: This is not publically available. Create the object,
    #     and set through the parent. Yikes!
    #atspi_hyperlink_new($!ahl, $path);

    # cw: Here's the alternative.
    my $atspi-hyperlink = cast(
      AtspiHyperlink,
      GLib::Object.new(ATSPI::Hyperlink.get_type, :raw);
    );

    return Nil unless $atspi-hyperlink;

    (.app, .path) = ($app, $path) given $atspi-hyperlink.parent;

    self.bless( :$atspi-hyperlink );
  }

  method get_end_index (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-end-index
      end_index
      end-index
    >
  {
    clear_error;
    my $r = atspi_hyperlink_get_end_index($!ahl, $error);
    set_error($error);
    $r
  }

  method get_index_range (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-index-range
      index_range
      index-range
    >
  {
    clear_error;
    my $r = atspi_hyperlink_get_index_range($!ahl, $error);
    set_error($error);
    $r
  }

  method get_n_anchors (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-n-anchors
      elems
    >
  {
    clear_error;
    my $r = atspi_hyperlink_get_n_anchors($!ahl, $error);
    set_error($error);
    $r
  }

  method get_object (
    Int()                    $i,
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw = False
  )
    is also<get-object>
  {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_hyperlink_get_object($!ahl, $i, $error);
    set_error($error);
    propReturnObject($r, $raw, |::('ATSPI::Accessible').getTypePair);
  }

  method get_start_index (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-start-index
      start_index
      start-index
    >
  {
    clear_error;
    my $r = atspi_hyperlink_get_start_index($!ahl, $error);
    set_error($error);
    $r
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_hyperlink_get_type, $n, $t );
  }

  method get_uri (
    Int()                   $i,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<get-uri>
  {
    my gint $ii = $i;

    clear_error;
    my $r = atspi_hyperlink_get_uri($!ahl, $ii, $error);
    set_error($error);
    $r
  }

  method is_valid (CArray[Pointer[GError]] $error = gerror)
    is also<is-valid>
  {
    clear_error;
    my $r = so atspi_hyperlink_is_valid($!ahl, $error);
    set_error($error);
    $r
  }

}
