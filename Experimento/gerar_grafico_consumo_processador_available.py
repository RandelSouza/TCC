# -*- coding:UTF-8-*-

import sys
from glob import glob
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np
plt.rcParams.update({'font.size': 35})


'''
# Configurações dos Gráficos que podem alteradas
SMALL_SIZE = 40
MEDIUM_SIZE = 40
BIGGER_SIZE = 40

plt.rc('font', size=SMALL_SIZE)          # controls default text sizes
plt.rc('axes', titlesize=SMALL_SIZE)     # fontsize of the axes title
plt.rc('axes', labelsize=MEDIUM_SIZE)    # fontsize of the x and y labels
plt.rc('xtick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
plt.rc('ytick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
plt.rc('legend', fontsize=SMALL_SIZE)    # legend fontsize
plt.rc('figure', titlesize=BIGGER_SIZE)  # fontsize of the figure title
'''


def calc(df):
    mean = df[0].mean()
    std = df[0].std()
    margemdeerro = 1.96 * (std / np.sqrt(len(df[0])))
    return mean, margemdeerro

reload(sys)
sys.setdefaultencoding('utf-8')

path = "resultados_experimento"
controllerSDN = [ "Ryu", "Floodlight", "POX" ]
nodesQuantity = [ 26, 52, 104 ]
dados = []
dados_processados = []
color = ["green", "#ff8c00", "m"]
size = 20

x = [ 2, 12, 21 ]
labels=[ "26","52", "104" ]

for controller in controllerSDN:
    for quantity in nodesQuantity:
        arquivo = "{}/{}{}{}/processor_consumption_available_{}{}.txt".format(path, controller, "_Nos_", quantity, controller, quantity)
	dados.append( pd.read_csv(glob(arquivo)[0], header=None ) )

for dado in dados:
    dados_processados.append( calc( dado ) )
print dados_processados

plt.errorbar(1, dados_processados[0][0], yerr=dados_processados[0][1], linestyle='', capsize=35,elinewidth="4", marker='o',fmt='o', label=controllerSDN[0], color=color[0], markersize=20, capthick=2)
plt.errorbar(2, dados_processados[3][0], yerr=dados_processados[3][1], linestyle='',capsize=35,elinewidth="4",marker='^', fmt='^', label=controllerSDN[1], color=color[1], markersize=20, capthick=2)
plt.errorbar(3, dados_processados[6][0], yerr=dados_processados[6][1], linestyle='',capsize=35,elinewidth="4",marker='s', fmt='s',label=controllerSDN[2], color=color[2], markersize=20, capthick=2)

plt.errorbar(11, dados_processados[1][0], yerr=dados_processados[1][1], linestyle='',capsize=35,elinewidth="4",marker='o', fmt='o',color=color[0], markersize=20, capthick=2)
plt.errorbar(12, dados_processados[4][0], yerr=dados_processados[4][1], linestyle='',capsize=35,elinewidth="4",marker='^', fmt='^',color=color[1], markersize=20, capthick=2)
plt.errorbar(13, dados_processados[7][0], yerr=dados_processados[7][1], linestyle='',capsize=35,elinewidth="4",marker='s', fmt='s',color=color[2], markersize=20, capthick=2)

plt.errorbar(20, dados_processados[2][0], yerr=dados_processados[2][1], linestyle='',capsize=35,elinewidth="4",marker='o', fmt='o',color=color[0], markersize=20, capthick=2)
plt.errorbar(21, dados_processados[5][0], yerr=dados_processados[5][1], linestyle='',capsize=35,elinewidth="4",marker='^', fmt='^',color=color[1], markersize=20, capthick=2)
plt.errorbar(22, dados_processados[8][0], yerr=dados_processados[8][1], linestyle='',capsize=35,elinewidth="4",marker='s', fmt='s',color=color[2], markersize=20, capthick=2)

# linhas
plt.plot([1, 11, 20], [dados_processados[0][0], dados_processados[1][0], dados_processados[2][0]], color=color[0], linewidth=1, linestyle='dashed')
plt.plot([2, 12, 21], [dados_processados[3][0], dados_processados[4][0], dados_processados[5][0]], color=color[1], linewidth=1, linestyle='dashed')
plt.plot([3, 13, 22], [dados_processados[6][0], dados_processados[7][0], dados_processados[8][0]], color=color[2], linewidth=1, linestyle='dashed')


plt.xticks(x, labels)
plt.xlabel('Número de nós IoT\n')
plt.ylabel(' Megabyte (MB)\n')
plt.legend(loc='best', numpoints=1)
plt.grid(True)
plt.title("Memória disponível\n")
#plt.savefig("/home/randel/manhattan02.png")
plt.show()
