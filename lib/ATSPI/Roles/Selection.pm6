use v6.c;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::Selection;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Selection {
  has AtspiSelection $!as is implementor;

  method roleInit-AtspiSelection {
    return if $!as;

    my \i = findProperImplementor( self.^attributes );
    $!as = cast( AtspiSelection, i.get_value(self) );
  }

  method ATSPI::Raw::Definitions::AtspiSelection { $!as }
  method AtspiSelection                          { $!as }


  method clear_selection (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = so atspi_selection_clear_selection($!as, $error);
    set_error($error);
    $r
  }

  method deselect_child (
    Int()                   $child_index,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my gint $c = $child_index;

    clear_error;
    my $r = so atspi_selection_deselect_child($!as, $child_index, $error);
    set_error($error);
    $r
  }

  method deselect_selected_child (
    Int()                   $selected_child_index,
    CArray[Pointer[GError]] $error                 = gerror
  ) {
    my gint $s = $selected_child_index;

    clear_error;
    my $r = so atspi_selection_deselect_selected_child($!as, $s, $error);
    set_error($error);
    $r
  }

  method get_n_selected_children (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_selection_get_n_selected_children($!as, $error);
    set_error($error);
    $r
  }

  method get_selected_child (
    Int()                   $selected_child_index,
    CArray[Pointer[GError]] $error                 = gerror
  ) {
    clear_error;
    my $r = atspi_selection_get_selected_child(
      $!as,
      $selected_child_index,
      $error
    );
    set_error($error);
    $r
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_selection_get_type, $n, $t );
  }

  method is_child_selected (
    Int()                   $child_index,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my gint $c = $child_index;

    clear_error;
    my $r = so atspi_selection_is_child_selected($!as, $child_index, $error);
    set_error($error);
    $r
  }

  method select_all (
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $r = so atspi_selection_select_all($!as, $error);
    set_error($error);
    $r
  }

  method select_child (
    Int()                    $child_index,
    CArray[Pointer[GError]]  $error        = gerror,
                            :$raw          = False
  ) {
    my gint $c = $child_index;

    clear_error;
    my $r = atspi_selection_select_child($!as, $child_index, $error);
    set_error($error);
    propReturnObject($r, $raw, |::('ATSPI::Accessible').getTypePair)
  }

}

our subset AtspiSelectionAncestry is export of Mu
  where AtspiSelection | GObject;

class ATSPI::Selection {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Selection;

  submethod BUILD ( :$atspi-selection ) {
    self.setAtspiSelection($atspi-selection) if $atspi-selection;
  }

  method setAtspiSelection (AtspiSelectionAncestry $_) {
    my $to-parent;

    $!as = do {
      when AtspiSelection {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiSelection, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiSelectionAncestry $atspi-selection, :$ref = True) {
    return Nil unless $atspi-selection;

    my $o = self.bless( :$atspi-selection );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.atspiselection_get_type;
  }

}
