import ply.lex as lex
import re

texto = '''CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER
);

INSERT INTO users (name, age) VALUES ('Alice', 30);

SELECT name FROM users WHERE age > 25;'''
#1)

# tokens = [
#     'CREATE', 'TABLE', 'VAR', 'INTEGER', 'PRIMARY', 'TEXT', 'KEY',
#     'INSERT', 'INTO', 'PA', 'PF', 'COMMA', 'SEMICOLON',
#     'FROM', 'MAIOR', 'WHERE', 'INT', 'NAME','VALUES','SELECT'
# ]

# t_SELECT      = r'SELECT'
# t_VALUES      = r'VALUES'
# t_CREATE      = r'CREATE'
# t_TABLE       = r'TABLE'
# t_INTEGER     = r'INTEGER'
# t_PRIMARY     = r'PRIMARY'
# t_KEY         = r'KEY'
# t_TEXT        = r'TEXT'
# t_INSERT      = r'INSERT'
# t_INTO        = r'INTO'
# t_FROM        = r'FROM'
# t_WHERE       = r'WHERE'
# t_MAIOR       = r'>'
# t_PA          = r'\('
# t_PF          = r'\)'
# t_COMMA       = r','
# t_SEMICOLON   = r';'


# t_INT         = r'\d+'


# t_VAR         = r'[a-z_]+'


# t_NAME        = r"'[A-Za-z]+'"


# t_ignore = ' \t'

# def t_newline(t):
#     r'\n+'
#     t.lexer.lineno += len(t.value)

# def t_error(t):
#     print(f"Caractere ilegal: {t.value[0]!r}")
#     t.lexer.skip(1)


# lexer = lex.lex()


# lexer.input(texto)

# id_line={}

# for tok in lexer:
#     if tok.type == "VAR":
#         if tok.value not in id_line:
#             id_line[tok.value] = []
#         id_line[tok.value].append(tok.lineno)
#     print(tok)
    
    


# ## Exercise 3.2

# Write a function that, using the lexer, identifies and returns all occurrences of identifiers, literal integers, and literal strings.

# For instance, for the examples above:
# {
#   "id": ["id", "name", "age", "users"],
#   "string": ["Alice"],
#   "int": [30, 25]
# }

def ex2(texto):
    tokens = [
        'CREATE', 'TABLE', 'VAR', 'INTEGER', 'PRIMARY', 'TEXT', 'KEY',
        'INSERT', 'INTO', 'PA', 'PF', 'COMMA', 'SEMICOLON',
        'FROM', 'MAIOR', 'WHERE', 'INT', 'NAME','VALUES','SELECT'
    ]

    t_SELECT      = r'SELECT'
    t_VALUES      = r'VALUES'
    t_CREATE      = r'CREATE'
    t_TABLE       = r'TABLE'
    t_INTEGER     = r'INTEGER'
    t_PRIMARY     = r'PRIMARY'
    t_KEY         = r'KEY'
    t_TEXT        = r'TEXT'
    t_INSERT      = r'INSERT'
    t_INTO        = r'INTO'
    t_FROM        = r'FROM'
    t_WHERE       = r'WHERE'
    t_MAIOR       = r'>'
    t_PA          = r'\('
    t_PF          = r'\)'
    t_COMMA       = r','
    t_SEMICOLON   = r';'


    t_INT         = r'\d+'


    t_VAR         = r'[a-z_]+'


    t_NAME        = r"'[A-Za-z]+'"


    t_ignore = ' \t'

    def t_newline(t):
        r'\n+'
        t.lexer.lineno += len(t.value)

    def t_error(t):
        print(f"Caractere ilegal: {t.value[0]!r}")
        t.lexer.skip(1)


    lexer = lex.lex()
    lexer.input(texto)
    
    result={"id":[],"string":[],"int":[]}
    
    for tok in lexer:
        if tok.type == "VAR":
            result["id"].append(tok.value)
        elif tok.type=="NAME":
            result["string"].append(tok.value.strip("'"))
        elif tok.type=="INT":
            result["int"].append(tok.value)
    return result

print(ex2(texto))