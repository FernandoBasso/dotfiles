_deno() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            deno)
                cmd="deno"
                ;;
            
            bundle)
                cmd+="__bundle"
                ;;
            cache)
                cmd+="__cache"
                ;;
            compile)
                cmd+="__compile"
                ;;
            completions)
                cmd+="__completions"
                ;;
            doc)
                cmd+="__doc"
                ;;
            eval)
                cmd+="__eval"
                ;;
            fmt)
                cmd+="__fmt"
                ;;
            help)
                cmd+="__help"
                ;;
            info)
                cmd+="__info"
                ;;
            install)
                cmd+="__install"
                ;;
            lint)
                cmd+="__lint"
                ;;
            lsp)
                cmd+="__lsp"
                ;;
            repl)
                cmd+="__repl"
                ;;
            run)
                cmd+="__run"
                ;;
            test)
                cmd+="__test"
                ;;
            types)
                cmd+="__types"
                ;;
            upgrade)
                cmd+="__upgrade"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        deno)
            opts=" -q -h -V -L  --unstable --quiet --help --version --log-level   bundle cache compile completions doc eval fmt info install lsp lint repl run test types upgrade help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        
        deno__bundle)
            opts=" -h -V -q -c -r -L  --no-remote --no-check --lock-write --watch --help --version --unstable --quiet --import-map --config --reload --lock --cert --log-level  <source_file> <out_file> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__cache)
            opts=" -h -V -q -c -r -L  --no-remote --no-check --lock-write --help --version --unstable --quiet --import-map --config --reload --lock --cert --log-level  <file>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__compile)
            opts=" -h -V -q -c -r -o -L  --no-remote --no-check --lock-write --help --version --unstable --quiet --import-map --config --reload --lock --cert --output --log-level  <source_file> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__completions)
            opts=" -h -V -q -L  --help --version --unstable --quiet --log-level  <shell> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__doc)
            opts=" -h -V -q -r -L  --json --private --help --version --unstable --quiet --import-map --reload --log-level  <source_file> <filter> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__eval)
            opts=" -T -p -h -V -q -c -r -L  --no-remote --no-check --lock-write --cached-only --ts --print --help --version --unstable --quiet --import-map --config --reload --lock --cert --inspect --inspect-brk --v8-flags --seed --log-level  <CODE_ARG>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect-brk)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --v8-flags)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__fmt)
            opts=" -h -V -q -L  --check --watch --help --version --unstable --quiet --ignore --log-level  <files>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --ignore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__help)
            opts=" -h -V -q -L  --help --version --unstable --quiet --log-level  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__info)
            opts=" -h -V -q -r -L  --no-check --json --help --version --unstable --quiet --reload --cert --import-map --log-level  <file> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__install)
            opts=" -A -f -h -V -q -c -r -n -L  --no-remote --no-check --lock-write --allow-env --allow-run --allow-plugin --allow-hrtime --allow-all --cached-only --force --help --version --unstable --quiet --import-map --config --reload --lock --cert --inspect --inspect-brk --allow-read --allow-write --allow-net --v8-flags --seed --name --root --log-level  <cmd>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect-brk)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-read)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-write)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-net)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --v8-flags)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__lint)
            opts=" -h -V -q -L  --rules --json --help --version --unstable --quiet --ignore --log-level  <files>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --ignore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__lsp)
            opts=" -h -V -q -L  --help --version --unstable --quiet --log-level  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__repl)
            opts=" -h -V -q -c -r -L  --no-remote --no-check --lock-write --cached-only --help --version --unstable --quiet --import-map --config --reload --lock --cert --inspect --inspect-brk --v8-flags --seed --log-level  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect-brk)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --v8-flags)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__run)
            opts=" -A -h -V -q -c -r -L  --no-remote --no-check --lock-write --allow-env --allow-run --allow-plugin --allow-hrtime --allow-all --cached-only --watch --help --version --unstable --quiet --import-map --config --reload --lock --cert --inspect --inspect-brk --allow-read --allow-write --allow-net --v8-flags --seed --log-level  <SCRIPT_ARG>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect-brk)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-read)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-write)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-net)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --v8-flags)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__test)
            opts=" -A -h -V -q -c -r -L  --no-remote --no-check --lock-write --allow-env --allow-run --allow-plugin --allow-hrtime --allow-all --cached-only --no-run --fail-fast --allow-none --coverage --help --version --unstable --quiet --import-map --config --reload --lock --cert --inspect --inspect-brk --allow-read --allow-write --allow-net --v8-flags --seed --filter --log-level  <files>... <SCRIPT_ARG>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --import-map)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reload)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lock)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --inspect-brk)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-read)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-write)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --allow-net)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --v8-flags)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --filter)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__types)
            opts=" -h -V -q -L  --help --version --unstable --quiet --log-level  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        deno__upgrade)
            opts=" -f -h -q -L  --dry-run --force --canary --help --unstable --quiet --version --output --cert --log-level  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                    -L)
                    COMPREPLY=($(compgen -W "debug info" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

complete -F _deno -o bashdefault -o default deno
