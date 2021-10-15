end=0

help()
{
echo "Poetry.sh program generates a table that contains..."
end=1
}

flag()
{
while test $# -gt 0
do
	case "$1" in
	(-h|--help)
		help
		break
	esac
done
}

flag "$@"


if [ $end -eq 0 ]
then
file="poetry.txt"

echo -e "Student_ID\tFavorite Peom   \t\t\t\t\tFirst_7_chars_of_poem"

boolean=0

while read line
do
	if [ $boolean -eq 0 ]
	then
		if [ "${line:0:7}" = "Student" ] || [ "${line:0:7}" = "student" ]
		then
			echo -n -e "$line\t"
			boolean=1
		fi
	fi
	if [ $boolean -eq 1 ]
	then
		if [ "${line:0:6}" = "Poem: " ]
		then
			echo -n -e "${line:6}\t\t\t\t"
			echo -n -e "${line:6:7}\n"
			boolean=0
		fi
		if [ "$line" = "" ]
		then
			echo -n -e "NA\t\t\t\t\t\t\t"
			echo -n -e "NA\n"
			boolean=0
		fi
	fi
done < $file
fi


