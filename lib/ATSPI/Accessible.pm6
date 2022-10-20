use v6.c;

use ATSPI::Raw::Types;
use ATSPI::Raw::Accessible;

use ATSPI::Object;

use GLib::Roles::Implementor;

class ATSPI::Accessible is ATSPI::Object {
  also does Positional;

  has AtspiAccessible $!aa is implementor;

  method AT-POS (\k) {
    self.get_child_at_index(k);
  }

  method clear_cache {
    atspi_accessible_clear_cache($!aa);
  }

  method get_accessible_id (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_accessible_id($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_action {
    propReturnObject
      atspi_accessible_get_action($!aa),
      $raw,
      |ATSPI::Action.getTypePair
    );
  }

  method get_action_iface ( :$raw = False) {
    propReturnObject
      atspi_accessible_get_action_iface($!aa),
      $raw,
      |ATSPI::Action.getTypePair
    );
  }

  method get_application (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    clear_error;
    my $mrv = atspi_accessible_get_application($!aa, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |self.getTypePair);
  }

  method get_atspi_version (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_atspi_version($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_attributes (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    clear_error;
    my $mrv = atspi_accessible_get_attributes($!aa, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |GLib::HashTable.getTypePair);
  }

  method get_attributes_as_array (
    CArray[Pointer[GError]]  $error  = gerror
                            :$raw    = False,
                            :$array  = True
  ) {
    clear_error;
    my $mrv = atspi_accessible_get_attributes_as_array($!aa, $error);
    set_error($error);
    $mrv;
    return $mrv if $raw;
    $mrv = GLib::Array.new($mrv);
    return $mrv unless $array;
    $mrv.Array;
  }

  method get_child_at_index (
    Int()                    $child_index,
    CArray[Pointer[GError]]  $error        = gerror,
                            :$raw          = False
  ) {
    my gint $c = $child_index;
    clear_error;
    my $mrv = atspi_accessible_get_child_at_index($!aa, $c, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |self.getTypePair);
  }

  method get_child_count (CArray[Pointer[GError]] $error = gerror) {
    atspi_accessible_get_child_count($!aa, $error);
  }

  method get_collection ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_collection($!aa),
      $raw,
      |ATSPI::Collection.getTypePair
    );
  }

  method get_collection_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_collection_iface($!aa),
      $raw,
      |ATSPI::Collection.getTypePair
    );
  }

  method get_component ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_component($!aa),
      $raw,
      |ATSPI::Component.getTypePair
    );
  }

  method get_component_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_component_iface($!aa),
      $raw,
      |ATSPI::Component.getTypePair
    );
  }

  method get_description (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_description($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_document ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_document($!aa);
      $raw,
      |ATSPI::Document.getTypePair
    );
  }

  method get_document_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_document_iface($!aa),
      $raw,
      |ATSPI::Document.getTypePair
    );
  }

  method get_editable_text ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_editable_text($!aa),
      $raw,
      |ATSPI::EditableText.getTypePair
    );
  }

  method get_editable_text_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_editable_text_iface($!aa),
      $raw,
      |ATSPI::EditableText.getTypePair
    );
  }

  method get_hyperlink ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_hyperlink($!aa),
      $raw,
      |ATSPI::HyperLink.getTypePair
    );
  }

  method get_hypertext ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_hypertext($!aa),
      $raw,
      |ATSPI::HyperText.getTypePair
    );
  }

  method get_hypertext_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_hypertext_iface($!aa),
      $raw,
      |ATSPI::HyperText.getTypePair
    );
  }

  method get_id (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_id($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_image ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_image($!aa),
      $raw,
      |ATSPI::Image.getTypePair
    );
  }

  method get_image_iface ( :$raw = False, :$array = True ) {
    my $mrv = atspi_accessible_get_image_iface($!aa);
    return $mrv if $raw;
    $mrv = GLib::Array.new($mrv);
    return $mrv unless $array;
    $mrv .= .Array
    return $mrv unless $object;
    $mrv.map({ ATSPI::Image.new($_) });
  }

  method get_index_in_parent (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_index_in_parent($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_interfaces ( :$raw = False, :$array = True ) {
    atspi_accessible_get_interfaces($!aa);
    return $mrv if $raw;
    $mrv = GLib::Array.new($mrv);
    return $mrv unless $array;
  }

  method get_localized_role_name (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_localized_role_name($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_name (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_name($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_object_locale (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_object_locale($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_parent (CArray[Pointer[GError]] $error = gerror, :$raw = False) {
    clear_error;
    my $mrv = atspi_accessible_get_parent($!aa, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |self.getTypePair)
  }

  method get_process_id (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_process_id($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_relation_set (
    CArray[Pointer[GError]] $error   = gerror,
                            :$raw    = False.
                            :$array  = True,
                            :$object = True
  ) {
    clear_error;
    my $mrv = atspi_accessible_get_relation_set($!aa, $error);
    set_error($error);
    return $mrv if $raw;
    $mrv = GLib::Array.new($mrv);
    return $mrv unless $array;
    $mrv = $mrv.Array
    return $mrv unless $object;
    $mrv.map({ ATSPI::Relation.new($_) });
  }

  method get_role (CArray[Pointer[GError]] $error = gerror, :$raw = False) {
    clear_error;
    my $mrv = atspi_accessible_get_role($!aa, $error);
    set_error($error);
    proppReturnObject($mrv, $raw, |ATSPI::Role.getTypePair)
  }

  method get_role_name (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_role_name($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_selection {
    propReturnObject(
      atspi_accessible_get_selection($!aa);
      $raw,
      |ATSPI::Selection.getTypePair
    )
  }

  method get_selection_iface {
    propReturnObject(
      atspi_accessible_get_selection_iface($!aa),
      $raw,
      |ATSPI::Selection.getTypePair
    )
  }

  method get_state_set (:$raw = False ) {
    propReturnObject(
      atspi_accessible_get_state_set($!aa),
      $raw,
      |ATSPI::StateSet.getTypePair
    )
  }

  method get_table {
    propReturnObject(
      atspi_accessible_get_table($!aa),
      $raw,
      |ATSPI::Table.getTypePair
    )
  }

  method get_table_cell {
    propReturnObject(
      atspi_accessible_get_table_cell($!aa);
      $raw,
      |ATSPI::TableCell.getTypePair
    )
  }

  method get_table_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_table_iface($!aa),
      $raw,
      |ATSPI::Table.getTypePair
    )
  }

  method get_text ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_text($!aa),
      $raw,
      |ATSPI::Text.getTypePair
    );
  }

  method get_text_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_text_iface($!aa),
      $raw,
      |ATSPI::Text.getTypePair
    );
  }

  method get_toolkit_name (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_toolkit_name($!aa, $error);
    clear_error;
    $mrv;
  }

  method get_toolkit_version (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $mrv = atspi_accessible_get_toolkit_version($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_accessible_get_type, $n, $t );
  }

  method get_value ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_value($!aa),
      $raw,
      |ATSPI::Value.getTypePair
    );
  }

  method get_value_iface ( :$raw = False ) {
    propReturnObject(
      atspi_accessible_get_value_iface($!aa),
      $raw,
      |ATSPI::Value.getTypePair
    );s
  }

  method set_cache_mask (AtspiCache() $mask) {
    atspi_accessible_set_cache_mask($!aa, $mask);
  }

}
