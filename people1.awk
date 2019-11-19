BEGIN { FS="[;,-]" }

{
	$2 = substr($2, 2)  # string positions begin at 1, not zero
	printf "%s %s (%s) ", $2, $1, $3 	# notice no newline here
	if (NF > 6) # if this line has more than 6 fields
	{
		age = $7 - $4
		printf "died in %d at the age of %d.\n", $7, age
	}
	else
	{
		printf "was born in %d and is still alive.\n", $4
	}
}