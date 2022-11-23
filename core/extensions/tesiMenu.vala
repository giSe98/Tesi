namespace Tesi {
    [GtkTemplate (ui = "/ui/tesiMenu-button.ui")]
    public class TesiMenuButton : Gtk.Button{
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
        
        private bool active1 = false;
        private bool active2 = false;
        private bool active3 = false;
        private bool active4 = false;
        private bool all_active = false;
        private bool active_proc = false;
        private string date_string = "";
        
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
        
        public TesiMenuButton (Midori.Browser browser) {
            this.browser = browser;
            
            var action = new SimpleAction ("open-config", null);
            action.activate.connect (config_activated);
            browser.add_action (action);
        }

        void config_activated () {
            open_config ();
        }

        void switcher_activated (Object switcher_act, ParamSpec pspec) {
            if (date_string == "") 
                date_string = new DateTime.now_local().format("%d-%m-%Y_%H:%M:%S");
            if ((switcher_act as Gtk.Switch) != null) {
                Gtk.Switch switcher = (Gtk.Switch) switcher_act;
                if (switcher.get_active()) {
                    if (!active_proc) {
                        exec_program_async({"python3", "scripts/proc.py"});
                        active_proc = true;
                    }
                    if (switcher == switch1 && !active1) {
                        exec_program_async({"python3", "-c","from os import system;system('tshark -i enp0s3 -F pcapng -w $HOME/core/results/outTSHARK 2>/dev/null</dev/null &')"});
                        active1 = true;
                        if(active1 && active2 && active3) {
                            all_active = true;
                            switch4.set_active(true);
                        }
                    }
                    else if (switcher == switch2 && !active2) {
                        print("Avvio estrazione codice sorgente\n");
                        active2 = true;
                        browser.extract_signal_to_browser(active2);
                        if(active1 && active2 && active3) {
                            all_active = true;
                            switch4.set_active(true);
                        }
                    }
                    else if (switcher == switch3 && !active3) {
                        if(spawn_option())
                            exec_program_async({"obs", "--profile \"/home/test/core/obs_config/base/\"", "--collection \"full\"", "--startrecording", "--minimize-to-tray"});
                        else
                            exec_program_async({"obs", "--profile \"/home/test/core/obs_config/base/\"", "--collection \"no_mic\"", "--startrecording", "--minimize-to-tray"});
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
                            exec_program_sync("../scripts/kill.sh \"[t]shark\"");
                            active1 = false;
                            if(active4) {
                                all_active = false;
                                switch4.set_active(false);
                            }
                            disable_proc();
                            check_active();
                        }
                        else
                            switcher.set_active(true);
                    }
                    else if (switcher == switch2)
                        if(spawn_warning("l'estrazione del codice sorgente")) {
                            print("Termina estrazione codice sorgente\n");
                            active2 = false;
                            browser.extract_signal_to_browser(active2);
                            if(active4) {
                                all_active = false;
                                switch4.set_active(false);
                            }
                            disable_proc();
                            check_active();
                        }
                        else
                            switcher.set_active(true);
                    else if (switcher == switch3)
                        if(spawn_warning("la registrazione")) {
                            exec_program_sync("../scripts/kill.sh \"[o]bs --profile\"");
                            active3 = false;
                            if(active4) {
                                all_active = false;
                                switch4.set_active(false);
                            }
                            disable_proc();
                            check_active();
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
                                check_active();
                            }
                            else
                                switcher.set_active(true);
                        else
                            active4 = false;
            }
        }

        void check_active() {
            if (!(active1 || active2 || active3 || active4)){
                string path = "/home/test";
                if (spawn_option_chooser()) {
                    string resp = spawn_chooser();
                    if (resp != null)
                        path = resp;
                    } 
                make_zip(path);
            }
        }

        void disable_proc() {
            if (!(active1 || active2 || active3 || active4)) {
                exec_program_sync("../scripts/kill.sh \"[p]roc.py\"");
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

        void exec_program_sync(string command) {
            try {
                Process.spawn_command_line_sync (command);
            } catch (SpawnError e) {
                print ("Error: %s\n", e.message);
            }
        }

        bool spawn_option_chooser() {
            var message = "Vuoi salvare i risultati in una cartella differente da quella di default (/home/test) ?";
            var dialog = new Gtk.MessageDialog(browser,Gtk.DialogFlags.MODAL,Gtk.MessageType.QUESTION, Gtk.ButtonsType.YES_NO, message);
            dialog.set_title("INFO");
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

        string spawn_chooser() {
            var chooser = new Gtk.FileChooserDialog(
                "Seleziona la cartella dove vuoi salvare i risultati", 
                browser, 
                Gtk.FileChooserAction.SELECT_FOLDER,
                "_Annulla",
                Gtk.ResponseType.CANCEL,
                "_Seleziona",
                Gtk.ResponseType.ACCEPT);

            chooser.set_select_multiple (false);
            int response = chooser.run ();
            string ret = null;

            switch (response) {
                case Gtk.ResponseType.ACCEPT:
                    ret = chooser.get_filename ();
                    break;
                case Gtk.ResponseType.CANCEL:
                    break;
                case Gtk.ResponseType.DELETE_EVENT:
                    print ("dialog closed or cancelled\n");
                    break;
            }

            chooser.destroy ();
            return ret;
        }

        void make_zip(string path) {
            string zip_name = "../to_sign/results_" + date_string + ".zip";
            exec_program_sync("7z a -tzip " + zip_name + " ../results/*");
            exec_program_sync("zipsign sign -f " + zip_name + " -p ../to_sign/priv.key -c ../to_sign/csr.crt");
            exec_program_sync("mv " + zip_name + " " + path);
        }
    }

    public class Frontend : Object, Midori.BrowserActivatable {
        public Midori.Browser browser { owned get; set; }

        public void activate () {
            // No new in app mode
            if (browser.is_locked) {
                return;
            }

            browser.add_button (new TesiMenuButton (browser));
        }
    }
}

[ModuleInit]
public void peas_register_types(TypeModule module) {
    ((Peas.ObjectModule)module).register_extension_type (
        typeof (Midori.BrowserActivatable), typeof (Tesi.Frontend));
}
