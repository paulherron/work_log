BEGIN {
	print "Looking for times in minutes (e.g. [25]) in log file:\n"
}
{
	if ($1 ~ /^-/ && dayTotal) {
		print "Total for this day is", dayTotal, " minutes (" dayTotal / 60 " hours)"
		print "\n"
		dayTotal = 0
	}

	# Print the whole line.
	print $0

	# Stop at the end of the log
	if ($0 == "-- end --") {
		print "\n"
		exit
	}
	
	# Underneath, print the extracted time.
	if ($NF ~ /^\[/) {
		# Remove square brackets around the time.
		gsub(/\[|\]/, "", $NF); 
		dayTotal += $NF
		total += $NF
		print " + ", $NF
	}
}
END {
	print "Grand total is", total, " minutes (" total / 60 " hours)"
}
