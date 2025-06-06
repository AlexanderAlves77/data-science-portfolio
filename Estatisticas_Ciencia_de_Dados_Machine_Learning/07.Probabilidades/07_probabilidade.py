# -*- coding: utf-8 -*-
"""07_Probabilidade.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1lixEDhFTZUhMWzcafCPvUt_LHJ7FzFpn

# Probabilidade

## Importações
"""

import pandas as pd
import numpy as np
import seaborn as sns
from scipy import stats
import math
from sklearn.naive_bayes import GaussianNB

"""## Permutação"""

math.factorial(3)

math.factorial(36) / math.factorial(36 - 5)

math.pow(36, 5)

"""## Combinação"""

n = 6
r = 2

math.factorial(n) / (math.factorial(r) * math.factorial(n - r))

math.factorial(n + r - 1) / (math.factorial(r) * math.factorial(n - 1))

"""## Interseção, união e diferença"""

a = (0,1,2,3,4,5,6,7)
b = (0,2,4,6,8)

"""### Interseção"""

set(a) & set(b)

"""### União"""

set(a) | set(b)

"""### Diferença"""

set(a).difference(set(b))

set(b).difference(set(a))

"""## Probabilidade e distribuição normal

- https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.norm.html
"""

dados = np.array([126. , 129.5, 133. , 133. , 136.5, 136.5, 140. , 140. , 140. ,
                  140. , 143.5, 143.5, 143.5, 143.5, 143.5, 143.5, 147. , 147. ,
                  147. , 147. , 147. , 147. , 147. , 150.5, 150.5, 150.5, 150.5,
                  150.5, 150.5, 150.5, 150.5, 154. , 154. , 154. , 154. , 154. ,
                  154. , 154. , 154. , 154. , 157.5, 157.5, 157.5, 157.5, 157.5,
                  157.5, 157.5, 157.5, 157.5, 157.5, 161. , 161. , 161. , 161. ,
                  161. , 161. , 161. , 161. , 161. , 161. , 164.5, 164.5, 164.5,
                  164.5, 164.5, 164.5, 164.5, 164.5, 164.5, 168. , 168. , 168. ,
                  168. , 168. , 168. , 168. , 168. , 171.5, 171.5, 171.5, 171.5,
                  171.5, 171.5, 171.5, 175. , 175. , 175. , 175. , 175. , 175. ,
                  178.5, 178.5, 178.5, 178.5, 182. , 182. , 185.5, 185.5, 189., 192.5])

sns.distplot(dados, kde = True);

media = np.mean(dados)
desvio_padrao = np.std(dados)
media, desvio_padrao

np.quantile(dados, [0.25, 0.5, 0.75])

"""### Calcular a probabilidade de selecionar uma pessoa em Q1"""

(150.5 - media) / desvio_padrao

# 0.26109

stats.norm.cdf(150.5, media, desvio_padrao)

"""### Calcular a probabilidade de selecionar uma pessoa em Q3"""

(168 - media) / desvio_padrao

# 1 - 0.73891

1 - 0.73891

stats.norm.cdf(168, media, desvio_padrao)

1 - stats.norm.cdf(168, media, desvio_padrao)

stats.norm.sf(168, media, desvio_padrao)

"""### Calcular a probabilidade de selecionar uma pessoa entre Q2 e Q3"""

(168 - media) / desvio_padrao

(159.25 - media) / desvio_padrao

# 0.50

0.73891 - 0.50

stats.norm.cdf(168, media, desvio_padrao)

stats.norm.cdf(159.25, media, desvio_padrao)

stats.norm.cdf(168, media, desvio_padrao) - stats.norm.cdf(159.25, media, desvio_padrao)

"""### Calcular a probabilidade de selecionar uma pessoa em Q1 ou Q3"""

0.26109 + 0.26109

"""### Calcular a probabilidade de não selecionar uma pessoa em Q1 ou Q3"""

1 - 0.52218

"""### Exercício 1

- Uma empresa fez um concurso para seleção de novos funcionários. A prova tinha 50 questões e o Pedro acertou 40 questões. Considerando uma distribuição normal com média 24 e desvio padrão de 8, quais são as chances dele ser contratado?
"""

X = 40
media = 24
desvio_padrao = 8

padronizado = (X - media) / desvio_padrao
padronizado

0.97725

stats.norm.cdf(2.0)

stats.norm.ppf(0.977249868051820)

stats.norm.cdf(X, media, desvio_padrao)

"""### Exercício 2

- A vida útil de uma marca de pneus é representada por uma distribuição normal com média de 38.000 Km e desvio padrão de 3.000 Km

1.   Qual a probabilidade de que um pneu escolhido aleatoriamente tenha vida útil de 35.000 Km?
2.   Qual a probabilidade de que ele dure mais do que 44.000 Km?

### Questão 1
"""

# X = 38000
# media = 35000
# desvio_padrao = 3000

1 - stats.norm.cdf(35000, 38000, 3000)

stats.norm.sf(35000, 38000, 3000)

"""### Questão 2"""

1 - stats.norm.cdf(44000, 38000, 3000)

stats.norm.sf(44000, 38000, 3000)

"""## Probabilidade e distribuição binomial

- https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.binom.html#scipy.stats.binom

### Exemplo das moedas

- Jogando a moeda 10 vezes, qual a probabilidade de obter 5 "caras"?
"""

n = 10 
X = 5
p = 0.5

(math.factorial(n)) / (math.factorial(X) * math.factorial(n - X)) * math.pow(p, X) * math.pow(1 - p, n - X)

stats.binom.pmf(X, n, p)

"""### Exercício 1

- 70% das pessoas que compraram o livro de Python são mulheres. Se 10 leitores forem selecionados randomicamente, qual a probabilidade de selecionarmos 7 mulheres?
"""

n = 10 
X = 7
p = 0.7

(math.factorial(n)) / (math.factorial(X) * math.factorial(n - X)) * math.pow(p, X) * math.pow(1 - p, n - X)

stats.binom.pmf(X, n, p)

"""### Exercício 2

- Em uma linha de produção de uma fábrica de parafusos, a probabilidade de obter um parafuso defeituoso é 0,05. Tendo uma amostra de 50 peças, qual a probabilidade de obter

1.   Um parafuso defeituoso
2.   Nenhum parafuso defeituoso

### Questão 1
"""

n = 50 
X = 1
p = 0.05

(math.factorial(n)) / (math.factorial(X) * math.factorial(n - X)) * math.pow(p, X) * math.pow(1 - p, n - X)

stats.binom.pmf(X, n, p)

"""### Questão 2"""

n = 50 
X = 0
p = 0.05

(math.factorial(n)) / (math.factorial(X) * math.factorial(n - X)) * math.pow(p, X) * math.pow(1 - p, n - X)

stats.binom.pmf(X, n, p)

"""## Probabilidade e distribuição de Poisson

- https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.poisson.html

### Exemplo dos carros

- O número médio de carros vendidos por dia é 10. Qual a probabilidade de vender 14 carros amanhã?
"""

x = 14
media = 10
e = 2.718281828459045

math.pow(e, -media) * (math.pow(media, x) / math.factorial(x)) * 100

stats.poisson.pmf(x, media)

"""### Exercício 1

- Em uma linha de produção de uma fábrica de parafusos, a probabilidade é de obter 0,05 defeitos por UNIDADE. Qual a probabilidade de uma unidade apresentar:

1.   Um defeito
2.   Nenhum defeito
"""

x = 1
media = 0.05
e = 2.718281828459045

math.pow(e, -media) * (math.pow(media, x) / math.factorial(x)) * 100

stats.poisson.pmf(x, media) * 100

"""### Exercício 2

- Um vendedor de uma loja vende em média 50 produtos por dia. Qual a probabilidade de vender somente 5 produtos no próximo dia?
"""

x = 5
media = 50
e = 2.718281828459045

math.pow(e, -media) * (math.pow(media, x) / math.factorial(x)) * 100

stats.poisson.pmf(x, media) * 100

"""## Previsão de probabilidades em machine learning"""

from google.colab import files 
upload = files.upload()

dataset = pd.read_csv('credit_data.csv')
dataset.dropna(inplace = True)
dataset.head()

X = dataset.iloc[:, 1:4].values
X

y = dataset.iloc[:, 4].values
y

naive_bayes = GaussianNB()
naive_bayes.fit(X, y)

X[0], X[0].shape

novo = X[0].reshape(1, -1)
novo.shape

novo

naive_bayes.predict(novo)

previsao = naive_bayes.predict_proba(novo)
previsao

np.argmax(previsao)

