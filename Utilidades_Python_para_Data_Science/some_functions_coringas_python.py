from random import random
import math

# Bubble Sort
def bubble_sort(arr):
  n = len(arr)
  for i in range(n):
    for j in range(0, n - i - 1):
      if arr[j] > arr[j + 1]:
        temp = vetor[j]
        arr[j] = arr[j + 1]
        arr[j + 1] = temp 
  return arr

bubble_sort([10, 1, 99, 5, 77, 3, 42, 8, 831, 235, 63, 4, 337, 81, 50, 999, 61])


# Normalização de dados 
numbers = [10, 1, 99, 5, 77, 3, 42, 8, 831, 235, 63, 4, 337, 81, 50, 999, 61]
normalize = (numbers[idx] - min) / (max - min)

normalizar = [((item - min(dataset) / (max(dataset) - min(dataset)) for item in dataset]


# Gerar Lista com Palavras Aleatórias
words = ["background", "image", "left", "bottom", "chart", "right", "width", "draw", "height", "top", "onload", "custom"]

def generateList(list):
    newList = []
    getRandom = lambda min, max: math.floor(random() * (max - min + 1)) + min 
    getRandomWord = lambda list: list[getRandom(0, len(list) - 1)]
    for i in range(1, 31):
        newList.append(getRandomWord(list))    
    return newList
    
generateList(words)


# Gerar Senha Aleatória
letters = "abcdefghijklmnopqrstuxwyz0123456789ABCDEFGHIJKLMNOPQRSTUWYXZ@#$%&"

def generatePassword(words):
    list = ""
    getRandom = lambda min, max: math.floor(random() * (max - min + 1)) + min 
    getRandomWord = lambda words: words[getRandom(0, len(words) - 1)]
    for i in range(1, 13):
        list += getRandomWord(words)
    return list
    
generatePassword(letters)


# Calcula media, moda e mediana
def get_estatisticas(dataframe):
  media = dataset['fi.xi'].sum() / dataset['fi'].sum()
  moda = dataset[dataset['fi'] == dataset['fi'].max()]['xi'].values[0]

  fi_2 = dataset['fi'].sum() / 2
  limite_inferior, frequencia_classe, id_frequencia_anterior = 0, 0, 0
  for i, linha in enumerate(dataset.iterrows()):
    limite_inferior = linha[1][0]
    frequencia_classe = linha[1][2]
    id_frequencia_anterior = linha[0]
    if linha[1][5] >= fi_2:
      id_frequencia_anterior -= 1
      break
  Fi_anterior = dataset.iloc[[id_frequencia_anterior]]['Fi'].values[0]
  mediana = limite_inferior + ((fi_2 - Fi_anterior) * 4) / frequencia_classe
  return media, moda, mediana
  
  
# Calcula Variância, Desvio Padrão e Coeficiente da Variância
def get_variancia_desvio_padrao_coeficiente(dataset):
    media = dataset.sum() / len(dataset)
    desvio = abs(dataset - media) ** 2
    soma_desvio = desvio.sum()
    variancia = soma_desvio / len(dataset)
    dp = math.sqrt(variancia)
    cv = (dp / media) * 100
    return variancia, dp, cv
    
    
# Faz a Distribuição Normalizada Padronizada
def distribuicao_normalizada_padronizada(dataset):
    media = dataset.sum() / len(dataset)
    desvio = abs(dataset - media) ** 2
    soma_desvio = desvio.sum()
    variancia = soma_desvio / len(dataset)
    dp = math.sqrt(variancia)
    dnp = (dataset - media) / dp
    return dnp


# Funções Utilitárias para Projetos Data Science
def validate_dataframe(df):
    required_columns = ['id_aplicativo', 'id_compra', 'Date', 'user_id', 'quantidade', 'item_id']
    for col in required_columns:
        if col not in df.columns:
            raise KeyError(f"A coluna '{col}' está faltando no DataFrame!")
    if df.isnull().any().any():
        raise ValueError("O DataFrame contém valores nulos! Verifique os dados.")
    print("DataFrame validado com sucesso!")


def validate_dataframe_columns(df, required_columns):
    """Valida se o DataFrame contém as colunas obrigatórias."""
    missing_columns = [col for col in required_columns if col not in df.columns]
    if missing_columns:
        raise ValueError(f"As seguintes colunas estão ausentes no DataFrame: {missing_columns}")


def validate_and_prepare_data(app_data):
    """Valida e prepara o DataFrame para o processamento, incluindo colunas obrigatórias."""
    required_columns = ['item_id', 'user_id', 'id_aplicativo']
    missing_columns = [col for col in required_columns if col not in app_data.columns]
    if missing_columns:
        raise ValueError(f"As seguintes colunas estão ausentes no DataFrame: {missing_columns}")
    # Adiciona 'itens_compra' se não existir
    if 'itens_compra' not in app_data.columns:
        print("[LOG]: Coluna 'itens_compra' ausente. Criando automaticamente...")
        app_data['itens_compra'] = app_data['item_id']
    return app_data


def validade_filtered_data(df, min_users=2, min_items=2):
    if df['user_id'].nunique() < min_users or df['item_id'].nunique() < min_items:
        raise ValueError("O DataFrame não contém informações suficientes após a filtragem.")


def validate_node(graph, node):
    """Função para verificar consistência de nós"""
    if node not in graph:
        return False
    if not list(graph.neighbors(node)):
        return False
    return True


def validate_item_with_neighbors(graph, item_id):
    """Valida se um item está no grafo e possui vizinhos."""
    if item_id not in graph.nodes:
        print(f"'{item_id}' NÃO está no grafo.")
        return False
    neighbors = list(graph.neighbors(item_id))
    if len(neighbors) == 0:
        print(f"'{item_id}' está no grafo, mas não possui conexões.")
        return False
    return True


def validate_inputs(dfApp, appList):
    """Valida entradas do DataFrame e lista de aplicativos."""
    if not isinstance(appList, list) or len(appList) == 0:
        raise ValueError("appList deve ser uma lista não vazia de IDs de aplicativos.")
    if not isinstance(dfApp, pd.DataFrame):
        raise ValueError("dfApp deve ser um DataFrame do pandas.")
    required_columns = ['id_aplicativo', 'id_compra', 'Date', 'user_id', 'quantidade', 'item_id']
    missing_columns = [col for col in required_columns if col not in dfApp.columns]
    if missing_columns:
        raise ValueError(f"O DataFrame fornecido está faltando as colunas obrigatórias: {missing_columns}")


def prepare_app_data(dfApp, app):
    """Prepara os dados para o aplicativo especificado."""
    app_data = dfApp[dfApp['id_aplicativo'] == app]
    if app_data.shape[0] < 100:
        print(f"Aviso: O aplicativo {app} possui menos de 100 registros. Ignorado.")
        return None
    return app_data[['id_aplicativo', 'id_compra', 'Date', 'user_id', 'quantidade', 'item_id']]


def split_and_train_test(dfCovisitation, userList):
    """Divide o DataFrame de covisitação em treino e teste."""
    df_test_covisitation = split_test_df(dfCovisitation, userList)
    df_train_covisitation = dfCovisitation.drop(df_test_covisitation.index, axis=0)
    print(f"Train: {df_train_covisitation.shape[0]}, Test: {df_test_covisitation.shape[0]}")
    return df_train_covisitation, df_test_covisitation


def prepare_item_seed(df_train_covisitation, GTrain):
    """Prepara o DataFrame de seeds de itens, garantindo que estão no grafo e possuem vizinhos."""
    user_list = df_train_covisitation['user_id'].unique()
    df_item_seed_train = item_seed_df(df_train_covisitation, user_list)

    # Filtrar itens que estão no grafo e têm vizinhos
    df_item_seed_train = df_item_seed_train[
        df_item_seed_train['item_id'].apply(lambda x: validate_item_with_neighbors(GTrain, x))
    ]
    return df_item_seed_train


def generate_recommendations(df_item_seed_train, GTrain, df_test_covisitation):
    """Gera as recomendações com base nos seeds fornecidos."""
    try:
        df_recommendations_temp = recommendation_seed(df_item_seed_train, GTrain)
        return covisitation_explosion(df_recommendations_temp, df_test_covisitation)
    except Exception as e:
        print(f"Erro na geração de recomendações: {e}")
        return pd.DataFrame()


def calculate_assertiveness(df):
    """Calcula a assertividade das recomendações baseadas no valor 'true'."""
    return df['true'].sum() / df['true'].count() if df['true'].count() > 0 else 0


def verify_true_column(df):
    if 'true' not in df.columns:
        raise KeyError("A coluna 'true' não foi criada corretamente. Verifique as etapas anteriores.")
    print(f"Coluna 'true' criada com {df['true'].sum()} acertos registrados.")


def log_data(message, df=None):
    print(f"[LOG]: {message}")
    if df is not None:
        print(df.head())
        
        
# Formatar Conotação Científica
def autopct_format(values):
    def my_format(pct):
        total = sum(values)
        val = int(round(pct * total / 100.0))
        return ' $ {v:d}'.format(v = val)
    return my_format


# Conta quantas linhas num Dataset
def count_lines(filename):
    f = open(filename, "r")
    data = f.read()
    rows = data.split("\n")
    full_data = []
    for row in rows:
        split_row = row.split(",")
        full_data.append(split_row)
    count = 0
    for row in full_data:
        count += 1
    print(f"Tem {count} linhas.")

count_lines("arquivos/salarios.csv")


# Conta quantas linhas num Dataset
def count_columns(filename):
    f = open(filename, "r")
    data = f.read()
    rows = data.split("\n")
    full_data = []
    for row in rows:
        split_row = row.split(",")
        full_data.append(split_row)
        first_row = full_data[0]
    count = 0
    count = 0
    for column in first_row:
        count += 1
    print(f"Tem {count} colunas.")

count_columns("arquivos/salarios.csv")



# Gerar Token 
def generateToken():
    letters = "abcdefghijklmnopqrstuxwyz0123456789ABCDEFGHIJKLMNOPQRSTUWYXZ@#$%&"
    token = []
    part_01 = ""
	  part_02 = ""
	  part_03 = ""

    getRandom = lambda min, max: math.floor(random() * (max - min + 1)) + min 
    getRandomWord = lambda words: words[getRandom(0, len(words) - 1)]
	
    for i in range(1, 37):
      part_01 += getRandomWord(letters)
    for i in range(1, 76):
      part_02 += getRandomWord(letters)
    for i in range(1, 44): 
      part_03 += getRandomWord(letters)
    
    token = f'{part_01}.{part_02}.{part_03}'
    return token

generateToken()


# Gerando uma Lista no Pandas 
from random import choices
import pandas as pd

lista = []
qtd = 10000
tamanho = 10
valores = range(5000, 1500000)

listas = [ choices(valores, k=tamanho) for _ in range(qtd) ]
setores = ["Setor_A", "Setor_B", "Setor_C", "Setor_D", "Setor_E", "Setor_F", "Setor_G", "Setor_H", "Setor_I", "Setor_J"]

df_dados = pd.DataFrame(listas, columns=setores)
df_dados

file_name = 'FileData.xlsx'
df_dados.to_csv(file_name)
print('DataFrame is written to CSV File successfully.')



def monte_carlo_previsao(dataset, ativo, dias_a_frente, simulacoes):
  dataset = dataset.copy()
  dataset = pd.DataFrame(dataset[ativo])

  dataset_normalizado = dataset.copy()
  for i in dataset:
    dataset_normalizado[i] = dataset[i] / dataset[i][0]

  dataset_taxa_retorno = np.log(1 + dataset_normalizado.pct_change())
  dataset_taxa_retorno.fillna(0, inplace = True)

  media = dataset_taxa_retorno.mean()
  variancia = dataset_taxa_retorno.var()

  drift = media - (0.5 * variancia)
  desvio_padrao = dataset_taxa_retorno.std()
  Z = stats.norm.ppf(np.random.rand(dias_a_frente, simulacoes))
  retornos_diarios = np.exp(drift.values + desvio_padrao.values * Z)

  previsoes = np.zeros_like(retornos_diarios)
  previsoes[0] = dataset.iloc[-1]

  for dia in range(1, dias_a_frente):
    previsoes[dia] = previsoes[dia - 1] * retornos_diarios[dia]

  figura = px.line(title = 'Previsões do preço das ações - ' + ativo)
  for i in range(len(previsoes.T)):
    figura.add_scatter(y = previsoes.T[i], name = i)
  figura.show()

  return previsoes.T


























