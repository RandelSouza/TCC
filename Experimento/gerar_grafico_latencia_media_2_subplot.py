# -*- coding:UTF-8-*-

import sys
from glob import glob
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np
plt.rcParams.update({'font.size': 25})
plt.rc('legend', fontsize=20)

'''
# Configurações dos Gráficos que podem ser alteradas
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

repeat_number = 100
path = "resultados_experimento"
controllerSDN = [ "Ryu", "Floodlight", "POX" ]
nodesQuantity = [ 26, 52, 104 ]
dados = []
dados_processados = []
color = ["green", "#ff8c00", "m"]
size = 20

#x = [ 20, 30, 40 ]
labels=[ str(nodesQuantity[0]), str(nodesQuantity[1]), str(nodesQuantity[2]) ]

for controller in controllerSDN:
    for quantity in nodesQuantity:
        arquivo = "{}/{}{}{}/latencia_avg_{}_Nos_{}.txt".format(path, controller, "_Nos_", quantity, controller, quantity)
	dados.append( pd.read_csv(glob(arquivo)[0], header=None ) )

for dado in dados:
    dados_processados.append( calc( dado ) )
print dados_processados


plt.subplot(221)
plt.xlim(0, (nodesQuantity[0] * repeat_number)  )
plt.plot( [x+1 for x in range(len(dados[0]))], dados[0], label=controllerSDN[0], color=color[0],  marker="", markersize=2, linestyle='-',  lw=1)
plt.plot([1, len(dados[0])], [calc(dados[0])[0], calc(dados[0])[0] ], color='#FFFF00', linewidth=3, linestyle='-', label='Média')
plt.legend(loc='best', numpoints=1 , fancybox=True, framealpha=0.5)
plt.title('Latência média \n com {} nós IoT (a)'.format(nodesQuantity[0]))
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')
plt.grid(True)

plt.subplot(222)
plt.xlim(0, (nodesQuantity[0] * repeat_number))
plt.plot( [x+1 for x in range(len(dados[3]))], dados[3], label=controllerSDN[1], color= color[1],  marker="", markersize=2, linestyle='-', lw=1)
plt.plot([1, len(dados[3])], [calc(dados[3])[0], calc(dados[3])[0] ], color='black', linewidth=3, linestyle='-', label='Média')
plt.legend(loc='best', numpoints=1, fancybox=True, framealpha=0.5)
plt.title('Latência média \n com {} nós IoT (b)'.format(nodesQuantity[0]))
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')
plt.grid(True)

plt.subplot(223)
plt.xlim(0, (nodesQuantity[0] * repeat_number))
plt.plot( [x+1 for x in range(len(dados[6]))], dados[6], label=controllerSDN[2], color= color[2],  marker="", markersize=2, linestyle='-', lw=1)
plt.plot([1, len(dados[6])], [calc(dados[6])[0], calc(dados[6])[0] ], color='blue', linewidth=3, linestyle='-', label='Média')
plt.legend(loc='best', numpoints=1, fancybox=True, framealpha=0.5)
plt.title('Latência média \n com {} nós IoT (c)'.format(nodesQuantity[0]))
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')
plt.grid(True)

plt.subplot(224)
plt.xlim(0, (nodesQuantity[0] * repeat_number))
plt.plot( [x+1 for x in range(len(dados[0]))], dados[0], label=controllerSDN[0], color= color[0],  marker="", markersize=2, linestyle='-',  lw=1)
plt.plot( [x+1 for x in range(len(dados[3]))], dados[3], label=controllerSDN[1], color= color[1],  marker="", markersize=2, linestyle='-', lw=1)
plt.plot( [x+1 for x in range(len(dados[6]))], dados[6], label=controllerSDN[2], color= color[2],  marker="", markersize=2, linestyle='-', lw=1)

plt.plot([1, len(dados[0])], [calc(dados[0])[0], calc(dados[0])[0] ], color='#FFFF00', linewidth=3, linestyle='-', label='Média '+controllerSDN[0])
plt.plot([1, len(dados[3])], [calc(dados[3])[0], calc(dados[3])[0] ], color='black', linewidth=3, linestyle='-', label='Média '+controllerSDN[1])
plt.plot([1, len(dados[6])], [calc(dados[6])[0], calc(dados[6])[0] ], color='blue', linewidth=3, linestyle='-', label='Média '+controllerSDN[2])
plt.legend(loc='upper center', numpoints=1, fancybox=True, framealpha=0.5, bbox_to_anchor=(0.5, 1.), ncol=2)
plt.grid(True)

plt.title('Latência média \n com {} nós IoT (d)'.format(nodesQuantity[0]))
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')
plt.subplots_adjust(top=0.92, bottom=0.08, left=0.10, right=0.95, hspace=0.50, wspace=0.35)
#plt.savefig("/home/randel/manhattan02.png"
plt.show()

