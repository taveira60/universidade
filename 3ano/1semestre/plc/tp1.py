import csv
def ex1():
    dic={}
    i=0
    with open('alunos.csv', mode ='r')as file:
        ficheiro = csv.reader(file)
        for linha in ficheiro:
            i+=1
            id=linha[0]
            nome=linha[1]
            curso=linha[2]
            natas=[linha[3],linha[4],linha[5],linha[6]]
            dic[id]= ["nome:" + nome, "curso:" + curso, "notas:" + str(natas)]
        print(dic)
        # resoluçao prof
        #     dicalunos={}
        #     for aluno in alunos:
        #         dicalunos[aluno[0]]={"nome":aluno[1],"curso":aluno[2],"notas":aluno[3:]}    
                
            
    return dic

# def media():
#     dic=ex1()
#     media =0 
#     for id in dic:
#         aluno=



def main():
    ex1()

if __name__ == "__main__":
    main()