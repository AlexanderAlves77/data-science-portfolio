# Módulo de tratamento de outliers
# Imports
import numpy as np
import pandas as pd


# Classe
class TreatsOutlier:
    # Construtor
    def __init__(self, df: pd.DataFrame) -> None:
        self.df = df 

    def count_outliers(self, Q1, Q3, IQR, columns):
        cut_off = IQR * 1.5
        temp_df = (self.df[columns] < (Q1 - cut_off)) | (self.df[columns] > (Q3 + cut_off))
        return [len(temp_df[temp_df[col] == True]) for col in temp_df]
    
    def calc_skew(self, columns=None):
        if columns == None:
            columns = self.df.columns 
        return [self.df[col].skew() for col in columns]
    
    def percentage(self, list):
        return [str(round(((value/150001) * 100), 2)) + '%' for value in list]
    
    def remove_outliers(self, columns):
        for col in columns:
            Q1 = self.df[col].quantile(0.25)
            Q3 = self.df[col].quantile(0.75)
            IQR = Q3 - Q1 
            cut_off = IQR * 1.5
            lower = Q1 - cut_off
            upper = Q3 + cut_off
            self.df = self.df.drop(self.df[self.df[col] > upper].index)
            self.df = self.df.drop(self.df[self.df[col] < lower].index)

    def replace_outliers_with_fences(self, columns):
        for col in columns:
            Q1 = self.df[col].quantile(0.25)
            Q3 = self.df[col].quantile(0.75)
            IQR = Q3 - Q1 
            cut_off = IQR * 1.5
            lower = Q1 - cut_off
            upper = Q3 + cut_off
            self.df[col] = np.where(self.df[col] > upper, upper, self.df[col])
            self.df[col] = np.where(self.df[col] < lower, lower, self.df[col])

    def get_over_view(self, columns) -> None:
        min = self.df[columns].min()
        Q1 = self.df[columns].quantile(0.25)
        median = self.df[columns].quantile(0.5)
        Q3 = self.df[columns].quantile(0.75)
        max = self.df[columns].max()
        IQR = Q3 - Q1
        skew = self.calc_skew(columns)
        outliers = self.count_outliers(Q1, Q3, IQR, columns)
        cut_off = IQR * 1.5
        lower = Q1 - cut_off
        upper = Q3 + cut_off

        new_columns = ['Column Name', 'Min', 'Q1', 'Median', 'Q3', 'Max', 'IQR', 'Lower fence', 'Upper fence', 'Skew', 'Num_Outliers', 'Percent_Outliers' ]
        data = zip([column for column in self.df[columns]], min, Q1, median, Q3, max, IQR, lower, upper, skew, outliers, self.percentage(outliers))
        new_df = pd.DataFrame(data = data, columns = new_columns)
        new_df.set_index('Column Name', inplace = True)
        return new_df.sort_values('Num_Outliers', ascending = False).transpose()