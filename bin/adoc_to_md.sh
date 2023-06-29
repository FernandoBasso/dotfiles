##
# Provide an .adoc file.
#
#   $ adoc_to_md intro.adoc
#
adoc_to_md () {
  file="$1"
  base="${file%.adoc}"

  asciidoctor --backend docbook "$file"

  pandoc \
    --from docbook \
    --to markdown_strict \
    "${base}.xml" \
    --wrap=none \
    --output "${base}.md"

  rm "${base}.xml"

  printf '%s\n' "Converted $file to ${base}.md"
}
