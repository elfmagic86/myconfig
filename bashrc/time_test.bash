
SCRIPT_ROOT=$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

SRC_PATH=$SCRIPT_ROOT/src

files=$(find $SRC_PATH -name '*.bash' | sort)
for file in $files; do
	if [ -f "$file" ]; then
		echo TODO permission x
		echo "timetest:$file"
		time $file
		echo ""
		echo ""
	fi
done
