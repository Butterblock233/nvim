# new env shell to convert .env.tmpl to .env

def unwarp [$list] {
        $list | to text
}

if not ( ".env" | path exists) {
        print "Creating .env file"
        touch ".env" }

# parse to nushell table, and ignore # comments
let tmpl = open .env.tmpl | lines |
        where { not ($in | str starts-with "#") } | where { ($in | str trim) != "" } | split column "="| rename key value
let dotenv = open .env | lines |
        str replace --regex '^#\s*' '' | lines | str trim | split column "=" | rename key value

# get the difference between the two dotent
let diff = $tmpl | where { $in.key not-in $dotenv.key }

# append the difference to the dotenv
if not ($diff | is-empty ) {
        $diff | each {
                let expression = $"(unwarp $in.key)=(unwarp $in.value)"
                let expression_lines = $expression + "\n"
                $expression_lines | save --append .env;
                print $"($expression) saved"
        }
} else { print "There's nothing to do today" }
