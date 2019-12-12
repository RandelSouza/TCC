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

path = "resultados_experimento"
controllerSDN = [ "Ryu", "Floodlight", "POX" ]
nodesQuantity = [ 26, 52, 104 ]
dados = []
dados_processados = []
color = ["green", "#ff8c00", "m"]
size = 20
repeat_number = 100

#x = [ 20, 30, 40 ]
labels=[ "26","52", "104" ]

for controller in controllerSDN:
    for quantity in nodesQuantity:
        arquivo = "{}/{}{}{}/latencia_max_{}_Nos_{}.txt".format(path, controller, "_Nos_", quantity, controller, quantity)
	dados.append( pd.read_csv(glob(arquivo)[0], header=None ) )

for dado in dados:
    dados_processados.append( calc( dado ) )
print dados_processados


plt.subplot(221)
plt.xlim(0, (nodesQuantity[2] * repeat_number))
#plt.ylim(22, 41)
plt.plot( [x+1 for x in range(len(dados[2]))], dados[2], label=controllerSDN[0], color=color[0],  marker= "", markersize=2, linestyle='-',  lw=1) 
plt.plot([1, len(dados[2])], [calc(dados[2])[0], calc(dados[2])[0] ], color='#FFFF00', linewidth=3, linestyle='-', label='Média')
plt.legend(loc='best', numpoints=1 , fancybox=True, framealpha=0.5)
plt.title('Latência máxima \n com 104 nós IoT (a)')
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')

plt.subplot(222)
plt.xlim(0, (nodesQuantity[2] * repeat_number))
#plt.ylim(22, 41)
plt.plot( [x+1 for x in range(len(dados[5]))], dados[5], label=controllerSDN[1], color= color[1],  marker= "", markersize=2, linestyle='-', lw=1) 
plt.plot([1, len(dados[5])], [calc(dados[5])[0], calc(dados[5])[0] ], color='black', linewidth=3, linestyle='-', label='Média')
plt.legend(loc='best', numpoints=1, fancybox=True, framealpha=0.5)
plt.title('Latência máxima \n com 104 nós IoT (b)')
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')

plt.subplot(223)
plt.xlim(0, (nodesQuantity[2] * repeat_number))
#plt.ylim(22, 41)
plt.plot( [x+1 for x in range(len(dados[8]))], dados[8], label=controllerSDN[2], color= color[2],  marker= "", markersize=2, linestyle='-', lw=1) 
plt.plot([1, len(dados[8])], [calc(dados[8])[0], calc(dados[8])[0] ], color='blue', linewidth=3, linestyle='-', label='Média')
plt.legend(loc='best', numpoints=1, fancybox=True, framealpha=0.5)
plt.title('Latência máxima \n com 104 nós IoT (c)')
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')

plt.subplot(224)
plt.xlim(0, (nodesQuantity[2] * repeat_number))
#plt.ylim(0, 2)
plt.plot( [x+1 for x in range(len(dados[2]))], dados[2], label=controllerSDN[0], color= color[0],  marker= "", markersize=2, linestyle='-',  lw=1) 
plt.plot( [x+1 for x in range(len(dados[5]))], dados[5], label=controllerSDN[1], color= color[1],  marker= "", markersize=2, linestyle='-', lw=1) 
plt.plot( [x+1 for x in range(len(dados[8]))], dados[8], label=controllerSDN[2], color= color[2],  marker= "", markersize=2, linestyle='-', lw=1) 

plt.plot([1, len(dados[2])], [calc(dados[2])[0], calc(dados[2])[0] ], color='#FFFF00', linewidth=3, linestyle='-', label='Média '+controllerSDN[0])
plt.plot([1, len(dados[5])], [calc(dados[5])[0], calc(dados[5])[0] ], color='black', linewidth=3, linestyle='-', label='Média '+controllerSDN[1])
plt.plot([1, len(dados[8])], [calc(dados[8])[0], calc(dados[8])[0] ], color='blue', linewidth=3, linestyle='-', label='Média '+controllerSDN[2])
plt.legend(loc='upper center', numpoints=1, fancybox=True, framealpha=0.5, bbox_to_anchor=(0.5, 1.), ncol=2)

plt.title('Latência máxima \n com 104 nós IoT (d)')
plt.ylabel('Latência (ms)')
plt.xlabel('Número de coletas')
plt.subplots_adjust(top=0.92, bottom=0.08, left=0.10, right=0.95, hspace=0.50, wspace=0.35)
#plt.savefig("/home/randel/manhattan02.png"
plt.show()

