# todo 파일로그

# log
__gcu_log_level_debug=10
__gcu_log_level_info=20
__gcu_log_level_error=30
gcu_log_debug() {
    if [ $__gcu_log_level_debug -ge $GCNF_LOG_LEVEL ]; then
        echo "[debug]:$@"
    fi
}
export -f gcu_log_debug

gcu_log_info() {
    if [ $__gcu_log_level_info -ge $GCNF_LOG_LEVEL ]; then
        echo "[info]:$@"
    fi
}
export -f gcu_log_info

gcu_log_error() {
    if [ $__gcu_log_level_error -ge $GCNF_LOG_LEVEL ]; then
        echo "[error]:$@"
    fi
}
export -f gcu_log_error
