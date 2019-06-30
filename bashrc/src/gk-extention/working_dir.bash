
#---------------------------------------------------------------
# move
#---------------------------------------------------------------
# TODO 수동북마크
cwd_move_with_bookmark() {
  # 수동으로북마크..
  local base_path dirs
  dirs="$dirs"$'\n'$(__find_dir $GCE_MY_HOME/Project_Biz "1");
  dirs="$dirs"$'\n'$(__find_dir $GCE_MY_HOME/Project_Mine "1");
  dirs="$dirs"$'\n'$(__find_dir $GCE_MY_HOME "1");

  # 북마크들로 fzf 선택한곳 기준으로 동작
  base_path=$(echo "$dirs" | fzf)
  if [ -d $base_path ]; then
      cwd_move "$base_path"
  fi
}

# fzf이용해서.. 터미널에서 계속이동함.
cwd_move() {
  local base_path depth
  base_path=${1:-$(pwd)} # 기본값 pwd

  while [ -d "$base_path" ]; do
      # move, 이동후에 pwd로 절대경로 로 바꿔줌
      cd "$base_path"
      base_path=$(pwd)

      # path의 /기준 깊이가 4보다 작을경우는 depth는 1
      if [ $(IFS='/'; set -- $base_path; echo $#) -lt 4 ]; then
          depth=1
      else
          depth=2
      fi

      # fzf
      base_path=$(__find_dir "$base_path" "$depth" | fzf)
  done
}
__find_dir() {
  local base_path depth
  base_path=${1:-$(pwd)} # 기본값 pwd
  depth=${2:-1} # 기본값 1


  dirs=$(\
    find $base_path -maxdepth $depth -type d | \
    awk '!/\.git\/*|\/node_modules\/*/'\
  );
  dirs="$base_path/.."$'\n'"$dirs"
  echo "$dirs"
}

###### shortcut
# TODO 1. 적절한 위치
#      2. Ctrl을 매핑하면. 잘동작하지않는경우때문에 삽질하다 그냥 alt매핑으로 변경함. 사실상 escape이지만.

bind '"\emd":"\C-u cwd_move \n"'
bind '"\emb":"\C-u cwd_move_with_bookmark \n"'
