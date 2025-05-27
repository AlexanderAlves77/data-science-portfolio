from Fila import Fila

class Largura:
    def __init__(self, inicio, objetivo):
        self.inicio = inicio
        self.inicio.visitado = True
        self.objetivo = objetivo
        self.fronteira = Fila(20)
        self.fronteira.enfileirar(inicio)
        self.achou = False

    def buscar(self):
        primeiro = self.fronteira.getPrimeiro()
        print(f'Primeiro: {primeiro.nome}')

        if primeiro == self.objetivo:
            self.achou = True
        else:
            temp = self.fronteira.desenfileirar()
            print(f'Desenfileirou: {temp.nome}')
            for a in primeiro.adjacentes:
                print(f'Verificando se já visitado: {a.cidade.nome}')
                if a.cidade.visitado == False:
                    a.cidade.visitado = True
                    self.fronteira.enfileirar(a.cidade)
            if self.fronteira.numeroElementos > 0:
                Largura.buscar(self)


from Mapa import Mapa
mapa = Mapa()
largura = Largura(mapa.portoUniao, mapa.curitiba)
largura.buscar()