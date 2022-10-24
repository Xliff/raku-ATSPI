use v6.c;

use NativeCall;

use ATSPI::Raw::Types;
use ATSPI::Raw::Collection;

use GLib::Array;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role ATSPI::Roles::Collection {
  has AtspiCollection $!ac is implementor;

  method get_active_descendant (
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False,
  ) {
    clear_error;
    my $r = atspi_collection_get_active_descendant($!ac, $error);
    set_error($error);
    #propReturnObject($r, $raw, |ATSPI::Accessible.getTypePair);
    Nil;
  }

  method get_matches (
    AtspiMatchRule()          $rule,
    Int()                     $sortby,
    Int()                     $count    = 0,
    Int()                     $traverse = 0,
    CArray[Pointer[GError]]   $error    = gerror,
                             :$raw      = False,
                             :$garray   = False
  ) {
    my AtspiCollectionSortOrder $s = $sortby;
    my gint                     $c = $count;
    my gboolean                 $t = $traverse.so.Int;

    clear_error;
    my $r = atspi_collection_get_matches(
      $!ac,
      $rule,
      $s,
      $c,
      0,      # $t when enabled
      $error
    );
    set_error($error);
    returnGArray($r, $raw, $garray, |ATSPI::Accessible.getTypePair);
  }

  method get_matches_from (
    AtspiAccessible()         $current_object,
    AtspiMatchRule()          $rule,
    Int()                     $sortby,
    Int()                     $tree,
    Int()                     $count           = 0,
    Int()                     $traverse        = 0,
    CArray[Pointer[GError]]   $error           = gerror,
                             :$raw             = False,
                             :$garray          = False
  ) {
    my AtspiCollectionSortOrder         $s  = $sortby;
    my gint                             $c  = $count;
    my gboolean                         $t  = $traverse.so.Int;
    my AtspiCollectionTreeTraversalType $tr = $tree;

    clear_error;
    my $r = atspi_collection_get_matches_from(
      $!ac,
      $current_object,
      $rule,
      $s,
      $tr,
      $c,
      $t,
      $error
    );
    set_error($error);
    returnGArray($r, $raw, $garray, |ATSPI::Accessible.getTypePair);
  }

  method get_matches_to (
    AtspiAccessible()        $current_object,
    AtspiMatchRule()         $rule,
    Int()                    $sortby,
    Int()                    $tree,
    Int()                    $limit_scope,
    Int()                    $count           = 0,
    Int()                    $traverse        = 0,
    CArray[Pointer[GError]]  $error           = gerror,
                            :$raw             = False,
                            :$garray          = False
  ) {
    my AtspiCollectionSortOrder         $s  = $sortby;
    my gint                             $c  = $count;
    my gboolean                         $t  = $traverse.so.Int;
    my gboolean                         $l  = $limit_scope.so.Int;
    my AtspiCollectionTreeTraversalType $tr = $tree;

    clear_error;
    my $r = atspi_collection_get_matches_to(
      $!ac,
      $current_object,
      $rule,
      $s,
      $t,
      $l,
      $c,
      $tr,
      $error
    );
    set_error($error);
    returnGArray($r, $raw, $garray, |ATSPI::Accessible.getTypePair);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(self.^name, &atspi_collection_get_type, $n, $t );
  }

  method is_ancestor_of (
    AtspiAccessible()       $test,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $r = so atspi_collection_is_ancestor_of($!ac, $test, $error);
    set_error($error);
    $r
  }

}
