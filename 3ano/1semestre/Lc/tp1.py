from z3 import *
import networkx as nx

def cria_grafo():
    g=nx.Graph()
    fron={
        'A':'fornecedor areiro',
        'B':'fornecedor barreto',
        'C':'fornecedor vasco',
        'D':'fornecedor quim'
    }

    vias=[
        ('A', 'C', {'capacidade': 3, 'descricao': 'A25 areiro-vasco'}),
        ('B', 'C', {'capacidade': 2, 'descricao': 'A1 barreto-vasco'}),
        ('C', 'D', {'capacidade': 2, 'descricao': 'A3 vasco-quim'}),
        ('A', 'D', {'capacidade': 1, 'descricao': 'Via Secundária areiro-quim'})
    ]
    g.add_edges_from(vias)
    
    return g, fron

def main():
    g, fron = cria_grafo()
    print("\n📊 Estrutura do grafo:")
    print("Nodos:", g.nodes())
    print("Arestas:", g.edges(data=True))
    
