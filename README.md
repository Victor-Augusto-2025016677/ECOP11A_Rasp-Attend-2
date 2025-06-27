# ECOP11A_Rasp-Attend-2

> **Sistema de presença v2 utilizando Raspberry Pi 3 B+**  
> _Repositório apenas para fins de arquivo. Replique por sua conta e risco._

---

## 📸 Demonstração do Funcionamento

### 1. Acesso Inicial

O usuário acessa o hostname hospedado localmente pelo Raspberry (`chamada.local`) na porta **80** e preenche o nome e matrícula:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/coleta-1.png" width="500">
</p>

---

### 2. Validação dos Dados

Se os dados estiverem incorretos, uma mensagem de erro é exibida:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/coleta_erro-2.png" width="500">
</p>

---

### 3. Dados Corretos

Ao preencher corretamente, os dados são enviados junto ao IP do usuário:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/coleta_sucesso-3.png" width="500">
</p>

---

### 4. Processamento Interno

A lógica interna do sistema é executada (detalhes mais abaixo).

---

### 5. Exibição dos Dados

Os dados são exibidos em uma página na porta **81** do mesmo host (`chamada.local:81`):

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-1.png" width="500">
</p>

---

### 6. Erro ao Exibir Dados

Se não houver dados ou ocorrer um erro interno, uma mensagem de erro aparece:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao_erro-2.png" width="500">
</p>

> _Pode ocorrer se nenhum usuário se registrou ou por erro interno._

---

### 7. Menu de Configurações

No site, há um menu para definir:
- Número de aulas
- Duração de cada aula
- % mínima de tempo conectado (em minutos)
- Toggle para mostrar dados de conexão (IP e MAC)

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao_config-3.png" width="500">
</p>

---

### 8. Status: "Em aula / Avaliar"

Usuário conectado, mas ainda sem tempo mínimo de presença:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-1.png" width="500">
</p>

---

### 9. Status: Presente

Usuário atingiu o tempo mínimo de presença:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-4.png" width="500">
</p>

---

### 10. Status: Ausente

Usuário desconectado antes de atingir o tempo mínimo:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-5.png" width="500">
</p>

---

### 11. Detalhes do Aluno

Expandindo o menu de cada aluno, são exibidos dados de conexão e timestamps (inicialmente, apenas a data de conexão):

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-6.png" width="500">
</p>

---

### 12. Histórico de Conexões

Após algumas sessões, o menu mostra cada desconexão/reconexão detectada:

<p align="center">
  <img src="https://github.com/Victor-Augusto-2025016677/ECOP11A_Rasp-Attend-2/blob/main/img/exibicao-7.png" width="500">
</p>

---

## 🛠️ Resumo do Funcionamento Interno

O sistema ECOP11A_Rasp-Attend-2 utiliza um Raspberry Pi para automatizar a coleta e exibição de presença em ambiente local. O fluxo principal é:

1. **Coleta de Dados:**  
   Usuários acessam a página na porta 80 (`chamada.local`), preenchem nome e matrícula. O backend Node.js (`server.js`) valida e registra os dados junto ao IP em um arquivo CSV.

2. **Processamento Periódico:**  
   Scripts Python (`parser_nmap.py` e `timestamps.py`) são executados em loop via systemd e shell script.  
   - `parser_nmap.py` faz varredura na rede, identifica dispositivos conectados (por MAC/IP) e atualiza o inventário.
   - `timestamps.py` cruza os dados de presença (CSV) com o inventário de rede, gerando um arquivo JSON com sessões de conexão/desconexão por usuário.

3. **Exibição dos Dados:**  
   Um servidor Flask (porta 81) lê o JSON gerado e exibe, via página web, o status de presença dos usuários, tempo conectado, histórico de sessões e permite configuração de critérios de presença.

4. **Automação:**  
   Serviços systemd garantem que todos os scripts e servidores iniciem automaticamente e mantenham o sistema funcionando sem intervenção manual.

O sistema é totalmente local, não depende de internet, e utiliza apenas dados da rede interna para validar a presença dos usuários.

---