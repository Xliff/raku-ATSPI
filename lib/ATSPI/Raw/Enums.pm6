use v6.c;

use GLib::Raw::Definitions;

unit package ATSPI::Raw::Enums;

constant AtspiCollectionMatchType is export := guint32;
our enum AtspiCollectionMatchTypeEnum is export <
  ATSPI_Collection_MATCH_INVALID
  ATSPI_Collection_MATCH_ALL
  ATSPI_Collection_MATCH_ANY
  ATSPI_Collection_MATCH_NONE
  ATSPI_Collection_MATCH_EMPTY
  ATSPI_Collection_MATCH_LAST_DEFINED
>;

constant AtspiCollectionSortOrder is export := guint32;
our enum AtspiCollectionSortOrderEnum is export <
  ATSPI_Collection_SORT_ORDER_INVALID
  ATSPI_Collection_SORT_ORDER_CANONICAL
  ATSPI_Collection_SORT_ORDER_FLOW
  ATSPI_Collection_SORT_ORDER_TAB
  ATSPI_Collection_SORT_ORDER_REVERSE_CANONICAL
  ATSPI_Collection_SORT_ORDER_REVERSE_FLOW
  ATSPI_Collection_SORT_ORDER_REVERSE_TAB
  ATSPI_Collection_SORT_ORDER_LAST_DEFINED
>;

constant AtspiCollectionTreeTraversalType is export := guint32;
our enum AtspiCollectionTreeTraversalTypeEnum is export <
  ATSPI_Collection_TREE_RESTRICT_CHILDREN
  ATSPI_Collection_TREE_RESTRICT_SIBLING
  ATSPI_Collection_TREE_INORDER
  ATSPI_Collection_TREE_LAST_DEFINED
>;

constant AtspiComponentLayer is export := guint32;
our enum AtspiComponentLayerEnum is export <
  ATSPI_LAYER_INVALID
  ATSPI_LAYER_BACKGROUND
  ATSPI_LAYER_CANVAS
  ATSPI_LAYER_WIDGET
  ATSPI_LAYER_MDI
  ATSPI_LAYER_POPUP
  ATSPI_LAYER_OVERLAY
  ATSPI_LAYER_WINDOW
  ATSPI_LAYER_LAST_DEFINED
>;

constant AtspiCoordType is export := guint32;
our enum AtspiCoordTypeEnum is export <
  ATSPI_COORD_TYPE_SCREEN
  ATSPI_COORD_TYPE_WINDOW
  ATSPI_COORD_TYPE_PARENT
>;

constant AtspiEventType is export := guint32;
our enum AtspiEventTypeEnum is export <
  ATSPI_KEY_PRESSED_EVENT
  ATSPI_KEY_RELEASED_EVENT
  ATSPI_BUTTON_PRESSED_EVENT
  ATSPI_BUTTON_RELEASED_EVENT
>;

constant AtspiKeyEventType is export := guint32;
our enum AtspiKeyEventTypeEnum is export <
  ATSPI_KEY_PRESSED
  ATSPI_KEY_RELEASED
>;

constant AtspiKeyListenerSyncType is export := guint32;
our enum AtspiKeyListenerSyncTypeEnum is export (
  ATSPI_KEYLISTENER_NOSYNC      =>        0,
  ATSPI_KEYLISTENER_SYNCHRONOUS => 1  +<  0,
  ATSPI_KEYLISTENER_CANCONSUME  => 1  +<  1,
  ATSPI_KEYLISTENER_ALL_WINDOWS => 1  +<  2,
);

constant AtspiKeySynthType is export := guint32;
our enum AtspiKeySynthTypeEnum is export <
  ATSPI_KEY_PRESS
  ATSPI_KEY_RELEASE
  ATSPI_KEY_PRESSRELEASE
  ATSPI_KEY_SYM
  ATSPI_KEY_STRING
  ATSPI_KEY_LOCKMODIFIERS
  ATSPI_KEY_UNLOCKMODIFIERS
>;

constant AtspiLocaleType is export := guint32;
our enum AtspiLocaleTypeEnum is export <
  ATSPI_LOCALE_TYPE_MESSAGES
  ATSPI_LOCALE_TYPE_COLLATE
  ATSPI_LOCALE_TYPE_CTYPE
  ATSPI_LOCALE_TYPE_MONETARY
  ATSPI_LOCALE_TYPE_NUMERIC
  ATSPI_LOCALE_TYPE_TIME
>;

constant AtspiModifierType is export := guint32;
our enum AtspiModifierTypeEnum is export (
  'ATSPI_MODIFIER_SHIFT',
  'ATSPI_MODIFIER_SHIFTLOCK',
  'ATSPI_MODIFIER_CONTROL',
  'ATSPI_MODIFIER_ALT',
  'ATSPI_MODIFIER_META',
  'ATSPI_MODIFIER_META2',
  'ATSPI_MODIFIER_META3',
  ATSPI_MODIFIER_NUMLOCK   => 14,
);

constant AtspiRelationType is export := guint32;
our enum AtspiRelationTypeEnum is export <
  ATSPI_RELATION_NULL
  ATSPI_RELATION_LABEL_FOR
  ATSPI_RELATION_LABELLED_BY
  ATSPI_RELATION_CONTROLLER_FOR
  ATSPI_RELATION_CONTROLLED_BY
  ATSPI_RELATION_MEMBER_OF
  ATSPI_RELATION_TOOLTIP_FOR
  ATSPI_RELATION_NODE_CHILD_OF
  ATSPI_RELATION_NODE_PARENT_OF
  ATSPI_RELATION_EXTENDED
  ATSPI_RELATION_FLOWS_TO
  ATSPI_RELATION_FLOWS_FROM
  ATSPI_RELATION_SUBWINDOW_OF
  ATSPI_RELATION_EMBEDS
  ATSPI_RELATION_EMBEDDED_BY
  ATSPI_RELATION_POPUP_FOR
  ATSPI_RELATION_PARENT_WINDOW_OF
  ATSPI_RELATION_DESCRIPTION_FOR
  ATSPI_RELATION_DESCRIBED_BY
  ATSPI_RELATION_DETAILS
  ATSPI_RELATION_DETAILS_FOR
  ATSPI_RELATION_ERROR_MESSAGE
  ATSPI_RELATION_ERROR_FOR
  ATSPI_RELATION_LAST_DEFINED
>;

constant AtspiRole is export := guint32;
our enum AtspiRoleEnum is export <
  ATSPI_ROLE_INVALID
  ATSPI_ROLE_ACCELERATOR_LABEL
  ATSPI_ROLE_ALERT
  ATSPI_ROLE_ANIMATION
  ATSPI_ROLE_ARROW
  ATSPI_ROLE_CALENDAR
  ATSPI_ROLE_CANVAS
  ATSPI_ROLE_CHECK_BOX
  ATSPI_ROLE_CHECK_MENU_ITEM
  ATSPI_ROLE_COLOR_CHOOSER
  ATSPI_ROLE_COLUMN_HEADER
  ATSPI_ROLE_COMBO_BOX
  ATSPI_ROLE_DATE_EDITOR
  ATSPI_ROLE_DESKTOP_ICON
  ATSPI_ROLE_DESKTOP_FRAME
  ATSPI_ROLE_DIAL
  ATSPI_ROLE_DIALOG
  ATSPI_ROLE_DIRECTORY_PANE
  ATSPI_ROLE_DRAWING_AREA
  ATSPI_ROLE_FILE_CHOOSER
  ATSPI_ROLE_FILLER
  ATSPI_ROLE_FOCUS_TRAVERSABLE
  ATSPI_ROLE_FONT_CHOOSER
  ATSPI_ROLE_FRAME
  ATSPI_ROLE_GLASS_PANE
  ATSPI_ROLE_HTML_CONTAINER
  ATSPI_ROLE_ICON
  ATSPI_ROLE_IMAGE
  ATSPI_ROLE_INTERNAL_FRAME
  ATSPI_ROLE_LABEL
  ATSPI_ROLE_LAYERED_PANE
  ATSPI_ROLE_LIST
  ATSPI_ROLE_LIST_ITEM
  ATSPI_ROLE_MENU
  ATSPI_ROLE_MENU_BAR
  ATSPI_ROLE_MENU_ITEM
  ATSPI_ROLE_OPTION_PANE
  ATSPI_ROLE_PAGE_TAB
  ATSPI_ROLE_PAGE_TAB_LIST
  ATSPI_ROLE_PANEL
  ATSPI_ROLE_PASSWORD_TEXT
  ATSPI_ROLE_POPUP_MENU
  ATSPI_ROLE_PROGRESS_BAR
  ATSPI_ROLE_PUSH_BUTTON
  ATSPI_ROLE_RADIO_BUTTON
  ATSPI_ROLE_RADIO_MENU_ITEM
  ATSPI_ROLE_ROOT_PANE
  ATSPI_ROLE_ROW_HEADER
  ATSPI_ROLE_SCROLL_BAR
  ATSPI_ROLE_SCROLL_PANE
  ATSPI_ROLE_SEPARATOR
  ATSPI_ROLE_SLIDER
  ATSPI_ROLE_SPIN_BUTTON
  ATSPI_ROLE_SPLIT_PANE
  ATSPI_ROLE_STATUS_BAR
  ATSPI_ROLE_TABLE
  ATSPI_ROLE_TABLE_CELL
  ATSPI_ROLE_TABLE_COLUMN_HEADER
  ATSPI_ROLE_TABLE_ROW_HEADER
  ATSPI_ROLE_TEAROFF_MENU_ITEM
  ATSPI_ROLE_TERMINAL
  ATSPI_ROLE_TEXT
  ATSPI_ROLE_TOGGLE_BUTTON
  ATSPI_ROLE_TOOL_BAR
  ATSPI_ROLE_TOOL_TIP
  ATSPI_ROLE_TREE
  ATSPI_ROLE_TREE_TABLE
  ATSPI_ROLE_UNKNOWN
  ATSPI_ROLE_VIEWPORT
  ATSPI_ROLE_WINDOW
  ATSPI_ROLE_EXTENDED
  ATSPI_ROLE_HEADER
  ATSPI_ROLE_FOOTER
  ATSPI_ROLE_PARAGRAPH
  ATSPI_ROLE_RULER
  ATSPI_ROLE_APPLICATION
  ATSPI_ROLE_AUTOCOMPLETE
  ATSPI_ROLE_EDITBAR
  ATSPI_ROLE_EMBEDDED
  ATSPI_ROLE_ENTRY
  ATSPI_ROLE_CHART
  ATSPI_ROLE_CAPTION
  ATSPI_ROLE_DOCUMENT_FRAME
  ATSPI_ROLE_HEADING
  ATSPI_ROLE_PAGE
  ATSPI_ROLE_SECTION
  ATSPI_ROLE_REDUNDANT_OBJECT
  ATSPI_ROLE_FORM
  ATSPI_ROLE_LINK
  ATSPI_ROLE_INPUT_METHOD_WINDOW
  ATSPI_ROLE_TABLE_ROW
  ATSPI_ROLE_TREE_ITEM
  ATSPI_ROLE_DOCUMENT_SPREADSHEET
  ATSPI_ROLE_DOCUMENT_PRESENTATION
  ATSPI_ROLE_DOCUMENT_TEXT
  ATSPI_ROLE_DOCUMENT_WEB
  ATSPI_ROLE_DOCUMENT_EMAIL
  ATSPI_ROLE_COMMENT
  ATSPI_ROLE_LIST_BOX
  ATSPI_ROLE_GROUPING
  ATSPI_ROLE_IMAGE_MAP
  ATSPI_ROLE_NOTIFICATION
  ATSPI_ROLE_INFO_BAR
  ATSPI_ROLE_LEVEL_BAR
  ATSPI_ROLE_TITLE_BAR
  ATSPI_ROLE_BLOCK_QUOTE
  ATSPI_ROLE_AUDIO
  ATSPI_ROLE_VIDEO
  ATSPI_ROLE_DEFINITION
  ATSPI_ROLE_ARTICLE
  ATSPI_ROLE_LANDMARK
  ATSPI_ROLE_LOG
  ATSPI_ROLE_MARQUEE
  ATSPI_ROLE_MATH
  ATSPI_ROLE_RATING
  ATSPI_ROLE_TIMER
  ATSPI_ROLE_STATIC
  ATSPI_ROLE_MATH_FRACTION
  ATSPI_ROLE_MATH_ROOT
  ATSPI_ROLE_SUBSCRIPT
  ATSPI_ROLE_SUPERSCRIPT
  ATSPI_ROLE_DESCRIPTION_LIST
  ATSPI_ROLE_DESCRIPTION_TERM
  ATSPI_ROLE_DESCRIPTION_VALUE
  ATSPI_ROLE_FOOTNOTE
  ATSPI_ROLE_CONTENT_DELETION
  ATSPI_ROLE_CONTENT_INSERTION
  ATSPI_ROLE_MARK
  ATSPI_ROLE_SUGGESTION
  ATSPI_ROLE_LAST_DEFINED
>;

constant AtspiScrollType is export := guint32;
our enum AtspiScrollTypeEnum is export <
  ATSPI_SCROLL_TOP_LEFT
  ATSPI_SCROLL_BOTTOM_RIGHT
  ATSPI_SCROLL_TOP_EDGE
  ATSPI_SCROLL_BOTTOM_EDGE
  ATSPI_SCROLL_LEFT_EDGE
  ATSPI_SCROLL_RIGHT_EDGE
  ATSPI_SCROLL_ANYWHERE
>;

constant AtspiStateType is export := guint32;
our enum AtspiStateTypeEnum is export <
  ATSPI_STATE_INVALID
  ATSPI_STATE_ACTIVE
  ATSPI_STATE_ARMED
  ATSPI_STATE_BUSY
  ATSPI_STATE_CHECKED
  ATSPI_STATE_COLLAPSED
  ATSPI_STATE_DEFUNCT
  ATSPI_STATE_EDITABLE
  ATSPI_STATE_ENABLED
  ATSPI_STATE_EXPANDABLE
  ATSPI_STATE_EXPANDED
  ATSPI_STATE_FOCUSABLE
  ATSPI_STATE_FOCUSED
  ATSPI_STATE_HAS_TOOLTIP
  ATSPI_STATE_HORIZONTAL
  ATSPI_STATE_ICONIFIED
  ATSPI_STATE_MODAL
  ATSPI_STATE_MULTI_LINE
  ATSPI_STATE_MULTISELECTABLE
  ATSPI_STATE_OPAQUE
  ATSPI_STATE_PRESSED
  ATSPI_STATE_RESIZABLE
  ATSPI_STATE_SELECTABLE
  ATSPI_STATE_SELECTED
  ATSPI_STATE_SENSITIVE
  ATSPI_STATE_SHOWING
  ATSPI_STATE_SINGLE_LINE
  ATSPI_STATE_STALE
  ATSPI_STATE_TRANSIENT
  ATSPI_STATE_VERTICAL
  ATSPI_STATE_VISIBLE
  ATSPI_STATE_MANAGES_DESCENDANTS
  ATSPI_STATE_INDETERMINATE
  ATSPI_STATE_REQUIRED
  ATSPI_STATE_TRUNCATED
  ATSPI_STATE_ANIMATED
  ATSPI_STATE_INVALID_ENTRY
  ATSPI_STATE_SUPPORTS_AUTOCOMPLETION
  ATSPI_STATE_SELECTABLE_TEXT
  ATSPI_STATE_IS_DEFAULT
  ATSPI_STATE_VISITED
  ATSPI_STATE_CHECKABLE
  ATSPI_STATE_HAS_POPUP
  ATSPI_STATE_READ_ONLY
  ATSPI_STATE_LAST_DEFINED
>;

constant AtspiTextBoundaryType is export := guint32;
our enum AtspiTextBoundaryTypeEnum is export <
  ATSPI_TEXT_BOUNDARY_CHAR
  ATSPI_TEXT_BOUNDARY_WORD_START
  ATSPI_TEXT_BOUNDARY_WORD_END
  ATSPI_TEXT_BOUNDARY_SENTENCE_START
  ATSPI_TEXT_BOUNDARY_SENTENCE_END
  ATSPI_TEXT_BOUNDARY_LINE_START
  ATSPI_TEXT_BOUNDARY_LINE_END
>;

constant AtspiTextClipType is export := guint32;
our enum AtspiTextClipTypeEnum is export <
  ATSPI_TEXT_CLIP_NONE
  ATSPI_TEXT_CLIP_MIN
  ATSPI_TEXT_CLIP_MAX
  ATSPI_TEXT_CLIP_BOTH
>;

constant AtspiTextGranularity is export := guint32;
our enum AtspiTextGranularityEnum is export <
  ATSPI_TEXT_GRANULARITY_CHAR
  ATSPI_TEXT_GRANULARITY_WORD
  ATSPI_TEXT_GRANULARITY_SENTENCE
  ATSPI_TEXT_GRANULARITY_LINE
  ATSPI_TEXT_GRANULARITY_PARAGRAPH
>;

constant AtspiCache is export := guint64;
our enum AtspiCacheEnum is export (
  ATSPI_CACHE_NONE        => 0,
  ATSPI_CACHE_PARENT      => 1 +< 0,
  ATSPI_CACHE_CHILDREN    => 1 +< 1,
  ATSPI_CACHE_NAME        => 1 +< 2,
  ATSPI_CACHE_DESCRIPTION => 1 +< 3,
  ATSPI_CACHE_STATES      => 1 +< 4,
  ATSPI_CACHE_ROLE        => 1 +< 5,
  ATSPI_CACHE_INTERFACES  => 1 +< 6,
  ATSPI_CACHE_ATTRIBUTES  => 1 +< 7,
  ATSPI_CACHE_ALL         => 0x3fffffff,
  ATSPI_CACHE_DEFAULT     => 1 +< 0 +| # ATSPI_CACHE_PARENT      +|
                             1 +< 1 +| # ATSPI_CACHE_CHILDREN    +|
                             1 +< 2 +| # ATSPI_CACHE_NAME        +|
                             1 +< 3 +| # ATSPI_CACHE_DESCRIPTION +|
                             1 +< 4 +| # ATSPI_CACHE_STATES      +|
                             1 +< 5 +| # ATSPI_CACHE_ROLE        +|
                             1 +< 6,   # ATSPI_CACHE_INTERFACES,
  ATSPI_CACHE_UNDEFINED   => 0x40000000,
);
