# -*- coding:UTF-8-*-

import sys
from glob import glob
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np
plt.rcParams.update({'font.size': 35})


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

x = [ 20, 30, 40 ]
labels=[ "26","52", "104" ]

for controller in controllerSDN:
    for quantity in nodesQuantity:
        arquivo = "{}/{}{}{}/time_execucao_real_{}_{}.txt".format(path, controller, "_Nos_", quantity, controller, quantity)
	dados.append( pd.read_csv(glob(arquivo)[0], header=None ) )

for dado in dados:
    dados_processados.append( calc( dado ) )
print dados_processados


barWidth = 0.25
ryu_dados = [dados_processados[0][0], dados_processados[1][0], dados_processados[2][0]]
ryu_margem_erro = [dados_processados[0][1], dados_processados[1][1], dados_processados[2][1]]

floodlight_dados = [dados_processados[3][0], dados_processados[4][0], dados_processados[5][0]]
floodlight_margem_erro = [dados_processados[3][1], dados_processados[4][1], dados_processados[5][1]]

pox_dados = [dados_processados[6][0], dados_processados[7][0], dados_processados[8][0]]
pox_margem_erro = [dados_processados[6][1], dados_processados[7][1], dados_processados[8][1]]

r1 = np.arange(len(controllerSDN))+0.1
r2 = [x + barWidth for x in r1]
r3 = [x + barWidth for x in r2]

plt.ylim(0, max(dados_processados)[0]+100 )

bar1 = plt.bar(r1, ryu_dados, color=color[0], width=barWidth, label=controllerSDN[0], yerr=ryu_margem_erro, capsize=55, align='center', error_kw={"capthick": 2, 'ecolor': '#FFFF00'}, edgecolor='white', hatch='/')
#plt.plot(r1, ryu_dados, color=color[0])

bar2 = plt.bar(r2, floodlight_dados, color=color[1], width=barWidth, label=controllerSDN[1], yerr=floodlight_margem_erro, capsize=55, align='center', error_kw={"capthick": 2, 'ecolor': 'black'}, edgecolor='white', hatch='+')
#plt.plot(r2, floodlight_dados, color=color[1])

bar3 = plt.bar(r3, pox_dados, color=color[2], width=barWidth, label=controllerSDN[2], yerr=pox_margem_erro, capsize=55, align='center', error_kw={"capthick": 2, 'ecolor': 'blue'}, edgecolor='white', hatch='X')
#plt.plot(r3,pox_dados, color=color[2])

'''
plt.errorbar(1, dados_processados[0][0], yerr=dados_processados[0][1], linestyle='', capsize=35,elinewidth="4", marker='o',fmt='o', label=controllerSDN[0], color=color[0], markersize=20)
plt.errorbar(2, dados_processados[3][0], yerr=dados_processados[3][1], linestyle='',capsize=35,elinewidth="4",marker='^', fmt='^', label=controllerSDN[1], color=color[1], markersize=20)
plt.errorbar(3, dados_processados[6][0], yerr=dados_processados[6][1], linestyle='',capsize=35,elinewidth="4",marker='s', fmt='s',label=controllerSDN[2], color=color[2], markersize=20)

plt.errorbar(11, dados_processados[1][0], yerr=dados_processados[1][1], linestyle='',capsize=35,elinewidth="4",marker='o', fmt='o',color=color[0], markersize=20)
plt.errorbar(12, dados_processados[4][0], yerr=dados_processados[4][1], linestyle='',capsize=35,elinewidth="4",marker='^', fmt='^',color=color[1], markersize=20)
plt.errorbar(13, dados_processados[7][0], yerr=dados_processados[7][1], linestyle='',capsize=35,elinewidth="4",marker='s', fmt='s',color=color[2], markersize=20)

plt.errorbar(20, dados_processados[2][0], yerr=dados_processados[2][1], linestyle='',capsize=35,elinewidth="4",marker='o', fmt='o',color=color[0], markersize=20)
plt.errorbar(21, dados_processados[5][0], yerr=dados_processados[5][1], linestyle='',capsize=35,elinewidth="4",marker='^', fmt='^',color=color[1], markersize=20)
plt.errorbar(22, dados_processados[8][0], yerr=dados_processados[8][1], linestyle='',capsize=35,elinewidth="4",marker='s', fmt='s',color=color[2], markersize=20)
'''

#plt.xticks(x, labels)
plt.xticks([r+0.1  + barWidth for r in range(len(controllerSDN))], labels)
plt.xlabel('Número de nós IoT\n')
plt.ylabel(' Tempo (s)\n')

# Turn on the grid
plt.minorticks_on()
plt.grid(which='major', linestyle='-', linewidth='0.5', color='red')
# Customize the minor grid
plt.grid(which='minor', linestyle=':', linewidth='0.5', color='black')

for rect in bar1 + bar2 + bar3:
    height = rect.get_height()
    plt.text(rect.get_x() + rect.get_width()/2.0, height+1, '%.3f' % float(height), ha='center', va='bottom', fontsize=20)

plt.legend(loc='best')
plt.grid(True)
plt.title("Tempo de execução\n")
#plt.savefig("/home/randel/manhattan02.png")
plt.show()

