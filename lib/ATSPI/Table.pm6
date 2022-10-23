use v6.c;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::Table;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Table {
  has AtspiTable $!at is implementor;

  method add_column_selection (
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $c = $column;

    clear_error;
    my $r = so atspi_table_add_column_selection($!at, $c, $error);
    set_error($error);
    $r;
  }

  method add_row_selection (
    Int()                   $row,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $r = $row;

    clear_error;
    my $rv = so atspi_table_add_row_selection($!at, $r, $error);
    set_error($error);
    $rv;
  }

  method get_accessible_at (
    Int()                    $row,
    Int()                    $column,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     = False
  ) {
    my gint ($r, $c) = ($row, $column);

    clear_error;
    my $rv = atspi_table_get_accessible_at($!at, $row, $c, $error);
    set_error($error);
    propReturnObject($rv, $raw, |ATSPI::Accessible.getTypePair);
  }

  method get_caption (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    clear_error;
    my $r = atspi_table_get_caption($!at, $error);
    set_error($error);
    propReturnObject($r, $raw, |ATSPI::Accessible.getTypePair);
  }

  method get_column_at_index (
    Int()                   $index,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $i = $index;

    clear_error;
    my $r = atspi_table_get_column_at_index($!at, $i, $error);
    set_error($error);
    $r;
  }

  method get_column_description (
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $c = $column;

    clear_error;
    my $r = atspi_table_get_column_description($!at, $c, $error);\
    set_error($error);
    $r;
  }

  method get_column_extent_at (
    Int()                   $row,
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint ($r, $c) = ($row, $column);

    clear_error;
    my $rv = atspi_table_get_column_extent_at($!at, $r, $c, $error);
    set_error($error);
    $rv;
  }

  method get_column_header (
    Int()                    $column,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     = False,
  ) {
    my Int() $c = $column;

    clear_error;
    my $r = atspi_table_get_column_header($!at, $c, $error);
    set_error($error);
    propReturnObject($r, $raw, |ATSPI::Accessible.getTypePair);
  }

  method get_index_at (
    Int()                   $row,
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint ($r, $c) = ($row, $column);

    clear_error;
    my $rv = atspi_table_get_index_at($!at, $r, $c, $error);
    set_error($error);
    $rv;
  }

  method get_n_columns (
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $r = atspi_table_get_n_columns($!at, $error);
    set_error($error);
    $r;
  }

  method get_n_rows (
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $r = atspi_table_get_n_rows($!at, $error);
    set_error($error);
    $r;
  }

  method get_n_selected_columns (
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $r = atspi_table_get_n_selected_columns($!at, $error);
    set_error($error);
    $r;
  }

  method get_n_selected_rows (
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $r = atspi_table_get_n_selected_rows($!at, $error);
    set_error($error);
    $r;
  }

  method get_row_at_index (
    Int()                   $index,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $i = $index;

    clear_error;
    my $r = atspi_table_get_row_at_index($!at, $i, $error);
    set_error($error);
    $r;
  }

  proto method get_row_column_extents_at_index (|)
  { * }

  multi method get_row_column_extents_at_index (
    Int()                    $index,
    CArray[Pointer[GError]]  $error              = gerror
  ) {
    samewith($index, $, $, $, $, $, $error);
  }
  multi method get_row_column_extents_at_index (
    Int()                    $index,
    Int()                    $row         is rw,
    Int()                    $col         is rw,
    Int()                    $row_extents is rw,
    Int()                    $col_extents is rw,
    gboolean                 $is_selected is rw,
    CArray[Pointer[GError]]  $error              = gerror
  ) {
    my Int()     $idx              = $index;
    my gint     ($r, $c, $re, $ce) = 0 xx 4;
    my gboolean  $i                = 0;

    clear_error;
    my $rv = atspi_table_get_row_column_extents_at_index(
      $!at,
      $idx,
      $r,
      $c,
      $re,
      $ce,
      $i,
      $error
    );
    ($row, $col, $row_extents, $col_extents, $is_selected) =
      ($r, $c, $re, $ce, $i.so);
    set_error($error);
    $rv ?? ($row, $col, $row_extents, $col_extents, $is_selected)
        !! Nil;
  }

  method get_row_description (
    Int()                   $row,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $r = $row;

    clear_error;
    my $rv = atspi_table_get_row_description($!at, $r, $error);
    set_error($error);
    $rv;
  }

  method get_row_extent_at (
    Int()                   $row,
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint ($r, $c) = ($row, $column);

    clear_error;
    my $rv = atspi_table_get_row_extent_at($!at, $row, $column, $error);
    set_error($error);
    $rv;
  }

  method get_row_header (
    Int()                    $row,
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    my Int() $r = $row;

    clear_error;
    my $rv = atspi_table_get_row_header($!at, $r, $error);
    set_error($error);
    propReturnObject($rv, $raw, |ATSPI::Accessible.getTypePair);
  }

  method get_selected_columns (
    CArray[Pointer[GError]]  $error  = gerror,
                            :$garray = False,
                            :$raw    = False
  ) {
    clear_error;
    my $rv = atspi_table_get_selected_columns($!at, $error);
    set_error($error);
    return $rv if $raw && $garray.not;
    $rv = GLib::Array.new($rv);
    return $rv if $garray && $raw;
    $rv.Array(typed => Int, :signed);
  }

  method get_selected_rows (
    CArray[Pointer[GError]]  $error  = gerror,
                            :$garray = False,
                            :$raw    = False
  ) {
    clear_error;
    my $rv = atspi_table_get_selected_rows($!at, $error);
    set_error($error);
    return $rv if $raw && $garray.not;
    $rv = GLib::Array.new($rv);
    return $rv if $garray && $raw;
    $rv.Array(typed => Int, :signed);
  }

  method get_summary (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    clear_error;
    my $r = atspi_table_get_summary($!at, $error);
    set_error($error);
    propReturnObject($r, $raw, |ATSPI::Accessible.getTypePair);
  }

  method get_type {
    state ($n, $t);
    unstable_get_type( self.^name, &atspi_table_get_type, $n, $t );
  }

  method is_column_selected (
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $c = $column;

    clear_error;
    my $r = so atspi_table_is_column_selected($!at, $column, $error);
    set_error($error);
    $r;
  }

  method is_row_selected (
    Int()                   $row,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $r = $row;

    clear_error;
    my $rv = so atspi_table_is_row_selected($!at, $r, $error);
    set_error($error);
    $rv;
  }

  method is_selected (
    Int()                   $row,
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gint ($r, $c) = ($row, $column);

    clear_error;
    my $rv = so atspi_table_is_selected($!at, $row, $column, $error);
    set_error($error);
    $rv;
  }

  method remove_column_selection (
    Int()                   $column,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $c = $column;

    clear_error;
    my $r = so atspi_table_remove_column_selection($!at, $c, $error);
    set_error($error);
    $r;
  }

  method remove_row_selection (
    Int()                   $row,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my Int() $r = $row;

    clear_error;
    my $rv = atspi_table_remove_row_selection($!at, $r, $error);
    set_error($error);
    $rv;
  }

}

our subset AtspiTableAncestry is export of Mu
  where AtspiTable | GObject;

class ATSPI::Table {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Table;

  submethod BUILD ( :$atspi-table ) {
    self.setAtspiTable($atspi-table) if $atspi-table;
  }

  method setAtspiTable (AtspiTableAncestry $_) {
    my $to-parent;

    $!at = do {
      when AtspiTable {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiTable, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiTableAncestry $atspi-table, :$ref = True) {
    return Nil unless $atspi-table;

    my $o = self.bless( :$atspi-table );
    $o.ref if $ref;
    $o;
  }

}
