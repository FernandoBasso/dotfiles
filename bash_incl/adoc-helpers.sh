##
# Converts all .md files to .adoc.
#
# Uses kramdown-asciidoc ruby gem. It is a gem by Dan Allen, the
# maintainer of Asciidoctor itself. One important feature of this
# gem (as opposed to Pandoc support for AsciiDoc) is that it supports
# the “one sentence per line” style which is recommended for AsciiDoc
# documents with the option --wrap=ventilate.
#
# Make sure the said gem is installed:
#
#   $ gem install kramdown-asciidoc
#
# USAGE: cd to the directory containing the .md files and simply
# run md_to_adoc.
#
# If the .adoc files have been converted as expected (inspect some of
# them), one may want to delete the original .md files:
#
#   $ rm -vi ./*.md
#
# BEWARE: Remember that on the command line there is not trash bin.
# Careful when removing stuff. You have been warned.
#
function md_to_adoc () {
	for file in ./*.md
	do
		kramdoc \
			--format=GFM \
			--output="${file%.md}.adoc" \
			--wrap=ventilate "$file"
	done
}
