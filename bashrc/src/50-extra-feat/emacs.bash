

# `wemacs .`을 사용하기위한 별칭추가
# - wsl용 emacs는 화면이 밀리는현상이있어서 windows용 이맥스를 사용함
# - exe파일 링크시 실패하여(방법이틀린듯) 위치를 직접 하드코딩
alias wemacs='__run_emacs_for_windows "$@"'
__run_emacs_for_windows() {
	# - 백그라운드로 실행을원함.
	#   todo: 현재쉘에 의존은 어떻게 처리를? `(cmd) &`사용해도 현재쉘 닫으면 종료됨
	/mnt/d/kang/programs/emacs-w64-25.3-O2-with-modules/emacs/bin/emacs.exe "$@" &
}
