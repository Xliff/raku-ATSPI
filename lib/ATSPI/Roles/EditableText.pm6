use v6.c;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::EditableText;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::EditableText {
  has AtspiEditableText $!aet is implementor;

  method roleInit-AtspiEditableText {
    return if $!aet;

    my \i = findProperImplementor( self.^attributes );
    $!aet = cast( AtspiEditableText, i.get_value(self) );
  }

  method ATSPI::Raw::Definitions::AtspiEditableText { $!aet }
  method AtspiEditableText                          { $!aet }

  method copy_text (
    Int()                   $start_pos,
    Int()                   $end_pos,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    my gint ($s, $e) = ($start_pos, $end_pos);

    clear_error;
    my $r = so atspi_editable_text_copy_text($!aet, $s, $e, $error);
    set_error($error);
    $r
  }

  method cut_text (
    Int()                   $start_pos,
    Int()                   $end_pos,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    my gint ($s, $e) = ($start_pos, $end_pos);

    clear_error;
    my $r = so atspi_editable_text_cut_text($!aet, $s, $e, $error);
    set_error($error);
    $r
  }

  method delete_text (
    Int()                    $start_pos,
    Int()                    $end_pos,
    CArray[Pointer[GError]]  $error      = gerror
  ) {
    my gint ($s, $e) = ($start_pos, $end_pos);

    clear_error;
    my $r = so atspi_editable_text_delete_text($!aet, $s, $e, $error);
    set_error($error);
    $r
  }

  method atspieditbletext_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_editable_text_get_type, $n, $t );
  }

  method insert_text (
    Int()                   $position,
    Str                     $text,
    Int()                   $length,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    my gint ($p, $l) = ($position, $length);

    clear_error;
    my $r = so atspi_editable_text_insert_text($!aet, $p, $text, $l, $error);
    set_error($error);
    $r
  }

  method paste_text (
    Int()                   $position,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    my gint $p = $position;

    clear_error;
    my $r = so atspi_editable_text_paste_text($!aet, $p, $error);
    set_error($error);
    $r
  }

  method set_attributes (
    Str()                   $attributes,
    Int()                   $start_pos,
    Int()                   $end_pos,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    my gint ($s, $e) = ($start_pos, $end_pos);

    clear_error;
    my $r = so atspi_editable_text_set_attributes(
      $!aet,
      $attributes,
      $s,
      $e,
      $error
    );
    set_error($error);
    $r
  }

  method set_text_contents (
    Str()                   $new_contents,
    CArray[Pointer[GError]] $error         = gerror
  ) {
    clear_error;
    my $r = so atspi_editable_text_set_text_contents(
      $!aet,
      $new_contents,
      $error
    );
    set_error($error);
    $r
  }

}

our subset AtspiEditableTextAncestry is export of Mu
  where AtspiEditableText | GObject;

class ATSPI::EditableText {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::EditableText;

  submethod BUILD ( :$atspi-editable-text ) {
    self.setAtspiEditableText($atspi-editable-text) if $atspi-editable-text;
  }

  method setAtspiEditableText (AtspiEditableTextAncestry $_) {
    my $to-parent;

    $!aet = do {
      when AtspiEditableText {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiEditableText, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiEditableTextAncestry $atspi-editable-text, :$ref = True) {
    return Nil unless $atspi-editable-text;

    my $o = self.bless( :$atspi-editable-text );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.atspieditabletext_get_type;
  }
}
