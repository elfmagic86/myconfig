# script
__gcu_import_script() {
    local script="$1"
    if [ -f "$script" ]; then
        gcu_log_debug "import script: $script"
        source $script 
    fi
}

gcu_import_script() {
    local script_or_dir="$1"
    if [ -d "$script_or_dir" ]; then
        for script in $(find $script_or_dir -name '*.bash'); do
        __gcu_import_script "$script"
        done     
    else
        __gcu_import_script "$script"
    fi
}
export -f gcu_import_script