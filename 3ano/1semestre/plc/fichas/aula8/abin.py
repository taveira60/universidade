from abin_analex import lexer

prox_symb = None

def process_terminal(term):
    global prox_symb
    if prox_symb and prox_symb.type == term:
        val = prox_symb.value
        prox_symb = lexer.token()
        return val
    else:
        raise ValueError("Invalid syntax, expected", term, "got", prox_symb)

def ABIN():
    if prox_symb and prox_symb.type == "PA":
        process_terminal("PA")
        val = ACONT()
        process_terminal("PF")
        return val
    else:
        raise ValueError("Invalid syntax in ABIN")

def ACONT():
    if prox_symb and prox_symb.type == "NUM":
        val = int(process_terminal("NUM"))
        resl = ABIN()
        resd = ABIN()
        return val + resl + resd
    elif prox_symb and prox_symb.type == "PF":
        return 0
    else:
        raise ValueError("Invalid syntax in ACONT")

def parser(s):
    global prox_symb
    lexer.input(s)
    prox_symb = lexer.token()
    val = ABIN()
    return val

print(parser("(6(3()())(4()()))"))
