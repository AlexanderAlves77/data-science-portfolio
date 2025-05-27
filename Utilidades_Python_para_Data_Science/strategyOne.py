# Módulo de limpeza e tratamento de valores ausentes
# Imports
import numpy as np
import pandas as pd


# Calcula o percentual de valores ausentes
def func_calc_percentage_missing_values(df):
    totalCells = np.prod(df.shape)
    missingCount = df.isnull().sum()
    totalMissing = missingCount.sum()
    print(f"O dataset tem {round(((totalMissing/totalCells)*100), 2)} % de valores ausentes.")


# Função que calcula o percentual de linhas com valores ausentes
def func_calc_percentage_missing_line_values(df):
    missing_rows = sum([True for idx, row in df.iterrows() if any(row.isna())])
    total_rows = df.shape[0]
    print(f"{round(((missing_rows/total_rows)*100),2)} % das linhas no conjunto de dados contêm pelo menos um valor ausente.")


# Função para calcular valores ausentes por coluna
def func_calc_percentage_missing_values_column(df):
    miss_val = df.isnull().sum()
    miss_val_percent = 100 * miss_val / len(df)
    miss_val_type = df.types 
    miss_val_table = pd.concat([miss_val, miss_val_percent, miss_val_type], axis=1)
    miss_table_rename = miss_val_table.rename(
        columns = {0: 'Valores Ausentes', 1: '% de Valores Ausentes', 2: 'Dtype'})
    miss_table_rename = miss_table_rename[miss_table_rename.iloc[:,0]!= 0].sort_values('% de Valores Ausentes', ascending=False).round(2)
    print(f"O dataset tem {str(df.shape[1])} colunas.\n"
          f"Encontrado: {str(miss_table_rename.shape[0])} colunas que têm valores ausentes.")
    if miss_table_rename.shape[0] == 0:
        return 
    return miss_table_rename


# Imputação de valores ausentes usando forward fill (preenchimento progressivo)
# method = 'ffill': Ffill ou forward-fill propaga o último valor não nulo observado
# para frente até que outro valor não nulo seja encontrado
def fix_missing_ffill(df, col):
    count = df[col].isna().sum()
    df[col] = df[col].ffill()
    print(f"{count} valores ausentes na coluna {col} foram substituídos usando o método de preenchimento progressivo.")
    return df[col]


# Imputação de valores ausentes usando backward fill
# method = 'bfill': Bfill ou backward-fill propaga o primeiro valor não nulo 
# observado para trás até que outro valor não nulo seja encontrado
def fix_missing_bfill(df, col):
    count = df[col].isna().sum()
    df[col] = df[col].bfill()
    print(f"{count} valores ausentes na coluna {col} foram substituídos usando o método de preenchimento reverso.")
    return df[col]


# Imputação usando a mediana
def fix_missing_median(df, col):
    median = df[col].median()
    count = df[col].isna().sum()
    df[col] = df[col].fillna(median)
    print(f"{count} valores ausentes na coluna {col} foram substituídos por seu valor de mediana {median}.")
    return df[col]


# Preenche valor NA
def fix_missing_value(df, col, value): 
    count = df[col].isna().sum()
    df[col] = df[col].fillna(value)
    if type(value) == 'str':
        print(f"{count} valores ausentes na coluna {col} foram substituídos por '{value}'.")
    else:
        print(f"{count} valores ausentes na coluna {col} foram substituídos por '{value}'.")
    return df[col]


# Drop duplicatas
def drop_duplicates(df):
    old = df.shape[0]
    df.drop_duplicates(inplace = True)
    new = df.shape[0]
    count = old - new 
    if (count == 0):
        print("Nenhuma linha duplicada foi encontrada.")
    else:
        print(f"{count} linhas duplicadas foram encontradas e removidas.")


# Drop de linhas com valores ausentes
def drop_rows_with_missing_values(df):
    old = df.shape[0]
    df.dropna(inplace = True)
    new = df.shape[0]
    count = old - new 
    print(f"{count} linhas contendo valores ausentes foram descartadas.")


# Drop de colunas
def drop_columns(df, columns):
    df.drop(columns, axis=1, inplace=True)
    count = len(columns)
    if count == 1:
        print(f"{count} coluna foi descartada.")
    else:
        print(f"{count} colunas foram descartadas.")
        
        
# Calcula Variância, Desvio Padão e Coeficiente da Variância
def get_variancia_desvio_padrao_coeficiente(dataset):
    media = dataset.sum() / len(dataset)
    desvio = abs(dataset - media) ** 2
    soma_desvio = desvio.sum()
    variancia = soma_desvio / len(dataset)
    dp = math.sqrt(variancia)
    cv = (dp / media) * 100
    return variancia, dp, cv