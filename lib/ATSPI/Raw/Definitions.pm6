use v6.c;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package ATSPI::Raw::Definitions;

constant atspi is export = 'atspi-1.0,v0';

class AtspiImage      is repr<CPointer> does GLib::Roles::Pointers is export { }
class AtspiHypertext  is repr<CPointer> does GLib::Roles::Pointers is export { }
class AtspiTable      is repr<CPointer> does GLib::Roles::Pointers is export { }
class AtspiText       is repr<CPointer> does GLib::Roles::Pointers is export { }

constant ATSPI_LOCALE_TYPE_COUNT                     is export = (5+1);
constant ATSPI_COORD_TYPE_COUNT                      is export = (2+1);
constant ATSPI_SORTORDER_COUNT                       is export = (7+1);
constant ATSPI_MATCHTYPES_COUNT                      is export = (5+1);
constant ATSPI_TREETRAVERSALTYPE_COUNT               is export = (3+1);
constant ATSPI_COMPONENTLAYER_COUNT                  is export = (8+1);
constant ATSPI_TEXT_BOUNDARY_TYPE_COUNT              is export = (6+1);
constant ATSPI_TEXT_CLIP_TYPE_COUNT                  is export = (3+1);
constant ATSPI_STATETYPE_COUNT                       is export = (41+1);
constant ATSPI_KEYEVENTTYPE_COUNT                    is export = (1+1);
constant ATSPI_EVENTTYPE_COUNT                       is export = (3+1);
constant ATSPI_KEYSYNTHTYPE_COUNT                    is export = (4+1);
constant ATSPI_MODIFIERTYPE_COUNT                    is export = (7+1);
constant ATSPI_RELATIONTYPE_COUNT                    is export = (23+1);
constant ATSPI_ROLE_COUNT                            is export = (129+1);
constant ATSPI_SCROLLTYPE_COUNT                      is export = (6+1);

constant ATSPI_DBUS_INTERFACE_ACCESSIBLE             is export = 'org.a11y.atspi.Accessible';
constant ATSPI_DBUS_INTERFACE_ACTION                 is export = 'org.a11y.atspi.Action';
constant ATSPI_DBUS_INTERFACE_APPLICATION            is export = 'org.a11y.atspi.Application';
constant ATSPI_DBUS_INTERFACE_CACHE                  is export = 'org.a11y.atspi.Cache';
constant ATSPI_DBUS_INTERFACE_COLLECTION             is export = 'org.a11y.atspi.Collection';
constant ATSPI_DBUS_INTERFACE_COMPONENT              is export = 'org.a11y.atspi.Component';
constant ATSPI_DBUS_INTERFACE_DEC                    is export = 'org.a11y.atspi.DeviceEventController';
constant ATSPI_DBUS_INTERFACE_DEVICE_EVENT_LISTENER  is export = 'org.a11y.atspi.DeviceEventListener';
constant ATSPI_DBUS_INTERFACE_DOCUMENT               is export = 'org.a11y.atspi.Document';
constant ATSPI_DBUS_INTERFACE_EDITABLE_TEXT          is export = 'org.a11y.atspi.EditableText';
constant ATSPI_DBUS_INTERFACE_EVENT_KEYBOARD         is export = 'org.a11y.atspi.Event.Keyboard';
constant ATSPI_DBUS_INTERFACE_EVENT_MOUSE            is export = 'org.a11y.atspi.Event.Mouse';
constant ATSPI_DBUS_INTERFACE_EVENT_OBJECT           is export = 'org.a11y.atspi.Event.Object';
constant ATSPI_DBUS_INTERFACE_EVENT_SCREEN_READER    is export = 'org.a11y.atspi.Event.ScreenReader';
constant ATSPI_DBUS_INTERFACE_HYPERLINK              is export = 'org.a11y.atspi.Hyperlink';
constant ATSPI_DBUS_INTERFACE_HYPERTEXT              is export = 'org.a11y.atspi.Hypertext';
constant ATSPI_DBUS_INTERFACE_IMAGE                  is export = 'org.a11y.atspi.Image';
constant ATSPI_DBUS_INTERFACE_REGISTRY               is export = 'org.a11y.atspi.Registry';
constant ATSPI_DBUS_INTERFACE_SELECTION              is export = 'org.a11y.atspi.Selection';
constant ATSPI_DBUS_INTERFACE_SOCKET                 is export = 'org.a11y.atspi.Socket';
constant ATSPI_DBUS_INTERFACE_TABLE                  is export = 'org.a11y.atspi.Table';
constant ATSPI_DBUS_INTERFACE_TABLE_CELL             is export = 'org.a11y.atspi.TableCell';
constant ATSPI_DBUS_INTERFACE_TEXT                   is export = 'org.a11y.atspi.Text';
constant ATSPI_DBUS_INTERFACE_VALUE                  is export = 'org.a11y.atspi.Value';
constant ATSPI_DBUS_NAME_REGISTRY                    is export = 'org.a11y.atspi.Registry';
constant ATSPI_DBUS_PATH_DEC                         is export = '/org/a11y/atspi/registry/deviceeventcontroller';
constant ATSPI_DBUS_PATH_NULL                        is export = '/org/a11y/atspi/null';
constant ATSPI_DBUS_PATH_REGISTRY                    is export = '/org/a11y/atspi/registry';
constant ATSPI_DBUS_PATH_ROOT                        is export = '/org/a11y/atspi/accessible/root';
constant ATSPI_DBUS_PATH_SCREEN_READER               is export = '/org/a11y/atspi/screenreader';
