BEGIN { FS=":" }

{
	if ($3 > 75 && $3 <= 200)
	{
		printf "%s - %d\n", $1, $3
	}
}