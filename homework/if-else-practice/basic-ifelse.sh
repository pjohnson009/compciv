if [[ "$#" -lt 1 ]]; then
echo "You need more than 0 arguments"
elif [[ "$#" -eq 1 ]]; then
echo "The only argument is $1"
elif [[ "$#" -gt 3 ]]; then
echo "You need fewer than $# arguments"
fi

if [[ "$#" -eq 2 && "$1" -eq "$2" ]]; then
echo "There are two arguments: $1 and $2"
echo "$1 is equal to $2"
elif [[ "$#" -eq 2 && "$1" -lt "$2" ]]; then
echo "There are two arguments: $1 and $2"
echo "$1 is less than $2"
elif [[ "$#" -eq 2 && "$1" -gt "$2" ]]; then
echo "There are two arguments: $1 and $2"
echo "$1 is greater than $2"
fi
if [[ "$#" -eq 3 && "$1" -eq "$2" && "$1" -eq "$3" ]]; then
echo "There are three arguments: $1, $2, and $3"
echo "$1 is equal to $2 and is eqal to $3"
elif [[ "$#" -eq 3 && "$1" -eq "$2" && "$1" -gt "$3" ]]; then
echo "There are three arguments: $1, $2, and $3"
echo "$1 is equal to $2 and is greater than $3"
elif [[ "$#" -eq 3 && "$1" -eq "$2" && "$1" -lt "$3" ]]; then
echo "There are three arguments: $1, $2, and $3"
echo "$1 is equal to $2 and is less than $3"
elif [[ "$#" -eq 3 && "$1" -lt "$2" && "$1" -lt "$3" ]]; then
echo "There are three arguments: $1, $2, and $3"
echo "$1 is less than $2 and is less than $3"
elif [[ "$#" -eq 3 && "$1" -gt "$2" && "$1" -gt "$3" ]]; then
echo "There are three arguments: $1, $2, and $3"
echo "$1 is greater than $2 and is greater than $3"
fi
