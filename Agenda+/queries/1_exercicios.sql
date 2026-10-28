/*
============================================================
AgendaSQL - 150 EXERCÍCIOS (enunciados)
============================================================
Pré-requisitos (por esta ordem):
  1. 01_create_tables.sql
  2. insert_dados.sql
  3. 02_insert_dados_extra.sql

Como usar:
  - Escreve a tua resolução por baixo de cada enunciado.
  - Os exercícios de DML (INSERT/UPDATE/DELETE) devem ser
    feitos dentro de BEGIN TRAN ... ROLLBACK, para não
    estragares os dados de exemplo.
  - Os exercícios de procedures, functions, views e triggers
    criam objetos: nomeia-os como pedido.
  - Antes de criares cada objeto, testa a lógica com SELECT.

Modelo de referência:
  Pessoa(IDPessoa, Nome, Telemovel, Email)
  Participante(IDParticipante, Empresa, IDPessoa)
  Palestrante(IDPalestrante, Especializacao, IDPessoa)
  Sala(IDSala, NomeSala, Capacidade)
  Evento(IDEvento, Titulo, Descricao, DataInicio, DataFim,
         CapacidadeMax, IDSala)
  Evento_Palestra(IDEvento, IDPalestrante)
  Inscricao(IDInscricao, IDParticipante, IDEvento,
            DataInscricao, STATUS)
============================================================
*/
USE AgendaSQL;
GO

/*
############################################################
ETAPA 1 - FÁCIL (001 a 050)
SELECT, WHERE, ORDER BY, TOP, DISTINCT, LIKE, BETWEEN, IN,
funções de agregação, funções de texto e de data
############################################################
*/

-- 001. Lista todas as colunas e todas as linhas da tabela Pessoa.

-- 002. Lista apenas o Nome e o Email de todas as pessoas.

-- 003. Lista as salas ordenadas por Capacidade, da maior para a menor.

-- 004. Lista os títulos de todos os eventos por ordem alfabética.

-- 005. Lista os eventos que decorrem na sala com IDSala = 1.

-- 006. Lista as salas com capacidade superior a 30.

-- 007. Lista as pessoas cujo nome começa pela letra 'A'.

-- 008. Lista as pessoas cujo nome contém 'Santos'.

-- 009. Lista os eventos com CapacidadeMax entre 30 e 80 (usa BETWEEN).

-- 010. Lista as empresas dos participantes, sem repetições.

-- 011. Lista os 5 eventos com maior CapacidadeMax.

-- 012. Conta quantas pessoas existem.

-- 013. Conta quantos eventos existem.

-- 014. Calcula a capacidade total de todas as salas.

-- 015. Calcula a capacidade média das salas.

-- 016. Mostra a menor e a maior CapacidadeMax entre todos os eventos.

-- 017. Lista as inscrições com STATUS 'Confirmada'.

-- 018. Conta quantas inscrições estão canceladas.

-- 019. Lista os eventos que não têm Descricao preenchida (NULL).

-- 020. Lista os palestrantes que não têm Especializacao preenchida.

-- 021. Lista os eventos que começam em novembro de 2026.

-- 022. Lista os eventos que começam em 2027.

-- 023. Lista as inscrições feitas depois de 2026-09-01.

-- 024. Lista os participantes cuja empresa é 'Freelancer'.

-- 025. Lista os participantes das empresas 'TechNova Lda', 'InovaSoft' ou 'StartUp Vertex' (usa IN).

-- 026. Mostra o título de cada evento e a sua duração em horas.

-- 027. Lista os eventos cujo título contém a palavra 'Cibersegurança'.

-- 028. Lista as 10 primeiras pessoas por ordem alfabética do nome.

-- 029. Mostra as salas com os cabeçalhos renomeados: NomeSala como "Sala" e Capacidade como "Lugares" (usa alias).

-- 030. Mostra uma única coluna com o texto "Nome <email>" para cada pessoa (concatenação).

-- 031. Lista os eventos que não têm descrição OU têm CapacidadeMax menor ou igual a 20.

-- 032. Lista as inscrições cujo STATUS é diferente de 'Cancelada'.

-- 033. Conta quantos participantes existem.

-- 034. Conta quantos palestrantes existem.

-- 035. Lista as 3 salas com menor capacidade.

-- 036. Conta quantos eventos começam em dezembro (qualquer ano).

-- 037. Mostra o título de cada evento e o ano em que começa.

-- 038. Mostra o nome de cada pessoa e o número de caracteres desse nome, do mais longo para o mais curto.

-- 039. Mostra os nomes de todas as pessoas em maiúsculas.

-- 040. Lista as pessoas cujo telemóvel termina no dígito 5.

-- 041. Lista os eventos que terminam depois das 17:00.

-- 042. Lista os eventos com duração superior a 4 horas.

-- 043. Mostra a data de inscrição mais antiga e a mais recente.

-- 044. Lista as salas cujo nome contém 'Workshop'.

-- 045. Lista os eventos do mais recente para o mais antigo (DataInicio).

-- 046. Conta quantos participantes pertencem à empresa 'Freelancer'.

-- 047. Lista as inscrições 'Aguardando' ordenadas pela data de inscrição.

-- 048. Mostra o título de cada evento e o dia da semana em que começa (por extenso).

-- 049. Lista as pessoas cujo IDPessoa é par.

-- 050. Calcula a soma da CapacidadeMax de todos os eventos que começam em 2026.


/*
############################################################
ETAPA 2 - MÉDIO (051 a 100)
JOINs, GROUP BY, HAVING, LEFT JOIN, subqueries, CASE, UNION,
EXISTS, funções de data e de texto, DML e constraints
############################################################
*/

-- 051. Mostra o nome e a empresa de cada participante (junta Participante e Pessoa).

-- 052. Mostra o nome e a especialização de cada palestrante.

-- 053. Mostra o título de cada evento e o nome da sala onde decorre.

-- 054. Verifica se existe algum evento cuja CapacidadeMax seja superior à capacidade da sala.

-- 055. Mostra, para cada evento, o título e o nome dos seus palestrantes.

-- 056. Mostra, para cada inscrição: nome do participante, título do evento e STATUS.

-- 057. Lista os nomes dos participantes com inscrição 'Confirmada' no evento 'Conferência de Inteligência Artificial'.

-- 058. Conta as inscrições por evento (título e total).

-- 059. Conta as inscrições 'Confirmada' por evento, ordenando do maior para o menor total.

-- 060. Conta quantos participantes existem por empresa.

-- 061. Mostra todas as salas com o número de eventos de cada uma, incluindo as salas sem eventos.

-- 062. Lista os participantes que nunca se inscreveram em nenhum evento.

-- 063. Lista os palestrantes que ainda não estão associados a nenhum evento.

-- 064. Lista os eventos que não têm nenhuma inscrição.

-- 065. Lista as empresas com mais de 2 participantes.

-- 066. Lista os eventos com mais de 10 inscrições 'Confirmada'.

-- 067. Mostra o nome de cada palestrante e o número de eventos em que participa.

-- 068. Conta o número de inscrições por STATUS.

-- 069. Conta o número de inscrições por ano e mês da DataInscricao.

-- 070. Calcula a percentagem de lotação de cada evento (confirmadas / CapacidadeMax * 100).

-- 071. Lista os eventos lotados (inscrições confirmadas = CapacidadeMax).

-- 072. Classifica cada evento com CASE: 'Pequeno' (até 25), 'Médio' (até 60) ou 'Grande' (acima de 60), segundo a CapacidadeMax.

-- 073. Mostra cada inscrição com uma coluna calculada: 'Ativa' se Confirmada ou Aguardando, 'Inativa' se Cancelada.

-- 074. Lista os eventos com duração de 6 horas ou mais, com o nome da sala.

-- 075. Lista os participantes inscritos em mais de 3 eventos (ignora inscrições canceladas).

-- 076. Lista as pessoas que são simultaneamente palestrantes e participantes.

-- 077. Lista as pessoas que não são nem participantes nem palestrantes.

-- 078. Com UNION, cria uma lista única com o nome de todos os participantes e palestrantes e uma coluna "Tipo".

-- 079. Lista os eventos cuja CapacidadeMax é superior à média das CapacidadeMax (subquery).

-- 080. Lista os nomes dos participantes inscritos no evento 1, usando IN com subquery.

-- 081. Com EXISTS, lista os eventos que têm pelo menos uma inscrição 'Aguardando'.

-- 082. Com NOT EXISTS, lista os participantes que não têm nenhuma inscrição 'Confirmada'.

-- 083. Para cada evento, mostra a data da primeira inscrição recebida (subquery correlacionada ou agregação).

-- 084. Lista, sem repetições, as salas utilizadas por eventos de 2027.

-- 085. Mostra o evento (ou eventos, em caso de empate) com maior duração.

-- 086. Lista os palestrantes que deram eventos em mais de uma sala diferente.

-- 087. Mostra, por sala, o total de inscrições confirmadas em todos os seus eventos.

-- 088. Calcula, por evento, a taxa de cancelamento (canceladas / total de inscrições).

-- 089. Mostra, para cada inscrição, quantos dias faltavam entre a DataInscricao e o início do evento.

-- 090. Calcula a antecedência média de inscrição (em dias) por evento.

-- 091. Lista os eventos do último trimestre de 2026 com o respetivo número de palestrantes.

-- 092. Mostra, por empresa, os nomes dos participantes numa só linha, separados por vírgula.

-- 093. Mostra, por evento, os nomes dos palestrantes numa só linha, separados por vírgula.

-- 094. (DML, em transação) Insere uma nova sala 'Sala Mentoria' com capacidade 12 e confirma com SELECT. Faz ROLLBACK.

-- 095. (DML, em transação) Altera o telemóvel de uma pessoa à tua escolha e confirma com SELECT. Faz ROLLBACK.

-- 096. (DML, em transação) Passa para 'Confirmada' todas as inscrições 'Aguardando' do evento 17 e verifica o que acontece à lotação. Faz ROLLBACK.

-- 097. (DML, em transação) Apaga as inscrições canceladas feitas antes de 2026-09-01 e indica quantas linhas foram afetadas. Faz ROLLBACK.

-- 098. Com SELECT ... INTO, cria a tabela temporária #EventosFuturos com os eventos que ainda não começaram (compara com GETDATE()).

-- 099. Tenta inserir uma inscrição com STATUS 'Pendente' e explica por escrito (em comentário) qual a constraint que a rejeita.

-- 100. (DML, em transação) Tenta apagar: (a) uma pessoa sem papel, (b) uma pessoa participante sem inscrições, (c) uma pessoa participante com inscrições. Usa o que descobriste nos exercícios 062 e 077. Explica em comentário o resultado de cada caso com base nas chaves estrangeiras e no ON DELETE CASCADE. Faz ROLLBACK.


/*
############################################################
ETAPA 3 - DIFÍCIL (101 a 150)
CTEs, funções de janela, self join, PIVOT, CTE recursiva,
functions, views, stored procedures, triggers, transações,
índices e planos de execução
############################################################
*/

-- 101. Com uma CTE, calcula as inscrições confirmadas por evento e lista apenas os eventos acima da média.

-- 102. Com CTE, lista os eventos com lotação superior a 80% e mostra a percentagem.

-- 103. Numera (ROW_NUMBER) as inscrições de cada evento pela ordem de DataInscricao.

-- 104. Classifica os eventos pelo número de inscrições confirmadas com RANK e DENSE_RANK, lado a lado. Explica a diferença entre os dois.

-- 105. Mostra os 3 eventos com mais inscrições confirmadas em cada sala (ROW_NUMBER com PARTITION BY).

-- 106. Para cada evento, mostra quantos dias passaram desde o evento anterior na mesma sala (LAG).

-- 107. Mostra o total acumulado (running total) de inscrições feitas, dia a dia.

-- 108. Mostra a percentagem que cada evento representa no total de inscrições confirmadas (SUM() OVER()).

-- 109. Divide os eventos em 4 quartis pelo número de inscrições confirmadas (NTILE).

-- 110. Mostra, para cada participante, o título do primeiro evento em que se inscreveu.

-- 111. Com self join, lista os pares de eventos com horário sobreposto (sem repetir pares).

-- 112. Com self join, lista os pares de eventos que se sobrepõem E decorrem na mesma sala.

-- 113. Lista os participantes inscritos (não cancelados) em eventos com horário sobreposto (violação da regra de negócio).

-- 114. Lista os palestrantes escalados para eventos com horário sobreposto.

-- 115. Para as pessoas que são palestrantes e participantes, mostra se há sobreposição entre os eventos em que falam e aqueles em que estão inscritas.

-- 116. Com PIVOT, mostra por evento o número de inscrições em cada STATUS (uma coluna por status).

-- 117. Obtém o mesmo resultado do exercício 116 com agregação condicional (SUM com CASE) e compara as duas abordagens.

-- 118. Com CTE recursiva, gera todas as datas de 2026-09-01 a 2027-03-31 e mostra quantos eventos começam em cada dia (incluindo os dias com zero).

-- 119. Com CTE recursiva, gera os meses de 2026-09 a 2027-03 e mostra o número de eventos e de inscrições de cada mês (incluindo meses a zero).

-- 120. Lista os dias de novembro de 2026 em que não há nenhum evento.

-- 121. Calcula as horas totais de utilização de cada sala.

-- 122. Mostra o participante com mais inscrições confirmadas em cada empresa (ROW_NUMBER com PARTITION BY).

-- 123. Lista as empresas cujos participantes cobrem mais de 5 eventos distintos (inscrições não canceladas).

-- 124. Lista os eventos em que pelo menos 3 inscritos ativos pertencem à mesma empresa.

-- 125. Divisão relacional: lista os participantes com inscrição 'Confirmada' em TODOS os eventos da palestrante Vera Campos.

-- 126. Cria a função escalar dbo.fn_Lotacao(@IDEvento) que devolve o número de inscrições confirmadas.

-- 127. Cria a função escalar dbo.fn_VagasDisponiveis(@IDEvento) que devolve as vagas livres (usa a fn_Lotacao).

-- 128. Cria a função inline de tabela dbo.fn_EventosDoPalestrante(@IDPalestrante) que devolve os eventos desse palestrante.

-- 129. Cria a função dbo.fn_TemConflitoHorario(@IDParticipante, @Inicio, @Fim) que devolve 1 se o participante já tem uma inscrição ativa que se sobrepõe a esse intervalo, ou 0 caso contrário.

-- 130. Cria a função de tabela dbo.fn_AgendaParticipante(@IDParticipante) que devolve os eventos ativos do participante, por ordem cronológica.

-- 131. Cria a view vw_EventosResumo: evento, sala, número de palestrantes, inscrições confirmadas e vagas livres.

-- 132. Cria a view vw_AgendaParticipante: nome do participante, evento, sala, datas e STATUS.

-- 133. Cria a view vw_RankingEmpresas: empresa, número de participantes e número de inscrições ativas, com ranking.

-- 134. Cria a procedure sp_InscreverParticipante(@IDParticipante, @IDEvento) que valida: se o participante e o evento existem, se não há inscrição ativa duplicada, se não há conflito de horário e se há vaga. Se não houver vaga, a inscrição fica 'Aguardando'; caso contrário, 'Confirmada'.

-- 135. Cria a procedure sp_CancelarInscricao(@IDInscricao) com transação e TRY/CATCH: cancela a inscrição e promove para 'Confirmada' a inscrição 'Aguardando' mais antiga do mesmo evento, se existir.

-- 136. Cria a procedure sp_RelatorioEvento(@IDEvento) que devolve dois result sets: os dados do evento e a lista de inscritos.

-- 137. Cria uma procedure com parâmetro OUTPUT que devolve o total de inscrições confirmadas de um participante.

-- 138. Cria a procedure sp_CriarEvento que recebe os dados do evento e o IDPalestrante, e valida: CapacidadeMax não excede a sala, a sala está livre no intervalo pedido e o palestrante existe. Insere o evento e o vínculo em Evento_Palestra numa única transação.

-- 139. Cria um trigger AFTER INSERT em Inscricao que impede ultrapassar a CapacidadeMax do evento com inscrições confirmadas. Testa com INSERTs que passem e que falhem (em transação).

-- 140. Cria um trigger em Inscricao (INSERT e UPDATE) que impede um participante de ter inscrições ativas em eventos com horário sobreposto.

-- 141. Cria um trigger INSTEAD OF DELETE em Evento que impede apagar eventos com inscrições confirmadas.

-- 142. Cria a tabela Inscricao_Log e um trigger AFTER UPDATE que regista os valores antigo e novo do STATUS (usa as tabelas inserted e deleted), com data e hora.

-- 143. Cria um trigger em Evento (INSERT e UPDATE) que impede CapacidadeMax superior à Capacidade da sala.

-- 144. Cria um trigger que impede remover de Evento_Palestra o último palestrante de um evento (regra: cada evento precisa de pelo menos 1 palestrante).

-- 145. Escreve um bloco com transação que transfere uma inscrição de um evento para outro e faz ROLLBACK se o evento de destino estiver lotado.

-- 146. Liga SET STATISTICS IO ON e analisa a consulta de eventos num intervalo de datas. Cria um índice não clusterizado em Evento(DataInicio) com colunas incluídas (INCLUDE) e compara leituras lógicas e plano de execução antes e depois.

-- 147. Cria um índice em Inscricao(IDEvento, STATUS) e compara o plano de execução da contagem de inscrições confirmadas por evento antes e depois.

-- 148. Cria um índice único filtrado que impeça duas inscrições ativas (não canceladas) do mesmo participante no mesmo evento. Testa com INSERTs.

-- 149. Gaps and islands: identifica blocos de semanas consecutivas em que existe pelo menos um evento e mostra o início e o fim de cada bloco.

-- 150. Desafio final: com CTEs, produz um relatório mensal com: número de eventos, inscrições totais, taxa de confirmação, taxa de cancelamento e ocupação média (confirmadas / CapacidadeMax) dos eventos do mês.
