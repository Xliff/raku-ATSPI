use v6.c;

use ATSPI::Raw::Types;
use ATSPI::Raw::Main;

use GLib::Roles::StaticClass;

class ATSPI::Main {
  also does GLib::Roles::StaticClass;

  method event_main {
    atspi_event_main();
  }

  method event_quit {
    atspi_event_quit();
  }

  method exit {
    atspi_exit();
  }

  method get_a11y_bus ( :$raw = False ) {
    propReturnObject(
      atspi_get_a11y_bus(),
      $raw,
      |GLib::DBus::Connection.getTypePair
    );
  }

  method init {
    atspi_init();
  }

  method is_initialized {
    so atspi_is_initialized();
  }

  method role_get_name (Int() $role) {
    my AtspiRole $r = $role;

    atspi_role_get_name($r);
  }

  method set_main_context (GMainContext() $cnx) {
    atspi_set_main_context($cnx);
  }

  method set_timeout (Int() $val, Int() $startup_time) {
    my gint ($v, $s) = ($val, $startup_time);

    atspi_set_timeout($v, $s);
  }

}
