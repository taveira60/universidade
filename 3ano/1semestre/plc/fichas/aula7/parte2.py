import exe1

prox_simb=('Erro','',0,0)

# p1:   s-> '('s')'s 
# p2        | ε

#First('('s')'s)={"("}
#first(ε)={ε}
#follow(s)={')',ε}

def avanca():
    global prox_simb
    prox_simb = exe1.lexer.token()
    
    
def consome(token_esperado):
    global prox_simb
    if prox_simb and prox_simb.type == token_esperado:
        avanca()
    else:
        raise SyntaxError(f"Esperava '{token_esperado}' mas encontrei '{prox_simb.type if prox_simb else 'EOF'}'")
    
def s():
    global prox_simb
    if prox_simb and prox_simb.type == 'PA':   # '('
        consome('PA')
        s()                        # chama s recursivamente
        consome('PF')
        s()                        # pode haver outra sequência
    else:
        # ε-produção → não faz nada
        pass

def rec_Parser(data):
    global prox_simb
    exe1.lexer.input(data)
    prox_simb = exe1.lexer.token()
    s()
    if prox_simb is not None:  # ainda há tokens não consumidos
        raise SyntaxError(f"Símbolo inesperado: {prox_simb.type}")
    print("That's all folks!")
    
    
rec_Parser("(((()())))")
# saída: That's all folks!

rec_Parser("()()()")
# saída: That's all folks!

rec_Parser("((())") 