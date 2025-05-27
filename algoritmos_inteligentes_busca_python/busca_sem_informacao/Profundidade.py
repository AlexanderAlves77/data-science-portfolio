from Pilha import Pilha

class Profundidade:
    def __init__(self, inicio, objetivo):
        self.inicio = inicio
        self.inicio.visitado = True
        self.objetivo = objetivo
        self.fronteira = Pilha(20)
        self.fronteira.empilhar(inicio)
        self.achou = False

    def buscar(self):
        topo = self.fronteira.getTopo()
        print(f'Topo: {topo.nome}')

        if topo == self.objetivo:
            self.achou = True
        else:
            for a in topo.adjacentes:
                if self.achou == False:
                    print(f'Verificando se já visitado: {a.cidade.nome}')
                    if a.cidade.visitado == False:
                        a.cidade.visitado = True
                        self.fronteira.empilhar(a.cidade)
                        Profundidade.buscar(self)
        print(f'Desempilhou: {self.fronteira.desempilhar().nome}')


from Mapa import Mapa
mapa = Mapa()
profundidade = Profundidade(mapa.portoUniao, mapa.curitiba)
profundidade.buscar()