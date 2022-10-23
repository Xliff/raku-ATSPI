use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use ATSPI::Raw::Types;
use ATSPI::Raw::Text;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Text {
  has AtspiText $!at is implementor;

  method ATSPI::Raw::Definitions::AtspiText { $!at }
  method AtspiText                          { $!at }

  method roleInit-AtspiText {
    return if $!at;

    my \i = findProperImplementor( self.^attributes );
    $!at  = cast( AtspiText, i.get_value(self) );
  }

  method add_selection (
    Int()                   $start_offset,
    Int()                   $end_offset,
    CArray[Pointer[GError]] $error
  ) {
    my gint ($so, $eo) = ($start_offset, $end_offset);

    clear_error;
    my $r = atspi_text_add_selection($!at, $so, $eo, $error);
    set_error($error);
    $r
  }

  proto method get_attribute_run (|)
  { * }

  multi method get_attribute_run (
    Int()                   $offset,
    Int()                   $include_defaults,
    CArray[Pointer[GError]] $error             = gerror
  ) {
    samewith($offset, $include_defaults, $, $, $error);
  }
  multi method get_attribute_run (
    Int()                   $offset,
    Int()                   $include_defaults,
                            $start_offset      is rw,
                            $end_offset        is rw,
    CArray[Pointer[GError]] $error
  ) {
    my gint      $o        = $offset;
    my gboolean  $i        = $include_defaults.so.Int;
    my gint     ($so, $eo) = 0 xx 2;

    clear_error;
    my $r = atspi_text_get_attribute_run($!at, $o, $i, $so, $eo, $error);
    set_error($error);
    ($start_offset, $end_offset) = ($so, $eo);
    $r;
  }

  method get_attribute_value (
    Int()                   $offset,
    Str()                   $attribute_name,
    CArray[Pointer[GError]] $error            = gerror
  ) {
    my gint $o = $offset;

    clear_error;
    my $r = atspi_text_get_attribute_value($!at, $o, $attribute_name, $error);
    set_error($error);
    $r;
  }

  proto method get_attributes (|)
  { * }

  multi method get_attributes (
    Int()                   $offset,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    samewith($offset, $, $, $error);
  }
  multi method get_attributes (
    Int()                   $offset,
                            $start_offset is rw,
                            $end_offset   is rw,
    CArray[Pointer[GError]] $error
  ) {
    my gint  $o        = $offset;
    my gint ($so, $eo) = 0 xx 2;

    clear_error;
    my $r = atspi_text_get_attributes($!at, $offset, $so, $eo, $error);
    set_error($error);
    $r;
  }

  method get_bounded_ranges (
    Int()                   $x,
    Int()                   $y,
    Int()                   $width,
    Int()                   $height,
    Int()                   $type,
    Int()                   $clipTypeX,
    Int()                   $clipTypeY,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    my gint              ($xx, $yy, $w, $h) = ($x, $y, $width, $height);
    my AtspiCoordType     $t                =  $type,
    my AtspiTextClipType ($cx, $cy)         = ($clipTypeX, $clipTypeY);

    clear_error;
    atspi_text_get_bounded_ranges(
      $!at,
      $xx,
      $yy,
      $w,
      $h,
      $t,
      $cx,
      $cy,
      $error
    );
    set_error($error);
  }

  method get_caret_offset (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_text_get_caret_offset($!at, $error);
    set_error($r);
    $r;
  }

  method get_character_at_offset (
    Int()                   $offset,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint $o = $offset;

    clear_error;
    my $r = atspi_text_get_character_at_offset($!at, $o, $error);
    set_error($error);
    $r;
  }

  method get_character_count (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_text_get_character_count($!at, $error);
    set_error($error);
    $r;
  }

  method get_character_extents (
    Int()                   $offset,
    Int()                   $type,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint           $o = $offset;
    my AtspiCoordType $t =  $type;

    clear_error;
    my $r = atspi_text_get_character_extents($!at, $o, $t, $error);
    set_error($error);
    $r;
  }

  method get_default_attributes (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_text_get_default_attributes($!at, $error);
    set_error($error);
  }

  method get_n_selections (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_text_get_n_selections($!at, $error);
    set_error($error);
    $r;
  }

  method get_offset_at_point (
    gint                    $x,
    gint                    $y,
    AtspiCoordType          $type,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gint           ($xx, $yy) = ($x, $y);
    my AtspiCoordType  $t        =  $type;

    clear_error;
    my $r = atspi_text_get_offset_at_point($!at, $xx, $yy, $t, $error);
    set_error($error);
    $r;
  }

  method get_range_extents (
    Int()                   $start_offset,
    Int()                   $end_offset,
    Int()                   $type,
    CArray[Pointer[GError]] $error         = gerror
  ) {
    my gint           ($so, $eo) = ($start_offset, $end_offset);
    my AtspiCoordType  $t        =  $type;

    clear_error;
    my $r = atspi_text_get_range_extents($!at, $so, $eo, $t, $error);
    set_error($error);
    $r;
  }

  method get_selection (
    Int()                   $selection_num,
    CArray[Pointer[GError]] $error          = gerror
  ) {
    my gint $s = $selection_num;

    clear_error;
    my $r = atspi_text_get_selection($!at, $s, $error);
    set_error($error);
    $r;
  }

  method get_string_at_offset (
    Int()                   $offset,
    Int()                   $granularity,
    CArray[Pointer[GError]] $error         = gerror
  ) {
    my gint                 $o = $offset;
    my AtspiTextGranularity $g = $granularity;

    clear_error;
    my $r = atspi_text_get_string_at_offset(
      $!at,
      $offset,
      $granularity,
      $error
    );
    set_error($error);
    $r;
  }

  method get_text (
    Int()                   $start_offset,
    Int()                   $end_offset,
    CArray[Pointer[GError]] $error          = gerror
  ) {
    my gint ($so, $eo) = ($start_offset, $end_offset);

    clear_error;
    my $r = atspi_text_get_text($!at, $so, $eo, $error);
    set_error($error);
    $r;
  }

  method get_text_after_offset (
    Int()                   $offset,
    Int()                   $type,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint                   $o = $offset;
    my AtspiTextBoundaryType  $t = $type;

    clear_error;
    my $r = atspi_text_get_text_after_offset($!at, $o, $t, $error);
    set_error($error);
    $r;
  }

  method get_text_at_offset (
    Int()                   $offset,
    Int()                   $type,
    CArray[Pointer[GError]] $error
  ) {
    my gint                   $o = $offset;
    my AtspiTextBoundaryType  $t = $type;

    clear_error;
    my $r = atspi_text_get_text_at_offset($!at, $o, $t, $error);
    set_error($error);
    $r;
  }

  method get_text_attribute_value (
    Int()                   $offset,
    Str()                   $attribute_name,
    CArray[Pointer[GError]] $error           = gerror
  ) {
    my gint $o = $offset;

    clear_error;
    my $r = atspi_text_get_text_attribute_value(
      $!at,
      $o,
      $attribute_name,
      $error
    );
    set_error($error);
  }

  proto method get_text_attributes (|)
  { *}

  multi method get_text_attributes (
    Int()                   $offset,
    CArray[Pointer[GError]] $error               = gerror
  ) {
    samewith($offset, $, $, $error);
  }
  multi method get_text_attributes (
    Int()                   $offset,
                            $start_offset is rw,
                            $end_offset   is rw,
    CArray[Pointer[GError]] $error               = gerror
  ) {
    my gint  $o        = $offset;
    my gint ($so, $eo) = 0 xx 2;

    clear_error;
    atspi_text_get_text_attributes($!at, $o, $so, $eo, $error);
    set_error($error);
    ($start_offset, $end_offset) = ($so, $eo);
  }

  method get_text_before_offset (
    Int()                   $offset,
    Int()                   $type,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint                   $o = $offset;
    my AtspiTextBoundaryType  $t = $type;

    clear_error;
    my $r = atspi_text_get_text_before_offset($!at, $o, $t, $error);
    set_error($error);
    $r;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_text_get_type, $n, $t );
  }

  method remove_selection (
    Int()                   $selection_num,
    CArray[Pointer[GError]] $error          = gerror
  ) {
    my gint $s = $selection_num;

    clear_error;
    atspi_text_remove_selection($!at, $s, $error);
    set_error($error);
  }

  method scroll_substring_to (
    Int()                   $start_offset,
    Int()                   $end_offset,
    Int()                   $type,
    CArray[Pointer[GError]] $error
  ) {
    my gint            ($so, $eo) = ($start_offset, $end_offset);
    my AtspiScrollType  $t        =  $type;

    clear_error;
    my $r = so atspi_text_scroll_substring_to($!at, $so, $eo, $t, $error);
    set_error($error);
    $r;
  }

  method scroll_substring_to_point (
    Int()                   $start_offset,
    Int()                   $end_offset,
    Int()                   $coords,
    Int()                   $x,
    Int()                   $y,
    CArray[Pointer[GError]] $error         = gerror
  ) {
    my gint ($so, $eo, $xx, $yy) = ($start_offset, $end_offset, $x, $y);

    my AtspiCoordType $c = $coords;

    clear_error;
    my $r = so atspi_text_scroll_substring_to_point(
      $!at,
      $so,
      $eo,
      $c,
      $xx,
      $yy,
      $error
    );
    set_error($error);
  }

  method set_caret_offset (
    Int()                   $new_offset,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    my gint $n = $new_offset;

    clear_error;
    my $r = so atspi_text_set_caret_offset($!at, $n, $error);
    set_error($error);
    $r;
  }

  method set_selection (
    Int()                   $selection_num,
    Int()                   $start_offset,
    Int()                   $end_offset,
    CArray[Pointer[GError]] $error          = gerror
  ) {
    my gint ($s, $so, $eo) = ($selection_num, $start_offset, $end_offset);

    clear_error;
    my $r = so atspi_text_set_selection($!at, $s, $so, $eo, $error);
    set_error($error);
    $r;
  }

}

class ATSPI::Range {
  has AtspiRange $!ar is implementor;

  method copy {
    atspi_range_copy($!ar);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_range_get_type, $n, $t );
  }

}

class ATSPI::Text::Range {

  method get_type is static {
    state ($n, $t);

    unstable_get_type(self.^name, &atspi_text_range_get_type, $n, $t );
  }

}

our subset AtspiTextAncestry is export of Mu
  where AtspiText | GObject;

class ATSPI::Text {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Text;

  submethod BUILD ( :$atspi-text ) {
    self.setAtspiText($atspi-text) if $atspi-text;
  }

  method setAtspiText (AtspiTextAncestry $_) {
    my $to-parent;

    $!at = do {
      when AtspiText {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiText, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiTextAncestry $atspi-text, :$ref = True) {
    return Nil unless $atspi-text;

    my $o = self.bless( :$atspi-text );
    $o.ref if $ref;
    $o;
  }

}
