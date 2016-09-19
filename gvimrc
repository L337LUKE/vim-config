if has('gui_macvim') 
    "Disable default cmd+option key bindings from macvim"
    let macvim_skip_cmd_opt_movement = 1
    
    " Disable print key for macvim
    macmenu &File.Print key=<nop>
endif
