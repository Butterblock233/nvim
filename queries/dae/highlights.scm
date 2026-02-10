(identifier) @variable
(comment) @comment
(string) @string
(numbers) @number
(boolean) @boolean
(time) @number
(url) @string.special.url
(ip_address) @string.special.url
(cidr) @string.special.url
(unix_path) @string.special.path

(block name: (identifier) @type)
((identifier) @keyword
 (#any-of? @keyword "global" "routing" "dns" "subscription" "node" "group"))

(key_value key: (identifier) @property)

(function_call function_name: (identifier) @function.call)

(logic_operator) @operator
"->" @operator
":" @punctuation.delimiter
"," @punctuation.delimiter
"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"!" @operator
