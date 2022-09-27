/* midori-core.vapi generated by valac 0.40.23, do not modify. */

namespace Midori {
	[CCode (cheader_filename = "midori-core.h")]
	public class App : Gtk.Application {
		public App ();
		protected override void activate ();
		protected override int command_line (GLib.ApplicationCommandLine command_line);
		protected override int handle_local_options (GLib.VariantDict options);
		public override bool local_command_line (ref unowned string[] args, out int exit_status);
		protected override void open (GLib.File[] files, string hint);
		public override void startup ();
		public GLib.File? exec_path { get; protected set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/browser.ui")]
	public class Browser : Gtk.ApplicationWindow {
		[GtkChild]
		public Gtk.Overlay overlay;
		[GtkChild]
		public Midori.Statusbar statusbar;
		[GtkChild]
		public Gtk.Stack tabs;
		public Browser (Midori.App app, bool is_locked = false);
		public bool activated ();
		public new void add (Midori.Tab tab);
		public void add_button (Gtk.Button button);
		public void add_panel (Gtk.Widget widget);
		public override bool configure_event (Gdk.EventConfigure event);
		public Browser.incognito (Midori.App app);
		public override bool key_press_event (Gdk.EventKey event);
		public bool is_fullscreen { get; protected set; }
		public bool is_loading { get; protected set; }
		public bool is_locked { get; set construct; }
		public Midori.Tab? tab { get; protected set; }
		public GLib.ListStore trash { get; protected set; }
		public string? uri { get; protected set; }
		public WebKit.WebContext web_context { get; set construct; }
		public signal bool default_tab ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/clear-private-data.ui")]
	public class ClearPrivateData : Gtk.Dialog {
		public ClearPrivateData (Gtk.Window parent);
		public override void response (int response_id);
		public override void show ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class Completion : GLib.Object, GLib.ListModel {
		public Completion (bool incognito);
		public void add (GLib.ListModel model);
		public bool incognito { get; set construct; }
		public string? key { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class CoreSettings : Midori.Settings {
		public static Midori.CoreSettings get_default ();
		public bool get_plugin_enabled (string plugin);
		public void set_plugin_enabled (string plugin, bool enabled);
		public string uri_for_search (string? keywords = null, string? search = null);
		public bool auto_load_images { get; set; }
		public bool close_buttons_on_tabs { get; set; }
		public bool enable_caret_browsing { get; set; }
		public bool enable_javascript { get; set; }
		public bool enable_plugins { get; set; }
		public bool enable_spell_checking { get; set; }
		public bool first_party_cookies_only { get; set; }
		public string homepage { owned get; set; }
		public string http_proxy { owned get; set; }
		public int http_proxy_port { get; set; }
		public int last_window_height { get; set; }
		public int last_window_width { get; set; }
		public Midori.StartupType load_on_startup { get; set; }
		public string location_entry_search { owned get; set; }
		public int maximum_history_age { get; set; }
		public Midori.ProxyType proxy_type { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class Database : GLib.Object, GLib.Initable, GLib.ListModel, Midori.Loggable {
		public Database (string path = ":memory:") throws Midori.DatabaseError;
		public virtual async bool clear (GLib.TimeSpan timespan) throws Midori.DatabaseError;
		public bool contains (Midori.DatabaseItem item) throws Midori.DatabaseError;
		public virtual async bool @delete (Midori.DatabaseItem item) throws Midori.DatabaseError;
		public bool exec (string query) throws Midori.DatabaseError;
		public bool exec_script (string filename) throws Midori.DatabaseError;
		public bool exists (string path);
		public virtual bool init (GLib.Cancellable? cancellable = null) throws Midori.DatabaseError;
		public virtual async bool insert (Midori.DatabaseItem item) throws Midori.DatabaseError;
		public virtual async Midori.DatabaseItem? lookup (string uri) throws Midori.DatabaseError;
		public Midori.DatabaseStatement prepare (string query, ...) throws Midori.DatabaseError;
		public virtual async GLib.List<Midori.DatabaseItem>? query (string? filter = null, int64 max_items = 15, GLib.Cancellable? cancellable = null) throws Midori.DatabaseError;
		public bool transaction (Midori.DatabaseCallback callback) throws Midori.DatabaseError;
		public virtual async bool update (Midori.DatabaseItem item) throws Midori.DatabaseError;
		public string errmsg { get; }
		public bool first_use { get; protected set; }
		public string? key { get; set; }
		public int64 last_row_id { get; }
		public string path { get; protected set; }
		public bool readonly { get; set construct; }
		public string? table { get; protected set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class DatabaseItem : GLib.Object {
		public DatabaseItem (string uri, string? title, int64 date = 0);
		public async bool @delete ();
		public Midori.Database? database { get; set; }
		public int64 date { get; set; }
		public int64 id { get; set; }
		public string? title { get; set; }
		public string uri { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class DatabaseStatement : GLib.Object, GLib.Initable {
		public DatabaseStatement (Midori.Database database, string query) throws Midori.DatabaseError;
		public void bind (string pname, ...) throws Midori.DatabaseError;
		public bool exec () throws Midori.DatabaseError;
		public double get_double (string name) throws Midori.DatabaseError;
		public int64 get_int64 (string name) throws Midori.DatabaseError;
		public string? get_string (string name) throws Midori.DatabaseError;
		public virtual bool init (GLib.Cancellable? cancellable = null) throws Midori.DatabaseError;
		public int64 row_id () throws Midori.DatabaseError;
		public bool step () throws Midori.DatabaseError;
		public Midori.Database? database { get; set construct; }
		public string? query { get; set construct; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/download-button.ui")]
	public class DownloadButton : Gtk.Button {
		[GtkChild]
		public Gtk.Button clear;
		[GtkChild]
		public Gtk.ListBox listbox;
		[GtkChild]
		public Gtk.Popover popover;
		public DownloadButton ();
		public Gtk.Widget create_row (GLib.Object item);
		public virtual signal void show_downloads ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class DownloadItem : GLib.Object {
		public string? mime_type;
		public DownloadItem (string filename);
		public void cancel ();
		public DownloadItem.with_download (WebKit.Download download);
		public string? basename { get; protected set; }
		public string content_type { owned get; }
		public WebKit.Download? download { get; protected set; }
		public string? error { get; protected set; }
		public string? filename { get; protected set; }
		public GLib.Icon icon { owned get; }
		public bool loading { get; protected set; }
		public double progress { get; protected set; }
		public signal void finished ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/download-row.ui")]
	public class DownloadRow : Gtk.ListBoxRow {
		[GtkChild]
		public Gtk.Button cancel;
		[GtkChild]
		public Gtk.Image error;
		[GtkChild]
		public Gtk.Label filename;
		[GtkChild]
		public Gtk.Image icon;
		[GtkChild]
		public Gtk.Button open;
		[GtkChild]
		public Gtk.ProgressBar progress;
		[GtkChild]
		public Gtk.Label status;
		public DownloadRow (Midori.DownloadItem item);
		public Midori.DownloadItem item { get; protected set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class Favicon : Gtk.Image {
		public Favicon ();
		public new Cairo.Surface? surface { set; }
		public string? uri { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class HistoryDatabase : Midori.Database {
		public static Midori.HistoryDatabase get_default (bool incognito = false) throws Midori.DatabaseError;
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class LabelWidget : Gtk.Box {
		public LabelWidget (string? title, Gtk.Widget? widget = null);
		public override void add (Gtk.Widget widget);
		protected Gtk.Label label { get; set; }
		public string? title { get; set construct; }
		public Gtk.Widget? widget { get; set construct; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/navigationbar.ui")]
	public class Navigationbar : Gtk.ActionBar {
		[GtkChild]
		public Gtk.Box actionbox;
		[GtkChild]
		public Gtk.Button go_back;
		[GtkChild]
		public Gtk.Button go_forward;
		[GtkChild]
		public Gtk.Button homepage;
		[GtkChild]
		public Gtk.Button reload;
		[GtkChild]
		public Gtk.Button restore;
		[GtkChild]
		public Gtk.Button stop_loading;
		[GtkChild]
		public Midori.Urlbar urlbar;
		public Navigationbar ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/network-check.ui")]
	public class NetworkCheck : Gtk.ActionBar {
		public NetworkCheck ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class Plugins : Peas.Engine, Midori.Loggable {
		public Peas.ExtensionSet plug<T> (string name, GLib.Object object);
		public string builtin_path { get; set construct; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/preferences.ui")]
	public class Preferences : Gtk.Dialog {
		public Preferences (Gtk.Window parent);
		public new void add (string label, Gtk.Widget widget);
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class Settings : GLib.Object {
		public Settings ();
		public bool get_boolean (string group, string key, bool @default = false);
		public string? get_string (string group, string key, string? @default = null);
		public void set_boolean (string group, string key, bool value, bool @default = false);
		public void set_string (string group, string key, string value, string? @default = null);
		public string filename { get; set construct; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class Statusbar : Gtk.Statusbar {
		public Statusbar ();
		public string? label { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class SuggestionItem : Midori.DatabaseItem {
		public SuggestionItem.for_input (string uri, string? title);
		public string? search { get; protected set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/suggestion-row.ui")]
	public class SuggestionRow : Gtk.ListBoxRow {
		public SuggestionRow (Midori.DatabaseItem item);
		public Midori.DatabaseItem item { get; protected set; }
		public string? key { get; set; }
		public string? location { get; set; }
		public GLib.Regex? regex { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public class Switcher : Gtk.Box {
		public Switcher ();
		public bool show_close_buttons { get; protected set; }
		public Gtk.Stack? stack { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/tab.ui")]
	public class Tab : WebKit.WebView {
		public Tab (Midori.Tab? related, WebKit.WebContext web_context, string? uri = null, string? title = null);
		public override void close ();
		public override bool context_menu (WebKit.ContextMenu menu, Gdk.Event event, WebKit.HitTestResult hit);
		public override bool decide_policy (WebKit.PolicyDecision decision, WebKit.PolicyDecisionType type);
		public override bool focus_in_event (Gdk.EventFocus event);
		public override void insecure_content_detected (WebKit.InsecureContentEvent event);
		public override void load_changed (WebKit.LoadEvent load_event);
		public override bool load_failed (WebKit.LoadEvent load_event, string uri, GLib.Error load_error);
		public override bool load_failed_with_tls_errors (string uri, GLib.TlsCertificate tls, GLib.TlsCertificateFlags flags);
		public override void mouse_target_changed (WebKit.HitTestResult result, uint modifiers);
		public override bool permission_request (WebKit.PermissionRequest permission);
		public override bool print (WebKit.PrintOperation operation);
		public override bool script_dialog (WebKit.ScriptDialog dialog);
		public override bool show_notification (WebKit.Notification webkit_notification);
		public override bool web_process_crashed ();
		public new bool can_go_back { get; protected set; }
		public new bool can_go_forward { get; protected set; }
		public string? color { get; set; }
		public string display_title { get; protected set; }
		public string display_uri { get; protected set; }
		public string id { owned get; }
		public Midori.DatabaseItem? item { get; protected set; }
		public string link_uri { get; protected set; }
		public bool pinned { get; set; }
		public double progress { get; protected set; }
		public bool secure { get; protected set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/tally.ui")]
	public class Tally : Gtk.EventBox {
		public Tally (Midori.Tab tab);
		protected override bool button_press_event (Gdk.EventButton event);
		protected override bool button_release_event (Gdk.EventButton event);
		public bool active { get; set; }
		public bool show_close { get; set; }
		public Midori.Tab tab { get; protected set; }
		public string? title { get; set; }
		public string? uri { get; set; }
		public signal void clicked ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	[GtkTemplate (ui = "/ui/urlbar.ui")]
	public class Urlbar : Gtk.Entry {
		public Urlbar ();
		public Gtk.Widget create_row (GLib.Object item);
		protected override bool focus_out_event (Gdk.EventFocus event);
		protected override bool key_press_event (Gdk.EventKey event);
		public void popdown ();
		protected override void populate_popup (Gtk.Menu menu);
		public string? key { get; protected set; }
		public string? location { get; protected set; }
		public GLib.Regex? regex { get; protected set; }
		public bool secure { get; set; }
		public string uri { get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public interface AppActivatable : Peas.ExtensionBase {
		public abstract void activate ();
		public abstract Midori.App app { owned get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public interface BrowserActivatable : GLib.Object {
		public abstract void activate ();
		public abstract Midori.Browser browser { owned get; set; }
		public signal void deactivate ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	public interface ClearPrivateDataActivatable : GLib.Object {
		public abstract void activate ();
		public abstract async void clear (GLib.TimeSpan timespan);
		public abstract Gtk.Box box { owned get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public interface CompletionActivatable : Peas.ExtensionBase {
		public abstract void activate ();
		public abstract Midori.Completion completion { owned get; set; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public interface Loggable : GLib.Object {
		public void debug (string format, ...);
		public string domain { owned get; }
		public bool logging { owned get; }
	}
	[CCode (cheader_filename = "midori-core.h")]
	public interface PreferencesActivatable : GLib.Object {
		public abstract void activate ();
		public abstract Midori.Preferences preferences { owned get; set; }
		public signal void deactivate ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	public interface TabActivatable : Peas.ExtensionBase {
		public abstract void activate ();
		public abstract Midori.Tab tab { owned get; set; }
		public signal void deactivate ();
	}
	[CCode (cheader_filename = "midori-core.h")]
	public enum DebugFlags {
		NONE,
		HISTORY
	}
	[CCode (cheader_filename = "midori-core.h", cprefix = "MIDORI_PROXY_")]
	public enum ProxyType {
		AUTOMATIC,
		HTTP,
		NONE
	}
	[CCode (cheader_filename = "midori-core.h", cprefix = "MIDORI_STARTUP_")]
	public enum StartupType {
		SPEED_DIAL,
		HOMEPAGE,
		LAST_OPEN_PAGES,
		DELAYED_PAGES
	}
	[CCode (cheader_filename = "midori-core.h")]
	public errordomain DatabaseError {
		OPEN,
		NAMING,
		FILENAME,
		EXECUTE,
		COMPILE,
		TYPE
	}
	[CCode (cheader_filename = "midori-core.h")]
	public delegate bool DatabaseCallback () throws Midori.DatabaseError;
	[CCode (cheader_filename = "midori-core.h")]
	public const GLib.DebugKey[] keys;
}
