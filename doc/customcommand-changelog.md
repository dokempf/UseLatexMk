# Release history of the add_custom_command command

## 2.6

add_custom_command(OUTPUT output1 [output2 ...]
                   COMMAND command1 [ARGS] [args1...]
                   [COMMAND command2 [ARGS] [args2...] ...]
                   [MAIN_DEPENDENCY depend]
                   [DEPENDS [depends...]]
                   [IMPLICIT_DEPENDS <lang1> depend1 ...]
                   [WORKING_DIRECTORY dir]
                   [COMMENT comment] [VERBATIM] [APPEND])

## 3.2
[BYPRODUCTS [files...]]
[USES_TERMINAL]

## 3.7
[DEPFILE depfile]

## 3.8
[COMMAND_EXPAND_LISTS]
