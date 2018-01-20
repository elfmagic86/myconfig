
# win10용 exe파일을 bash에서 직접 접근하기 위한 경로 추가.


# TODO uname -a 의 microsoft나오는 것으로 환경 구분하는것.
WIN10_MY_BIN=/mnt/d/kang/bin_win10

# 현재 수동설치(직접다운받아서 exe파일만 bin위치에 놓은...)한 win32yank만 있음.
PATH="$PATH:$WIN10_MY_BIN"
