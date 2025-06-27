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
