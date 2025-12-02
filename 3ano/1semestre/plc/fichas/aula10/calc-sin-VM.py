import ply.yacc as yacc
from calc_lex_VM import lexer , tokens , literals

def p_program(t):
    r'''
    Exp : Exp "+" Term
        : Exp "-" Term
        | Term
        
    Term : Term "*" Factor
         | Term "/" Factor
         | Factor
         
    Factor  : NUM
            | VAR
            | "(" EXP ")"
            | Cond "?" Exp ":" Exp
    '''