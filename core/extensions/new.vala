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
        unowned Gtk.Popover popover;
        [GtkChild]
        unowned Gtk.Switch switch1;
        [GtkChild]
        unowned Gtk.Switch switch2;
        [GtkChild]
        unowned Gtk.Switch switch3;
        [GtkChild]
        unowned Gtk.Switch switch4;

        private bool active_proc = false;
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

        void switcher_activated (Object switcher_act, ParamSpec pspec) {
            if ((switcher_act as Gtk.Switch) != null) {
                Gtk.Switch switcher = (Gtk.Switch) switcher_act;
                if (switcher.get_active()) {
                    if (!active_proc) {
                        exec_program_async({"python3", "script/proc.py"});
                        active_proc = true;
                    }
                    if (switcher == switch1 && !active1) {
                        exec_program_async({"python3", "-c","from os import system;system('tshark -i enp0s3 -F pcapng -w results/outTSHARK 2>/dev/null</dev/null &')"});
                        active1 = true;
                        if(active1 && active2 && active3) {
                            all_active = true;
                            switch4.set_active(true);
                        }
                    }
                    else if (switcher == switch2 && !active2) {
                        print("Avvio estrazione codice sorgente\n");
                        active2 = true;
                        if(active1 && active2 && active3) {
                            all_active = true;
                            switch4.set_active(true);
                        }
                    }
                    else if (switcher == switch3 && !active3) {
                        if(spawn_option())
                            exec_program_async({"recordmydesktop", "-o", "results/outRECORDING"});
                        else
                            print("Avvio registrazione senza suoni ambientali\n");
                        active3 = true;
                        if(active1 && active2 && active3) {
                            all_active = true;
                            switch4.set_active(true);
                        }
                    }
                    else if (switcher == switch4 && !active4) {
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
                    if (switcher == switch1) {
                        if(spawn_warning("la cattura dei pacchetti di rete")) {
                            exec_program_async({"python3", "script/kill_program.py", "tshark"});
                            active1 = false;
                            if(active4) {
                                all_active = false;
                                switch4.set_active(false);
                            }
                            disable_proc();
                        }
                        else
                            switcher.set_active(true);
                    }
                    else if (switcher == switch2)
                        if(spawn_warning("l'estrazione del codice sorgente")) {
                            print("Termina estrazione codice sorgente\n");
                            active2 = false;
                            if(active4) {
                                all_active = false;
                                switch4.set_active(false);
                            }
                            disable_proc();
                        }
                        else
                            switcher.set_active(true);
                    else if (switcher == switch3)
                        if(spawn_warning("la registrazione")) {
                            exec_program_async({"python3", "script/kill_program.py", "recordmydesktop"});
                            active3 = false;
                            if(active4) {
                                all_active = false;
                                switch4.set_active(false);
                            }
                            disable_proc();
                        }
                        else
                            switcher.set_active(true);
                    else if (switcher == switch4)
                        if(all_active)
                            if(spawn_warning("l'esecuzione di tutti i programmi")) {
                                print("Termino tutti i programmi\n");
                                switch1.set_active(false);
                                switch2.set_active(false);
                                switch3.set_active(false);
                                active4 = false;
                                disable_proc();
                            }
                            else
                                switcher.set_active(true);
                        else
                            active4 = false;
            }
        }

        void disable_proc() {
            if (!(active1 || active2 || active3 || active4)) {
                exec_program_async({"python3", "script/kill_program.py", "proc.py"});
                active_proc = false;
            }
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
    
                Process.spawn_async_with_pipes ("../",
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