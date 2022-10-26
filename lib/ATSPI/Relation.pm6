use v6.c;

use Method::Also;
use NativeCall;

use ATSPI::Raw::Types;

use ATSPI::Accessible;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AtspiRelationAncestry is export of Mu
  where AtspiRelation | GObject;

class ATSPI::Relation {
  also does GLib::Roles::Object;

  has AtspiRelation $!ar is implementor;

  submethod BUILD ( :$atspi-relation ) {
    self.setAtspiRelation($atspi-relation) if $atspi-relation
  }

  method setAtspiRelation (AtspiRelationAncestry $_) {
    my $to-parent;

    $!ar = do {
      when AtspiRelation {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiRelation, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Cogl::Raw::Definitions::AtspiRelation
    is also<AtspiRelation>
  { $!ar }

  multi method new (AtspiRelationAncestry $atspi-relation, :$ref = True) {
    return unless $atspi-relation;

    my $o = self.bless( :$atspi-relation );
    $o.ref if $ref;
    $o;
  }

  method get_n_targets
    is also<
      get-n-targets
      elems
    >
  {
    atspi_relation_get_n_targets($!ar);
  }

  method get_relation_type ( :$enum = True ) is also<get-relation-type> {
    my $r = atspi_relation_get_relation_type($!ar);
    return $r unless $enum;
    AtspiRelationType($r)
  }

  method get_target (Int() $i, :$raw = False) is also<get-target> {
    my gint $ii = $i;

    propReturnObject(
      atspi_relation_get_target($!ar, $ii),
      $raw,
      |ATSPI::Accessible.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_relation_get_type, $n, $t );
  }

}

### /usr/include/at-spi-2.0/atspi/atspi-relation.h

sub atspi_relation_get_n_targets (
  AtspiRelation $obj
)
  returns gint
  is      native(atspi)
  is      export
{ * }

sub atspi_relation_get_relation_type (
  AtspiRelation $obj
)
  returns AtspiRelationType
  is      native(atspi)
  is      export
{ * }

sub atspi_relation_get_target (
  AtspiRelation $obj,
  gint          $i
)
  returns AtspiAccessible
  is      native(atspi)
  is      export
{ * }

sub atspi_relation_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }
