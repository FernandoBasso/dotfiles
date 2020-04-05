# vim: set filetype=sh:

#
#
function my-gen-pw() {

    password_length=8
    password_type=--hex

    if [[ -n $1 ]] ; then
        password_length=$1
    fi

    if [[ -n $2 ]] ; then
        password_type=$2
    fi


    case "$password_type" in
        --hex)
            pw-hex $password_length
            ;;
        --owasp)
            pw-owasp $password_length
            ;;
        *)
            printf '%s\n' 'length, --hex|--owasp'
            ;;
    esac

}

#
# Generates hexacedimal passwords. Takes length as arg.
#
function pw-hex() {
    # Assume $1 is a number.
    cat /dev/urandom \
        | tr -dc 'a-zA-Z0-9' \
        | fold -w "$1" \
        | head -n 1 \
        | tr -d '\n'
}

#
# Generates passwords according to owasp guidelines.
# Takes length as arg.
# https://www.owasp.org/index.php/Password_special_characters
#
function pw-owasp() {
    cat /dev/urandom \
        | tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' \
        | head -c "$1" \
        | tr -d '\n'
}

#
# Generate passwords according to allowed extra characters in Locaweb panel.
#
function pw-locaweb() {
    locaweb_chars='-@!*_:=#/{}[]'
    cat /dev/urandom \
        | tr -dc -- "${locaweb_chars}A-Za-z0-9" \
        | head -c "$1" \
        | tr -d '\n'
}

