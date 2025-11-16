import ply.lex as lex

# Lista de tokens
tokens = ('NUM', 'PA', 'PF')

# Expressões regulares para cada token
t_PA = r'\('
t_PF = r'\)'

# Token para números (um ou mais dígitos)
t_NUM = r'\d+|\-\d+'

# Ignorar espaços e tabulações
t_ignore = ' \t'

# Contagem de linhas
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)

# Tratamento de erros
def t_error(t):
    print(f"Carácter desconhecido: {t.value[0]} na linha {t.lexer.lineno}")
    t.lexer.skip(1)

# Construir o lexer
lexer = lex.lex()