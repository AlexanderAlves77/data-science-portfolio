# -*- coding: utf-8 -*-
"""Lista encadeada simples.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1NDHQgrHNlaHCZw2MB7gWdnaSG3O80h_U

# Lista encadeada simples
"""

import numpy as np

class No:
  def __init__(self, valor):
    self.valor = valor 
    self.proximo = None 

  def mostra_no(self):
    print(self.valor)

class ListaEncadeada:
  def __init__(self):
    self.primeiro = None 

  def insere_inicio(self, valor):
    novo = No(valor)
    novo.proximo = self.primeiro 
    self.primeiro = novo 

  def lista_vazia(self):
    if self.primeiro == None:
      print('A lista está vazia')
      return None

  def mostrar(self):
    self.lista_vazia()
    atual = self.primeiro 
    while atual != None:
      atual.mostra_no()
      atual = atual.proximo 

  def pesquisa(self, valor):
    self.lista_vazia()
    atual = self.primeiro
    while atual.valor != valor:
      if atual.proximo == None:
        return None
      else:
        atual = atual.proximo
    return atual

  def excluir_inicio(self):
    self.lista_vazia()
    temp = self.primeiro    
    self.primeiro = self.primeiro.proximo 
    return temp

  def excluir_posicao(self, valor):
    atual = self.primeiro
    anterior = self.primeiro
    while atual.valor != valor:
      if atual.proximo == None:
        return None 
      else:
        anterior = atual 
        atual = atual.proximo

    if atual == self.primeiro:
      self.primeiro = self.primeiro.proximo 
    else:
      anterior.proximo = atual.proximo
    return atual

no1 = No(1)
no1.mostra_no()

no2 = No(2)
no2.mostra_no()
#no2.proximo

"""### Insere no início"""

lista = ListaEncadeada()

lista.insere_inicio(1)

lista.primeiro

lista.mostrar()

lista.insere_inicio(2)
lista.mostrar()

lista.primeiro

lista.primeiro.mostra_no()

lista.primeiro.proximo

lista.insere_inicio(3)
lista.insere_inicio(4)
lista.insere_inicio(4)

lista.mostrar()

lista.primeiro.proximo.proximo.proximo.proximo

"""### Excluir do início"""

lista = ListaEncadeada()
lista.insere_inicio(1)
lista.insere_inicio(2)
lista.insere_inicio(3)
lista.insere_inicio(4)
lista.insere_inicio(5)
lista.mostrar()

lista.excluir_inicio()
lista.mostrar()

lista.excluir_inicio()
lista.excluir_inicio()
lista.mostrar()

lista.excluir_inicio()
lista.mostrar()

lista.excluir_inicio()

lista.excluir_inicio()

lista.mostrar()

"""### Pesquisa"""

lista = ListaEncadeada()
lista.insere_inicio(1)
lista.insere_inicio(2)
lista.insere_inicio(3)
lista.insere_inicio(4)
lista.insere_inicio(5)
lista.mostrar()

pesquisa = lista.pesquisa(10)

if pesquisa != None:
  print(f'Encontrado: {pesquisa.valor}')
else:
  print('Não encontrado')

"""### Excluir posição"""

lista = ListaEncadeada()
lista.insere_inicio(1)
lista.insere_inicio(2)
lista.insere_inicio(3)
lista.insere_inicio(4)
lista.insere_inicio(5)
lista.mostrar()

lista.excluir_posicao(3)
lista.mostrar()

lista.excluir_posicao(1)
lista.mostrar()

lista.excluir_posicao(5)
lista.mostrar()