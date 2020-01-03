# Trabalho de Conclusão de Curso (TCC)

<div align="justify">
Trabalho de Conclusão de Curso apresentado ao Curso de Redes de Computadores da Universidade Federal do Ceará, como requisito parcial à obtenção do grau de Tecnólogo em Redes de Computadores. Área de concentração:Computação.
</div>

# Tema

<div align="justify">
Uma comparação entre controladores de Redes Definidas por Software em cenários de Internet das Coisas
</div>

# Instalação

Nesta Seção são vistos alguns comandos úteis que foram utilizados para visualizar as informações da VM. A Seção instalação informa o processo de instalação do emulador Mininet-WiFi. Por fim, a Seção intalação dos controladores explica o processo de instalação dos controladores SDN.

# Comandos

<details><summary></summary>
<p>

## yes, even hidden code blocks!

O programa \textit{fdisk} é usado para a criação e manipulação de tabelas de partição. A execução do comando com o argumento -l  “\textit{sudo fdisk -l}” lista as tabelas de partição descrevendo varias informações dentre elas a capacidade interna de armazenamento. Em continuação, ainda na Figura \ref{hd_vm_fdisk} é possível visualizar o particionamento do disco /dev/xvda em 3 outras partições, sendo denominadas de /dev/xvda1 que apresenta 37,9 \textit{Gigabytes}, /dev/xvda2 e /dev/xvda5 apresentando cada uma 2,1 \textit{Gigabytes}.

![text](https://github.com/RandelSouza/TCC/blob/master/img/hd_vm_fdisk.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{hd_vm_fdisk}Espaço de armazenamento interno da VM utilizando o comando fdisk}
	\begin{center}
	    \includegraphics[scale=0.33]{figuras/hd_vm_fdisk.pdf}  
	\end{center}
	\legend{ Fonte: Próprio autor (2019).}
\end{figure}
</div-->

</p>
</details>


Outro comando que foi utilizado para visualizar a capacidade de armazenamento interno da VM foi o “df -h”, que exibe a quantidade de espaço em disco disponível e a opção -h permite que os valores sejam legíveis para humanos, isto é, mostra os valores em potência de 1024. No entanto este comando não mostrou todas as partições e nem a capacidade total do disco (Figura \ref{hd_vm_df}).

![text](https://github.com/RandelSouza/TCC/blob/master/img/hd_vm.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{hd_vm_df}Espaço de armazenamento interno da VM utilizando o comando df}
	\begin{center}
	    \includegraphics[scale=0.5]{figuras/hd_vm.pdf}  
	\end{center}
	\legend{ Fonte: Próprio autor (2019).}
\end{figure}
</div-->

A Figura \ref{ping6} mostra o final da execução de um comando \textit{ping6} no experimento do controlador Ryu com 26 nós IoT.

![text](https://github.com/RandelSouza/TCC/blob/master/img/ping2.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{ping6}Comando \textit{ping6}}
	\begin{center}
	    \includegraphics[scale=0.36]{figuras/ping2.pdf}
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
</div-->

![text](https://github.com/RandelSouza/TCC/blob/master/img/free.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{free}Comando \textit{free}}
	\begin{center}
	    \includegraphics[scale=0.33]{figuras/free.pdf}
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
</div-->

A Figura \ref{time} mostra, como exemplo, o comando \textit{time} sendo executado para sumarizar o tempo decorrido de execução do comando \textit{ls} e também o percentual de CPU.


![text](https://github.com/RandelSouza/TCC/blob/master/img/time.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{time}Comando \textit{time}}
	\begin{center}
	    \includegraphics[scale=0.315]{figuras/time.pdf}
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
</div-->


\section{Instalação do Mininet-WiFi} \label{mininetwifi-insta}

Tendo a VM pré-configurada e em funcionamento, foi iniciado o passo de instalação do emulador Mininet-WiFi. O código fonte do Mininet-WiFi pode ser baixado pelo \textit{github} conforme a seguinte url “\textit{https://github.com/intrig-unicamp/mininet-wifi}”. Para clonar o Mininet-Wifi através da linha de comando é necessário ter o git instalado na VM, para isso utilizou-se o comando “\textit{sudo apt-get install git}”. Com o \textit{git} instalado foi realizado o comando para clonar o Mininet-WiFi para a VM. O comando para tal foi “\textit{git clone https://github.com/intrig-unicamp/mininet-wifi}”. Após isso, o passo subsequente foi entrar no diretório clonado com o comando “\textit{cd mininet-wifi}” e dentro do respectivo diretório existe um arquivo de instalação que fica em “\textit{util/install.sh}”. Este arquivo foi executado com o comando “\textit{sudo util/install.sh -Wlnfv6}”. Os argumentos passados configuram o \textit{script} de instalação para instalar as dependências \textit{wireless} com o -W, para instalar as dependencias do Mininet-WiFi com o -n, para instalar o \textit{OpenFlow} com o -f, para instalar o \textit{OpenvSwitch} com o -v, para instalar \textit{wmediumd} com -l e para instalar as ferramentas \textit{wpan} com o -6.

Depois do término da execução do arquivo de instalação do Mininet-WiFi, foi realizado um teste para verificar se o emulador estava realmente em pleno funcionamento. Entretanto, ao executar os exemplos de teste, houve um erro que persistia em todas as tentativas, o seguinte erro acontecia “\textit{command failed: Invalid argument }(-22)”. Para tentar reparar o erro, foi decidido fazer atualização na versão do sistema operacional da versão vigente até o momento que era a \textit{Ubuntu} 14.04 LTS para a versão \textit{Ubuntu} 16.04 LTS a atualização foi por motivo empírico
de já ter uma máquina real com a versão \textit{Ubuntu} 16.04 LTS com o emulador Mininet-WiFi em perfeito funcionamento. Então o processo de atualização foi realizado com os comandos presentes na Figura \ref{update_so}, e ao final da execução dos comandos da Figura \ref{update_so} a VM foi reinicializada com o comando “\textit{sudo reboot}”.

<!-- div>
\begin{figure}[H]
	\caption{\label{update_so}Atualizando o sistema operacional}
	\begin{center}
	    \includegraphics[scale=0.5]{figuras/update_so.pdf}  
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
</div-->

% parei a correção aqui.
Mesmo após a atualização do sistema operacional, o erro ainda acontecia, com isso, foi pesquisado o erro e encontrada a \textit{issue : command failed for 6LowPAN example} nela os desenvolvedores deram instruções para reexecutar o arquivo “\textit{util/install.sh}” utilizando somente o argumento -6, caso não tivesse passado este argumento por padrão, mas, também não funcionou. Então foi verificado pelos comentários que estavam conseguindo resolver o problema ao atualizar a versão do \textit{kernel}. Tendo isso em vista, foi feito o processo de atualização do \textit{kernel}. Os comandos utilizados estão presentes na Figura \ref{update_kernel}. A versão do \textit{kernel} depois da atualização ficou a 4.15.0-59-\textit{generic}, e realizando novamente os testes verificou-se um funcionamento normal dos exemplos sem o erro em questão.

![text](https://github.com/RandelSouza/TCC/blob/master/img/update_kernel.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{update_kernel}Atualizando o \textit{kernel} do sistema}
	\begin{center}
	    \includegraphics[scale=0.4]{figuras/update_kernel.pdf}  
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
</div-->

Possuindo então o ambiente de trabalho pré-configurado e tendo o emulador Mininet-WiFi instalado e sem erros, o passo seguinte foi a instalação dos controladores SDN, a descrição do processo de instalação dos controladores POX, Floodlight e Ryu é apresentada na Seção \ref{ctr-insta} e o teste de conectividade dos controladores citados pode ser consultado no APÊNDICE \ref{instalacaoapendicea}.

\section{Instalação dos controladores SDN} \label{ctr-insta}

Dando continuidade aos passos de execução, chegou-se ao ponto de instalação dos controladores SDN, em ordem foram instalados o Ryu, POX e Floodlight. A instalação do controlador Ryu não apresentou problema, necessitando de apenas 3 comandos. O primeiro comando foi utilizado para clonar o repositório do Ryu presente no \textit{github} com o comndo “\textit{git clone git://github.com/osrg/ryu.git}”, após isso, com o comando “\textit{cd ryu}” entrou-se na pasta clonada e por fim executou-se o arquivo de instalação com o seguinte comando “\textit{python ./setup.py install}”. Os comando estão exposto na Figura \ref{ryu_insta}.

![text](https://github.com/RandelSouza/TCC/blob/master/img/ryu_insta.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{ryu_insta}Comandos instalação do Ryu}
	\begin{center}
	    \includegraphics[scale=0.4]{figuras/ryu_insta.pdf}  
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
</div-->

O segundo controlador a ser instalado foi o POX. Diferentemente do primeiro controlador instalado não contêm arquivos de instalação, tendo somente que fazer um clone do repositório presente no \textit{github}. O comando empregado para clonar o POX foi “\textit{git clone https://github.com/noxrepo/pox.git}” (Figura \ref{pox_insta}).

![text](https://github.com/RandelSouza/TCC/blob/master/img/pox_insta.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{pox_insta}Comando instalação do POX}
	\begin{center}
	    \includegraphics[scale=0.4]{figuras/pox_insta.pdf}  
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
</div-->

Por fim, foi realizada a instalação do controlador Floodlight. De início, tentou-se instalar a versão \textit{master} do Floodlight com os comandos da Figura \ref{flood_insta}, porém ocorriam erros ao executar os comandos “\textit{git submodule init}”, “\textit{git submodule update}” e “\textit{ant}”. Ainda tentou-se pesquisar uma solução para resolver os erros de instalação, mas não houve sucesso nas pesquisas. Então partiu-se para a instalação da versão 1.2 do controlador Floodlight, para isso foi preciso somente modificar o primeiro comando apresentado na Figura \ref{flood_insta}, o comando ficou da seguinte forma “\textit{git clone -b v1.2 git://github.com/floodlight/floodlight.git}”. A versão 1.2 do controlador Floodlight foi instalada sem a ocorrência de erros. Em comparação aos dois controladores anteriormente instalados, o Floodlight apresentou um número maior de comandos para sua instalação.

![text](https://github.com/RandelSouza/TCC/blob/master/img/flood_insta.jpg)

<!-- div>
\begin{figure}[H]
	\caption{\label{flood_insta}Instalação Floodlight \textit{master}}
	\begin{center}
	    \includegraphics[scale=0.4]{figuras/flood_insta.pdf}  
	\end{center}
	\legend{Fonte: Próprio autor (2019).}
\end{figure}
<div--->

Finalizado o processo de instalação dos controladores Ryu, POX e Floodlight, o passo posterior foi a criação dos \textit{scripts} de automatização dos experimentos, a Seção \ref{scripts-experimentos} discute, o modelo empregado para a automatização dos experimentos, discorrendo também de informações importantes sobre os fatores e níveis empregados para o presente trabalho.
% fazer link mais detalhado com a ãSeo seguinte
