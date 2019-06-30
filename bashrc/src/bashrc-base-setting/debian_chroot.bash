
# todo: https://unix.stackexchange.com/questions/3171/what-is-debian-chroot-in-bashrc
# Chroot is a unix feature that lets you restrict a process to a subtree of the filesystem

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

