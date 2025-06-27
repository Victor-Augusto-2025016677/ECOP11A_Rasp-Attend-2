# ECOP11A_Rasp-Attend-2

Este repositório inclui os arquivos do sistema de presença v2 utilizando um raspberry pi 3 B+, somente para fins de arquivo. Replique por sua conta e risco.

## Funcionamento demonstrado via imagens:

1. O úsuario, entrará no hostname hospedado localmente pelo raspberry (chamada.local), e um site será exibido na porta 80, Coleta do Nome e Matricula, digitado pelo úsuario. 

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/coleta-1.png">

2. Após a digitação pelo úsuario, caso ele tente enviar os dados, e estiverem errados (fora do padrão esperado), ele mostrará uma mensagem de erro:

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/coleta_erro-2.png">

3. Caso os dados correspondam ao padrão esperado, os dados são enviados, junto ao IP da pessoa que envia a requisição:

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/coleta_sucesso-3.png">

4. Nesta etapa, ocorre toda a lógica interna do código, que será explicada mais á frente.

5. Após a coleta, e execução da lógica interna (Backend), os dados serão exibidos em uma página hospedada na porta 81, do mesmo host: (chamada.local:81)

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-1.png">

6. Dentro desta página, caso ele não encontre os dados, será exibido uma mensagem de erro:

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao_erro-2.png">

Esta mensagem, pode ocorrer caso nenhum usuario tenha se registrado ainda, ou caso realmente ocorra um erro interno.

7. Dentro do site, há um menu de configurações, onde podemos definir o n° de aulas, a duração de cada aula, e a % minima de tempo conectado em minutos em relação á carga horaria (n° de aulas * n° de minutos). E além disso, ele apresenta uma toggle box para mostrar os dados de conexão, como IP e MAC. 

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao_config-3.png">

8. Caso o úsuario ainda não tenha o tempo de presença minimo conectado, mas esteja conectado, ele será exibido com o status de: "Em aula/ Avaliar":

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-1.png">

9. Caso o usuario bata a quantidade de minutos presentes pré configuradas, ele será exibido com um status de presente, como mostra a imagem:

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-4.png">

10. Caso o úsuario, não tenha tido o tempo minimo de presença, e esteja desconectado, será exibido com um status de Ausente:

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-5.png">

11. Caso o menu de cada aluno seja expandido, irá ser exibido os dados de conexão dele, e as timestamps, nesse caso inicial, somente há a data de conexão inicial:

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-6.png">

12. Após algumas sessões, o menu expandido irá mostrar cada desconexão/reconexão detectados, como mostra a imagem: 

<img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-7.png">