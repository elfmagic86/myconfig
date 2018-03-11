
ROOT_PATH=$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

SRC_PATH=$ROOT_PATH/src

files=$(find $SRC_PATH -name '*.bash' | sort)
for file in $files; do
	if [ -f "$file" ]; then

		echo "timetest:$file"
		time $file
		echo ""
		echo ""
	fi
done
