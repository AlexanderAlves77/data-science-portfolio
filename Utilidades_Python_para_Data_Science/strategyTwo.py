# Módulo de conversão de tipos de dados
# Imports
import numpy as np
import pandas as pd


def convert_to_string(df, columns):
    for col in columns:
        df[col] = df[col].astype("string")


def convert_to_int(df, columns):
    for col in columns:
        df[col] = df[col].astype("int64")


def convert_to_float(df, columns):
    for col in columns:
        df[col] = df[col].astype("float64")


def convert_to_datetime(df, columns):
    for col in columns:
        df[col] = pd.to_datetime(df[col])


def multiply_by_factor(df, columns, factor):
    for col in columns:
        df[col] = df[col] * factor


# Categorias únicas por coluna
def unique_categories_per_column(df, columns):
    for cols in dados.columns:
        print(cols,':', len(df[cols].unique()), 'categorias')
        
        
# Fazemos o replace de cada categoria pela contagem/frequencia na coluna
def change_category_by_count(df, column):      
    frequency = df[column].value_counts().to_dict() 
    df[column] = df[column].map(frequency)
    return df
    
    
# Criamos uma função para criar as novas variáveis com One-Hot-Encoding nas Top10
def one_hot_top10(df, column, top_10):
    df[column].value_counts(ascending = False).head(10)
    top_10 = [x for x in df[column].value_counts().head(10).index]    
    for i in top_10:
        df[column + "_" + i ] = np.where(df[column]==i,1,0)
        
        
# Normalização de colunas
def normalize_of_columns(df):
    df_normalize = df.copy()
    for i in df:
      df_normalize[i] = df[i] / dataset[i][0]
    return df_normalize
    
    
# Funções com número variável de argumentos
def printVarInfo(arg1, *vartuple):
    print(f"O parâmetro passado foi: {arg1}")
    for item in vartuple:
        print(f"O parâmetro passado foi: {item}")
    return