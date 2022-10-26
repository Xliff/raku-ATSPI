use v6.c;

use Method::Also;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::Accessible;

use GLib::Array;
use ATSPI::Hyperlink;
use ATSPI::Object;
use ATSPI::StateSet;

use GLib::Roles::Implementor;

use ATSPI::Roles::Action;
use ATSPI::Roles::Collection;
use ATSPI::Roles::Component;
use ATSPI::Roles::Document;
use ATSPI::Roles::EditableText;
use ATSPI::Roles::Hypertext;
use ATSPI::Roles::Image;
use ATSPI::Roles::Selection;
use ATSPI::Roles::TableCell;
use ATSPI::Roles::Table;
use ATSPI::Roles::Text;
use ATSPI::Roles::Value;

class ATSPI::Accessible is ATSPI::Object {
  also does Positional;

  has AtspiAccessible $!aa is implementor;

  method AT-POS (\k) {
    self.get_child_at_index(k);
  }

  method Array {
    my $array = [];
    $array.push: self.[$_] for ^self.get_child_count;
  }

  method clear_cache is also<clear-cache> {
    atspi_accessible_clear_cache($!aa);
  }

  method get_accessible_id (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-accessible-id
      accessible_id
      accessible-id
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_accessible_id($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_action ( :$raw = False )
    is also<
      get-action
      action
    >
  {
    propReturnObject(
      atspi_accessible_get_action($!aa),
      $raw,
      |ATSPI::Action.getTypePair
    );
  }

  method get_action_iface ( :$raw = False) is also<get-action-iface> {
    propReturnObject(
      atspi_accessible_get_action_iface($!aa),
      $raw,
      |ATSPI::Action.getTypePair
    );
  }

  method get_application (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  )
    is also<
      get-application
      application
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_application($!aa, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |self.getTypePair);
  }

  method get_atspi_version (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-atspi-version
      atspi_version
      atspi-version
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_atspi_version($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_attributes (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  )
    is also<
      get-attributes
      attributes
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_attributes($!aa, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |GLib::HashTable.getTypePair);
  }

  method get_attributes_as_array (
    CArray[Pointer[GError]]  $error  = gerror,
                            :$raw    = False,
                            :$garray = True
  )
    is also<get-attributes-as-array>
  {
    clear_error;
    my $mrv = atspi_accessible_get_attributes_as_array($!aa, $error);
    set_error($error);
    returnGArray($mrv, $raw, $garray, Str);
  }

  method get_child_at_index (
    Int()                    $child_index,
    CArray[Pointer[GError]]  $error        = gerror,
                            :$raw          = False
  )
    is also<get-child-at-index>
  {
    my gint $c = $child_index;

    clear_error;
    my $mrv = atspi_accessible_get_child_at_index($!aa, $c, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |self.getTypePair);
  }

  method get_child_count (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-child-count
      elems
    >
  {
    atspi_accessible_get_child_count($!aa, $error);
  }

  method get_collection ( :$raw = False )
    is also<
      get-collection
      collection
    >
  {
    propReturnObject(
      atspi_accessible_get_collection($!aa),
      $raw,
      |ATSPI::Collection.getTypePair
    );
  }

  method get_collection_iface ( :$raw = False ) is also<get-collection-iface> {
    propReturnObject(
      atspi_accessible_get_collection_iface($!aa),
      $raw,
      |ATSPI::Collection.getTypePair
    );
  }

  method get_component ( :$raw = False )
    is also<
      get-component
      component
    >
  {
    propReturnObject(
      atspi_accessible_get_component($!aa),
      $raw,
      |ATSPI::Component.getTypePair
    );
  }

  method get_component_iface ( :$raw = False ) is also<get-component-iface> {
    propReturnObject(
      atspi_accessible_get_component_iface($!aa),
      $raw,
      |ATSPI::Component.getTypePair
    );
  }

  method get_description (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-description
      description
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_description($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_document ( :$raw = False )
    is also<
      get-document
      document
    >
  {
    propReturnObject(
      atspi_accessible_get_document($!aa);
      $raw,
      |ATSPI::Document.getTypePair
    );
  }

  method get_document_iface ( :$raw = False ) is also<get-document-iface> {
    propReturnObject(
      atspi_accessible_get_document_iface($!aa),
      $raw,
      |ATSPI::Document.getTypePair
    );
  }

  method get_editable_text ( :$raw = False )
    is also<
      get-editable-text
      editable_text
      editable-text
    >
  {
    propReturnObject(
      atspi_accessible_get_editable_text($!aa),
      $raw,
      |ATSPI::EditableText.getTypePair
    );
  }

  method get_editable_text_iface ( :$raw = False )
    is also<get-editable-text-iface>
  {
    propReturnObject(
      atspi_accessible_get_editable_text_iface($!aa),
      $raw,
      |ATSPI::EditableText.getTypePair
    );
  }

  method get_hyperlink ( :$raw = False )
    is also<
      get-hyperlink
      hyperlink
    >
  {
    propReturnObject(
      atspi_accessible_get_hyperlink($!aa),
      $raw,
      |ATSPI::Hyperlink.getTypePair
    );
  }

  method get_hypertext ( :$raw = False )
    is also<
      get-hypertext
      hypertext
    >
  {
    propReturnObject(
      atspi_accessible_get_hypertext($!aa),
      $raw,
      |ATSPI::Hypertext.getTypePair
    );
  }

  method get_hypertext_iface ( :$raw = False ) is also<get-hypertext-iface> {
    propReturnObject(
      atspi_accessible_get_hypertext_iface($!aa),
      $raw,
      |ATSPI::Hypertext.getTypePair
    );
  }

  method get_id (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-id
      id
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_id($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_image ( :$raw = False )
    is also<
      get-image
      image
    >
  {
    propReturnObject(
      atspi_accessible_get_image($!aa),
      $raw,
      |ATSPI::Image.getTypePair
    );
  }

  method get_image_iface ( :$raw = False, :$garray = True )
    is also<get-image-iface>
  {
    returnGArray(
      atspi_accessible_get_image_iface($!aa),
      $raw,
      $garray,
      |ATSPI::Image.getTypePair
    );
  }

  method get_index_in_parent (CArray[Pointer[GError]] $error = gerror)
    is also<get-index-in-parent>
  {
    clear_error;
    my $mrv = atspi_accessible_get_index_in_parent($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_interfaces ( :$raw = False, :$garray = True )
    is also<
      get-interfaces
      interfaces
    >
  {
    returnGArray(
      atspi_accessible_get_interfaces($!aa),
      $raw,
      $garray,
      Str
    );
  }

  method get_localized_role_name (CArray[Pointer[GError]] $error = gerror)
    is also<get-localized-role-name>
  {
    clear_error;
    my $mrv = atspi_accessible_get_localized_role_name($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_name (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-name
      name
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_name($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_object_locale (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-object-locale
      object_locale
      object-locale
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_object_locale($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_parent (CArray[Pointer[GError]] $error = gerror, :$raw = False)
    is also<
      get-parent
      parent
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_parent($!aa, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |self.getTypePair)
  }

  method get_process_id (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-process-id
      process_id
      process-id
      pid
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_process_id($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_relation_set (
    CArray[Pointer[GError]] $error    = gerror,
                            :$raw     = False,
                            :$garray  = True,
                            :$object  = True
  )
    is also<
      get-relation-set
      relation_set
      relation-set
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_relation_set($!aa, $error);
    set_error($error);
    returnGArray($mrv, $raw, $garray, |ATSPI::Relation.getTypePair);
  }

  method get_role (CArray[Pointer[GError]] $error = gerror, :$raw = False)
    is also<
      get-role
      role
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_role($!aa, $error);
    set_error($error);
    propReturnObject($mrv, $raw, |ATSPI::Role.getTypePair)
  }

  method get_role_name (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-role-name
      role_name
      role-name
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_role_name($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_selection ( :$raw = False )
    is also<
      get-selection
      selection
    >
  {
    propReturnObject(
      atspi_accessible_get_selection($!aa);
      $raw,
      |ATSPI::Selection.getTypePair
    )
  }

  method get_selection_iface ( :$raw = False ) is also<get-selection-iface> {
    propReturnObject(
      atspi_accessible_get_selection_iface($!aa),
      $raw,
      |ATSPI::Selection.getTypePair
    )
  }

  method get_state_set ( :$raw = False )
    is also<
      get-state-set
      state_set
      state-set
    >
  {
    propReturnObject(
      atspi_accessible_get_state_set($!aa),
      $raw,
      |ATSPI::StateSet.getTypePair
    )
  }

  method get_table ( :$raw = False )
    is also<
      get-table
      table
    >
  {
    propReturnObject(
      atspi_accessible_get_table($!aa),
      $raw,
      |ATSPI::Table.getTypePair
    )
  }

  method get_table_cell ( :$raw = False )
    is also<
      get-table-cell
      table_cell
      table-cell
    >
  {
    propReturnObject(
      atspi_accessible_get_table_cell($!aa);
      $raw,
      |ATSPI::TableCell.getTypePair
    )
  }

  method get_table_iface ( :$raw = False ) is also<get-table-iface> {
    propReturnObject(
      atspi_accessible_get_table_iface($!aa),
      $raw,
      |ATSPI::Table.getTypePair
    )
  }

  method get_text ( :$raw = False )
    is also<
      get-text
      text
    >
  {
    propReturnObject(
      atspi_accessible_get_text($!aa),
      $raw,
      |ATSPI::Text.getTypePair
    );
  }

  method get_text_iface ( :$raw = False ) is also<get-text-iface> {
    propReturnObject(
      atspi_accessible_get_text_iface($!aa),
      $raw,
      |ATSPI::Text.getTypePair
    );
  }

  method get_toolkit_name (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-toolkit-name
      toolkit_name
      toolkit-name
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_toolkit_name($!aa, $error);
    clear_error;
    $mrv;
  }

  method get_toolkit_version (CArray[Pointer[GError]] $error = gerror)
    is also<
      get-toolkit-version
      toolkit_version
      toolkit-version
    >
  {
    clear_error;
    my $mrv = atspi_accessible_get_toolkit_version($!aa, $error);
    set_error($error);
    $mrv;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_accessible_get_type, $n, $t );
  }

  method get_value ( :$raw = False )
    is also<
      get-value
      value
    >
  {
    propReturnObject(
      atspi_accessible_get_value($!aa),
      $raw,
      |ATSPI::Value.getTypePair
    );
  }

  method get_value_iface ( :$raw = False ) is also<get-value-iface> {
    propReturnObject(
      atspi_accessible_get_value_iface($!aa),
      $raw,
      |ATSPI::Value.getTypePair
    );
  }

  method set_cache_mask (AtspiCache() $mask) is also<set-cache-mask> {
    atspi_accessible_set_cache_mask($!aa, $mask);
  }

}
