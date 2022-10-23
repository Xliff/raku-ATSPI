use v6.c;

use Method::Also;

use NativeCall;

use ATSPI::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AtspiMatchRuleAncestry is export of Mu
  where AtspiMatchRule | GObject;

class ATSPI::MatchRule {
  also does GLib::Roles::Object;

  has AtspiMatchRule $!amr is implementor;

  submethod BUILD ( :$atspi-match-rule ) {
    self.setAtspiMatchRule($atspi-match-rule) if $atspi-match-rule
  }

  method setAtspiMatchRule (AtspiMatchRuleAncestry $_) {
    my $to-parent;

    $!amr = do {
      when AtspiMatchRule {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AtspiMatchRule, $_);
      }
    }
    self!setObject($to-parent);
  }

  method ATSPI::Raw::Definitions::AtspiMatchRule
    is also<AtspiMatchRule>
  { $!amr }

  multi method new (AtspiMatchRuleAncestry $atspi-match-rule, :$ref = True) {
    return unless $atspi-match-rule;

    my $o = self.bless( :$atspi-match-rule );
    $o.ref if $ref;
    $o;
  }

  multi method new (
    :$attributematchtype,
    :$statematchtype,
    :$rolematchtype,
    :$interfacematchtype,
    :$invert                      = False,
    :$states              is copy = AtspiStateSet,
    :$attributes          is copy = GHashTable,
    :$roles               is copy = GArray,
    :$interfaces          is copy = GArray
  ) {
    for $states, $roles, $interfaces -> $v is raw {
      for <Array Set> {
        if $v.^can($_) {
          $v = $v."$_"();
          last;
        }
      }

      $states = $states.keys.Array if $states ~~ Set;
      die $v.VAR.name ~ ' cannot convert to Array!' unless $v ~~ Array;
      $v = GLib::Array::Integer.new($v);
    }

    $attributes .= Hash if $attributes.^can('Hash');
    die '$attributes cannot convert to Hash!' unless $attributes ~~ Hash;
    $attributes = GLib::HashTable.new($attributes);

    samewith(
      $states,
      $statematchtype,
      $attributes,
      $attributematchtype,
      $roles,
      $rolematchtype,
      $interfaces,
      $interfacematchtype,
      $invert
    )
  }
  multi method new (
    AtspiStateSet() $states,
    Int()           $statematchtype,
    GHashTable()    $attributes,
    Int()           $attributematchtype,
    GArray()        $roles,
    Int()           $rolematchtype,
    GArray()        $interfaces,
    Int()           $interfacematchtype,
    Int()           $invert
  ) {
    my AtspiCollectionMatchType $s = $statematchtype;
    my AtspiCollectionMatchType $a = $attributematchtype;
    my AtspiCollectionMatchType $r = $rolematchtype;
    my AtspiCollectionMatchType $i = $interfacematchtype;
    my gboolean                 $n = $invert.so.Int;

    my $atspi-match-rule = atspi_match_rule_new(
      $states,
      $s,
      $attributes,
      $a,
      $roles,
      $r,
      $interfaces,
      $i,
      $n
    );

    $atspi-match-rule ?? self.bless( :$atspi-match-rule ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &atspi_match_rule_get_type, $n, $t );
  }

}


### /usr/include/at-spi-2.0/atspi/atspi-matchrule.h

sub atspi_match_rule_get_type
  returns GType
  is      native(atspi)
  is      export
{ * }

sub atspi_match_rule_new (
  AtspiStateSet            $states,
  AtspiCollectionMatchType $statematchtype,
  GHashTable               $attributes,
  AtspiCollectionMatchType $attributematchtype,
  GArray                   $roles,
  AtspiCollectionMatchType $rolematchtype,
  GArray                   $interfaces,
  AtspiCollectionMatchType $interfacematchtype,
  gboolean                 $invert
)
  returns AtspiMatchRule
  is      native(atspi)
  is      export
{ * }
