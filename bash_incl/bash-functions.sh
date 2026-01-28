##
# Outputs the date and time in a format like this:
#
#   2023-10-15_10:39:31
#
function my_datetime() {
	date +'%Y-%m-%d_%H:%M:%S'
}

##
# Outputs a YYYY-MM-DD_HH:SS date and time.
#
# 2026-18-10_07:18
#
function my_ymdhs_date() {
	##
	# Outputs a YYYY-MM-DD_HH:SS date and time.
	#
	# 2026-18-10_07:18
	#
	date +'%Y-%M-%d_%H:%M'
}
