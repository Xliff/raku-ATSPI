use v6.c;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::Document;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Document{
  has AtspiDocument $!ad is implementor;

  method roleInit-AtspiDocument {
    return if $!ad;

    my \i = findProperImplementor( self.^attributes );
    $!ad = cast( AtspiDocument, i.get_value(self) );
  }

  method ATSPI::Raw::Definitions::AtspiDocument { $!ad }
  method AtspiDocument                          { $!ad }

  method get_attribute_value (
    Str()                   $attribute,
    CArray[Pointer[GError]] $error      = gerror
  ) {
    clear_error;
    my $r = atspi_document_get_attribute_value($!ad, $attribute, $error);
    set_error($error);
    $r
  }

  method get_attributes (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    clear_error;
    my $r = atspi_document_get_attributes($!ad, $error);
    set_error($error);
    propReturnObject($r, $raw, |GLib::HashTable.getTypePair);
  }

  method get_current_page_number (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $r = atspi_document_get_current_page_number($!ad, $error);
    set_error($error);
    $r
  }

  method get_document_attribute_value (
    Str()                   $attribute,
    CArray[Pointer[GError]] $error      = gerror
  ) {
    clear_error;
    my $r = atspi_document_get_document_attribute_value(
      $!ad,
      $attribute,
      $error
    );
    set_error($error);
    $r
  }

  method get_document_attributes (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    clear_error;
    my $r = atspi_document_get_document_attributes($!ad, $error);
    set_error($error);
    propReturnObject($r, $raw, |GLib::HashTable.getTypePair);
  }

  method get_locale (
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $r = atspi_document_get_locale($!ad, $error);
    set_error($error);
    $r
  }

  method get_page_count (
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $r = atspi_document_get_page_count($!ad, $error);
    set_error($error);
    $r
  }

  method atspidocument_get_type {
    state ($n, $t);

    unstable_get_type(self.^name, &atspi_document_get_type, $n, $t );
  }

}

our subset AtspiDocumentAncestry is export of Mu
  where AtspiDocument | GObject;

class ATSPI::Documemt {
  also does GLib::Roles::Object;
  also does ATSPI::Roles::Document;

  submethod BUILD ( :$atspi-document ) {
    self.setAtspiDocument($atspi-document) if $atspi-document;
  }

  method setAtspiDocument (AtspiDocumentAncestry $_) {
    my $to-parent;

    $!ad = do {
      when AtspiDocument {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiDocument, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (AtspiDocumentAncestry $atspi-document, :$ref = True) {
    return Nil unless $atspi-document;

    my $o = self.bless( :$atspi-document );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.atspidocument_get_type;
  }

}
