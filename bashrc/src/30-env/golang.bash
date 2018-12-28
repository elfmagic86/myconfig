# go tool
export GOROOT=/usr/local/go

# gopath for workspace
if $IS_WSL; then
	export GOPATH=/mnt/d/gopath
else
	export GOPATH=$HOME/go
fi

# ge get에서 $GOROOT/bin이 GOBIN이면 권한 때문에 거절당할수도있음.
export GOBIN=$GOPATH/bin




export PATH=$PATH:$GOROOT/bin:$GOBIN
