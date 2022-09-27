/*
 Copyright (C) 2013-2018 Christian Dywan <christian@twotoats.de>

 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 See the file COPYING for the full license text.
*/

namespace Midori {

    [GtkTemplate (ui = "/ui/new-button.ui")]
    public class Button : Gtk.Button {
        [GtkChild]
        Gtk.Popover popover;
        [GtkChild]
        Gtk.Switch switch1;
        [GtkChild]
        Gtk.Switch switch2;
        [GtkChild]
        Gtk.Switch switch3;
        [GtkChild]
        Gtk.Switch switch4;

        private bool active1 = false;
        private bool active2 = false;
        private bool active3 = false;
        private bool active4 = false;
        private bool all_active = false;

        Midori.Browser browser;

        construct {
            popover.relative_to = this;
            switch1.notify["active"].connect(switcher_activated);
            switch2.notify["active"].connect(switcher_activated);
            switch3.notify["active"].connect(switcher_activated);
            switch4.notify["active"].connect(switcher_activated);
        }

        public virtual signal void open_config () {
            popover.show ();
        }

        public Button (Midori.Browser browser) {
            this.browser = browser;

            var action = new SimpleAction ("open-config", null);
            action.activate.connect (config_activated);
            browser.add_action (action);
        }

        void config_activated () {
            open_config ();
        }

        void switcher_activated (Object switcher, ParamSpec pspec) {
            if ((switcher as Gtk.Switch).get_active()) {
                if ((switcher as Gtk.Switch) == switch1 && !active1) {
                    exec_program_async({"python3", "-c","from os import system;system('tshark -i enp0s3 -F pcapng -w out 2>/dev/null</dev/null &')"});
                    active1 = true;
                    if(active1 && active2 && active3) {
                        all_active = true;
                        switch4.set_active(true);
                    }
                }
                else if ((switcher as Gtk.Switch) == switch2 && !active2) {
                    print("Avvio estrazione codice sorgente\n");
                    active2 = true;
                    if(active1 && active2 && active3) {
                        all_active = true;
                        switch4.set_active(true);
                    }
                }
                else if ((switcher as Gtk.Switch) == switch3 && !active3) {
                    if(spawn_option())
                        print("Avvio registrazione con suoni ambientali\n");
                    else
                        print("Avvio registrazione senza suoni ambientali\n");
                    active3 = true;
                    if(active1 && active2 && active3) {
                        all_active = true;
                        switch4.set_active(true);
                    }
                }
                else if ((switcher as Gtk.Switch) == switch4 && !active4) {
                    if(!(active1 && active2 && active3)) {
                        print("Avvio tutti i programmi\n");
                        switch1.set_active(true);
                        switch2.set_active(true);
                        switch3.set_active(true);
                    }
                    active4 = true;
                    all_active = true;
                }
            }
            else
                if ((switcher as Gtk.Switch) == switch1) {
                    if(spawn_warning("la cattura dei pacchetti di rete")) {
                        exec_program_async({"python3", "script/kill_program.py", "tshark"});
                        active1 = false;
                        if(active4) {
                            all_active = false;
                            switch4.set_active(false);
                        }
                    }
                    else
                        (switcher as Gtk.Switch).set_active(true);
                }
                else if ((switcher as Gtk.Switch) == switch2)
                    if(spawn_warning("l'estrazione del codice sorgente")) {
                        print("Termina estrazione codice sorgente\n");
                        active2 = false;
                        if(active4) {
                            all_active = false;
                            switch4.set_active(false);
                        }
                    }
                    else
                        (switcher as Gtk.Switch).set_active(true);
                else if ((switcher as Gtk.Switch) == switch3)
                    if(spawn_warning("la registrazione")) {
                        print("Termina registrazione\n");
                        active3 = false;
                        if(active4) {
                            all_active = false;
                            switch4.set_active(false);
                        }
                    }
                    else
                        (switcher as Gtk.Switch).set_active(true);
                else if ((switcher as Gtk.Switch) == switch4)
                    if(all_active)
                        if(spawn_warning("l'esecuzione di tutti i programmi")) {
                            print("Termino tutti i programmi\n");
                            switch1.set_active(false);
                            switch2.set_active(false);
                            switch3.set_active(false);
                            active4 = false;
                        }
                        else
                            (switcher as Gtk.Switch).set_active(true);
                    else
                        active4 = false;
        }

        bool spawn_warning(string str) {
            var message = "Sicuro di voler bloccare " + str + " ?";
            var dialog = new Gtk.MessageDialog(browser,Gtk.DialogFlags.MODAL,Gtk.MessageType.WARNING, Gtk.ButtonsType.YES_NO, message);
            dialog.set_title("ATTENZIONE");
            int response = dialog.run();
            bool ret = false;

            switch (response) {
                case Gtk.ResponseType.YES:
                    ret = true;
                    break;
                case Gtk.ResponseType.NO:
                    break;
                case Gtk.ResponseType.DELETE_EVENT:
                    print ("dialog closed or cancelled\n");
                    break;
            }

            dialog.destroy();
            return ret;
        }

        bool spawn_option() {
            var message = "Vuoi abilitare la registrazione dell'audio proveniente dal microfono ?";
            var dialog = new Gtk.MessageDialog(browser,Gtk.DialogFlags.MODAL,Gtk.MessageType.QUESTION, Gtk.ButtonsType.YES_NO, message);
            dialog.set_title("ATTENZIONE");
            int response = dialog.run();
            bool ret = false;

            switch (response) {
                case Gtk.ResponseType.YES:
                    ret = true;
                    break;
                case Gtk.ResponseType.NO:
                    break;
                case Gtk.ResponseType.DELETE_EVENT:
                    print ("dialog closed or cancelled\n");
                    break;
            }

            dialog.destroy();
            return ret;
        }

        void exec_program_async(string[] spawn_args) {
            try {
                string[] spawn_env = Environ.get ();
                Pid child_pid;
    
                int standard_input;
                int standard_output;
                int standard_error;
    
                Process.spawn_async_with_pipes ("./",
                    spawn_args,
                    spawn_env,
                    SpawnFlags.SEARCH_PATH | SpawnFlags.DO_NOT_REAP_CHILD,
                    null,
                    out child_pid,
                    out standard_input,
                    out standard_output,
                    out standard_error);
            } catch (SpawnError e) {
                print ("Error: %s\n", e.message);
            }
        }

    }

    public class Frontend : Object, Midori.BrowserActivatable {
        public Midori.Browser browser { owned get; set; }

        public void activate () {
            // No new in app mode
            if (browser.is_locked) {
                return;
            }

            browser.add_button (new Button (browser));
        }
    }
}

[ModuleInit]
public void peas_register_types(TypeModule module) {
    ((Peas.ObjectModule)module).register_extension_type (
        typeof (Midori.BrowserActivatable), typeof (Midori.Frontend));
}
