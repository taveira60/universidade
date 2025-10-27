
import ply.lex as lex
import re

input = """#include <stdio.h>

int main()
{
    printf("hello, world\n");
}

#include <stdio.h>

int main(int argc, char *argv) {
    int a = 5, b = 3;
    int sum = a + b;

    printf("Sum: %d\n", sum);
    return 0;
}
"""

# def ex1(input):

#     tokens = (
#         "HASHTAG", "INCLUDE", "LIBRARY", "MENOR", "MAIOR",
#         "INT", "CHAR", "COMMA", "RETURN", "SEMI", "STRING",
#         "PLUS", "EQUALS", "AC", "FC", "PA", "PF", "VAR", "NUM"
#     )

    
#     t_HASHTAG = r"#"
#     t_INCLUDE = r"include"
#     t_MENOR   = r"<"
#     t_MAIOR   = r">"
#     t_RETURN  = r"return"
#     t_PLUS    = r"\+"
#     t_EQUALS  = r"="
#     t_COMMA   = r","
#     t_SEMI    = r";"
#     t_AC      = r"\{"
#     t_FC      = r"\}"
#     t_PA      = r"\("
#     t_PF      = r"\)"
#     t_INT     = r"int"
#     t_CHAR    = r"char"
#     t_LIBRARY = r"\w+\.\w+"
#     t_STRING  = r'\".*?\"|\'.*?\''  
#     t_NUM     = r"\d+"

    
#     t_VAR     = r"[a-zA-Z_]\w*"

#     t_ignore = " \t"

#     def t_newline(t):
#         r'\n+'
#         t.lexer.lineno += len(t.value)

#     def t_error(t):
#         print(f"Illegal character {t.value[0]}")
#         t.lexer.skip(1)
#     lexer = lex.lex()
#     lexer.input(input)
#     for tok in lexer:
#         print(tok)

## Exercise 4.2

# Write a function that, using the lexer, identify all identifiers that occur in a snippet of C code.

# For instance, for the first example above, it should return `["main", "printf"]`, and for the second `["main", "printf", "argc", "argv", "a", "b", "sum"]`.

# def ex2(input):
#     tokens = (
#         "HASHTAG", "INCLUDE", "LIBRARY", "MENOR", "MAIOR",
#         "INT", "CHAR", "COMMA", "RETURN", "SEMI", "STRING",
#         "PLUS", "EQUALS", "AC", "FC", "PA", "PF", "VAR", "NUM"
#     )

#     t_HASHTAG = r"\#"
#     t_INCLUDE = r"include"
#     t_MENOR   = r"<"
#     t_MAIOR   = r">"
#     t_RETURN  = r"return"
#     t_PLUS    = r"\+"
#     t_EQUALS  = r"="
#     t_COMMA   = r","
#     t_SEMI    = r";"
#     t_AC      = r"\{"
#     t_FC      = r"\}"
#     t_PA      = r"\("
#     t_PF      = r"\)"
#     t_INT     = r"int"
#     t_CHAR    = r"char"
#     t_LIBRARY = r"\w+\.\w+"
#     t_STRING  = r'\".*?\"|\'.*?\''
#     t_NUM     = r"\d+"

#     t_VAR     = r"[a-zA-Z_]\w*"
#     t_ignore  = " \t"

#     def t_newline(t):
#         r'\n+'
#         t.lexer.lineno += len(t.value)

#     def t_error(t):
#         print(f"Illegal character {t.value[0]}")
#         t.lexer.skip(1)

#     lexer = lex.lex()
#     lexer.input(input)

#     identifiers = []

#     for tok in lexer:
#         if tok.type == "VAR":
#             identifiers.append(tok.value)

#     return identifiers


# print(ex2(input))


## Exercise 4.3

# Adapt the previous exercise so that each identifier occurrence also reports the *line* in which it occurs.

# For instance, for the first example above, it should return `[("main",[3]), )("printf",[5])`, and for the second `[("main",[3]), ("printf",[7]), ("argc",[3]), ("argv",[3]), ("a",[4,5]), ("b",[4,5]), ("sum",[5,7])`.
def ex3(input):
    tokens = (
        "HASHTAG", "INCLUDE", "LIBRARY", "MENOR", "MAIOR",
        "INT", "CHAR", "COMMA", "RETURN", "SEMI", "STRING",
        "PLUS", "EQUALS", "AC", "FC", "PA", "PF", "VAR", "NUM"
    )

    t_HASHTAG = r"\#"
    t_INCLUDE = r"include"
    t_MENOR   = r"<"
    t_MAIOR   = r">"
    t_RETURN  = r"return"
    t_PLUS    = r"\+"
    t_EQUALS  = r"="
    t_COMMA   = r","
    t_SEMI    = r";"
    t_AC      = r"\{"
    t_FC      = r"\}"
    t_PA      = r"\("
    t_PF      = r"\)"
    t_INT     = r"int"
    t_CHAR    = r"char"
    t_LIBRARY = r"\w+\.\w+"
    t_STRING  = r'\".*?\"|\'.*?\''
    t_NUM     = r"\d+"

    t_VAR     = r"[a-zA-Z_]result = [(name, lines) for name, lines in identifiers.items()]\w*"
    t_ignore  = " \t"

    def t_newline(t):
        r'\n+'
        t.lexer.lineno += len(t.value)

    def t_error(t):
        print(f"Illegal character {t.value[0]}")
        t.lexer.skip(1)

    lexer = lex.lex()
    lexer.input(input)

    identifiers = {}

    for tok in lexer:
        if tok.type == "VAR":
            if tok.value not in identifiers:
                identifiers[tok.value].append(tok.lineno)
    result = [(name, lines) for name, lines in identifiers.items()]
    return result

print(ex3(input))