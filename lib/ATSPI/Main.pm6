use v6.c;

use Method::Also;

use ATSPI::Raw::Types;
use ATSPI::Raw::Main;

use GLib::Roles::StaticClass;

class ATSPI::Main {
  also does GLib::Roles::StaticClass;

  method event_main is also<event-main> {
    atspi_event_main();
  }

  method event_quit is also<event-quit> {
    atspi_event_quit();
  }

  method exit {
    atspi_exit();
  }

  method get_a11y_bus ( :$raw = False ) is also<get-a11y-bus> {
    propReturnObject(
      atspi_get_a11y_bus(),
      $raw,
      |GLib::DBus::Connection.getTypePair
    );
  }

  method init {
    atspi_init();
  }

  method is_initialized is also<is-initialized> {
    so atspi_is_initialized();
  }

  method role_get_name (Int() $role) is also<role-get-name> {
    my AtspiRole $r = $role;

    atspi_role_get_name($r);
  }

  method set_main_context (GMainContext() $cnx) is also<set-main-context> {
    atspi_set_main_context($cnx);
  }

  method set_timeout (Int() $val, Int() $startup_time) is also<set-timeout> {
    my gint ($v, $s) = ($val, $startup_time);

    atspi_set_timeout($v, $s);
  }

}

use MONKEY-TYPING;

use GIO::DBus::Connection;
augment class GIO::DBus::Connection {

  method setup_with_g_main (
    GMainContext() $context
  )
    is also<setup-with-g-main>
  {
    atspi_dbus_connection_setup_with_g_main(
      self.GDBusConnection,
      $context
    );
  }

}

use GIO::DBus::Server;
augment class GIO::DBus::Server {

  method server_setup_with_g_main (GMainContext() $context) is also<server-setup-with-g-main> {
    atspi_dbus_server_setup_with_g_main(
      self.GDBusServer,
      $context
    );
  }

}
