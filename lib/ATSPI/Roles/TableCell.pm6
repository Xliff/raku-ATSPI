use v6.c;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::TableCell;

use GLib::Array;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::TableCell {
  has AtspiTableCell $!atc is implementor;

  method roleInit-AtspiTableCell {
    return if $!atc;

    my \i = findProperImplementor( self.^attributes );
    $!atc = cast( AtspiTableCell, i.get_value(self) );
  }

  method ATSPI::Raw::Definitions::AtspiTableCell { $!atc }
  method AtspiTableCell                          { $!atc }

  method get_column_header_cells (
    CArray[Pointer[GError]]  $error  = gerror,
                            :$raw    = False,
                            :$garray = False
  ) {
    clear_error;
    my $r = atspi_table_cell_get_column_header_cells($!atc, $error);
    set_error($error);
    returnGArray($r, $raw, $garray, |::('ATSPI::Accessible').getTypePair);
  }

  method get_column_index (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_table_cell_get_column_index($!atc, $error);
    set_error($error);
    $r
  }

  method get_column_span (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_table_cell_get_column_span($!atc, $error);
    set_error($error);
    $r
  }

  proto method get_position (|)
  { * }

  multi method get_position (
    CArray[Pointer[GError]]  $error = gerror,
                            :$all   = True
  ) {
    samewith($, $, $error, :$all);
  }
  multi method get_position (
                             $row    is rw,
                             $column is rw,
    CArray[Pointer[GError]]  $error         = gerror,
                            :$all           = False
  ) {
    my gint ($r, $c) = ($row, $column);

    clear_error;
    my $rv = atspi_table_cell_get_position($!atc, $r, $c, $error);
    set_error($error);
    ($row, $column) = ($r, $c);
    $all.not ?? $rv !! ($rv, $row, $column)
  }

  proto method get_row_column_span (|)
  { * }

  multi method get_row_column_span (
    CArray[Pointer[GError]]  $error = gerror,
                            :$all   = True
  ) {
    samewith($, $, $, $, $error, :$all);
  }
  multi method get_row_column_span (
                             $row         is rw,
                             $column      is rw,
                             $row_span    is rw,
                             $column_span is rw,
    CArray[Pointer[GError]]  $error              = gerror,
                            :$all                = False
  ) {
    my gint ($r, $c, $rs, $cs) = 0 xx 4;

    clear_error;
    my $rv = atspi_table_cell_get_row_column_span(
      $!atc,
      $r,
      $c,
      $rs,
      $cs,
      $error
    );
    ($row, $column, $row_span, $column_span) = ($r, $c, $rs, $cs);
    set_error($error);
    $all.not ?? $rv !! ($rv, $row, $column, $row_span, $column_span)
  }

  method get_row_header_cells (
    CArray[Pointer[GError]]  $error  = gerror,
                            :$raw    = False,
                            :$garray = False
  ) {
    clear_error;
    my $r = atspi_table_cell_get_row_header_cells($!atc, $error);
    set_error($error);
    returnGArray($r, $raw, $garray, |::('ATSPI::Accessible').getTypePair);
  }

  method get_row_span (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_table_cell_get_row_span($!atc, $error);
    set_error($error);
    $r
  }

  method get_table (CArray[Pointer[GError]] $error = gerror, :$raw = False) {
    clear_error;
    my $r = atspi_table_cell_get_table($!atc, $error);
    set_error($error);
    propReturnObject($r, $raw, |::('ATSPI::Accessible').getTypePair);
  }

  method atspitablecell_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_table_cell_get_type, $n, $t );
  }

}

our subset AtspiTableCellAncestry is export of Mu
  where AtspiTableCell | GObject;

class ATSPI::TableCell {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::TableCell;

  submethod BUILD ( :$atspi-tablecell ) {
    self.setAtspiTableCell($atspi-tablecell) if $atspi-tablecell;
  }

  method setAtspiTableCell (AtspiTableCellAncestry $_) {
    my $to-parent;

    $!atc = do {
      when AtspiTableCell {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiTableCell, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new ($atspi-tablecell, :$ref = True) {
    return Nil unless $atspi-tablecell;
    my $o = self.bless( :$atspi-tablecell );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.atspitablecell_get_type;
  }

}
