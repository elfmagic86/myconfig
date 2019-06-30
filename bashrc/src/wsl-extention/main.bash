# script test 
# GCNF_LOG_LEVEL=10 source ./bashrc/src/main.bash

SCRIPT_ROOT=$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
# config
# DEBUG(10) > INFO(20) > ERROR(30)
export GCNF_LOG_LEVEL="${GCNF_LOG_LEVEL:-30}"

# ///////////////////////////////////////////////
# @global(maunally import)
# ///////////////////////////////////////////////
# util
source $SCRIPT_ROOT/@global/util/logger.bash
source $SCRIPT_ROOT/@global/util/script_importer.bash

# env
source $SCRIPT_ROOT/@global/global_custom_env.bash

# ///////////////////////////////////////////////
# base import
# ///////////////////////////////////////////////
gcu_log_info "import bashrc base setting"

# import bashrc-base-setting
gcu_import_script $SCRIPT_ROOT/bashrc-base-setting

# ///////////////////////////////////////////////
# extention
# ///////////////////////////////////////////////
gcu_log_info "import bashrc extention"

# import base-extention
gcu_import_script $SCRIPT_ROOT/base-extention

# import gk-extention
gcu_import_script $SCRIPT_ROOT/gk-extention

# import opt-extention
gcu_import_script $SCRIPT_ROOT/opt-extention

# import wsl-extention
if $GCE_IS_WSL; then
    gcu_import_script $SCRIPT_ROOT/wsl-extention
fi