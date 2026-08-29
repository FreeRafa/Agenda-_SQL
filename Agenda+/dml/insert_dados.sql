/*
============================================================
AgendaSQL - Projeto 1: Sistema de Gestão de Eventos
Script DML - Carga de Dados de Exemplo
============================================================
Ordem de inserção respeita as dependências de FK:
1. Pessoa (tabela raiz)
2. Palestrante / Participante (extensões de Pessoa)
3. Sala
4. Evento (depende de Sala)
5. Evento_Palestra (associativa N:N entre Evento e Palestrante)
6. Inscricao (depende de Participante e Evento)
============================================================
*/


INSERT INTO Pessoa (Nome, Telemovel, Email)
VALUES
-- Futuros Palestrantes
('Ana Silva', '912345001', 'ana.silva@email.com'),
('Bruno Costa', '912345002', 'bruno.costa@email.com'),
('Carla Mendes', '912345003', 'carla.mendes@email.com'),
('Diogo Ferreira', '912345004', 'diogo.ferreira@email.com'),
('Eduarda Santos', '912345005', 'eduarda.santos@email.com'),

-- Futuros Participantes
('Filipe Oliveira', '912345006', 'filipe.oliveira@email.com'),
('Gabriela Rocha', '912345007', 'gabriela.rocha@email.com'),
('Hugo Martins', '912345008', 'hugo.martins@email.com'),
('Inês Carvalho', '912345009', 'ines.carvalho@email.com'),
('João Pereira', '912345010', 'joao.pereira@email.com'),
('Lara Gonçalves', '912345011', 'lara.goncalves@email.com'),
('Miguel Sousa', '912345012', 'miguel.sousa@email.com'),
('Nádia Ribeiro', '912345013', 'nadia.ribeiro@email.com'),
('Óscar Lopes', '912345014', 'oscar.lopes@email.com'),
('Paula Nunes', '912345015', 'paula.nunes@email.com');


INSERT INTO Palestrante (IdPessoa, Especializacao)
VALUES
(1, 'Inteligência Artificial'),
(2, 'Bases de Dados e SQL Server'),
(3, 'Desenvolvimento Web Full-Stack'),
(4, 'Cibersegurança'),
(5, 'Gestão de Projetos Ágeis');

INSERT INTO Participante (IdPessoa, Empresa)
VALUES
(6, 'TechNova Lda'),
(7, 'Grupo Alfa Consultoria'),
(8, 'Digital Bridge SA'),
(9, 'InovaSoft'),
(10, 'Consultora Meridian'),
(11, 'ByteWorks Portugal'),
(12, 'Freelancer'),
(13, 'Universidade de Lisboa'),
(14, 'Global Trade SA'),
(15, 'StartUp Vertex');

INSERT INTO Sala (NomeSala, Capacidade)
VALUES
('Sala Auditório', 100),
('Sala Workshop A', 30),
('Sala Workshop B', 25),
('Sala de Formação', 50),
('Sala VIP', 15);

-- ============================================================
-- 5. EVENTO (8 registos, distribuídos pelas 5 salas)
-- Nota: Eventos 3 e 4 têm horário sobreposto (salas diferentes)
--       Eventos 6 e 7 têm horário sobreposto (salas diferentes)
--       Usado para testar a função de conflito de horário
-- ============================================================
INSERT INTO Evento (Titulo, Descricao, DataInicio, DataFim, CapacidadeMax, IdSala)
VALUES
-- Evento 1: Auditório, capacidade cheia
('Conferência de Inteligência Artificial', 'Painel sobre tendências de IA em 2026', '2026-09-15 09:00', '2026-09-15 17:00', 100, 1),

-- Evento 2: Workshop A
('Workshop de SQL Server Avançado', 'Modelagem de dados e otimização de queries', '2026-09-20 14:00', '2026-09-20 18:00', 30, 2),

-- Evento 3: Workshop B (SOBREPÕE com Evento 4)
('Introdução a Cibersegurança', 'Conceitos fundamentais de segurança da informação', '2026-09-22 10:00', '2026-09-22 13:00', 25, 3),

-- Evento 4: Sala de Formação (SOBREPÕE com Evento 3, horário igual, salas diferentes)
('Desenvolvimento Web Full-Stack', 'Construção de aplicações modernas com React e Node', '2026-09-22 10:30', '2026-09-22 13:30', 50, 4),

-- Evento 5: Sala VIP, evento pequeno e exclusivo
('Mesa Redonda: Gestão Ágil', 'Discussão sobre metodologias ágeis com especialistas', '2026-10-05 15:00', '2026-10-05 17:00', 15, 5),

-- Evento 6: Auditório (SOBREPÕE com Evento 7)
('Palestra: O Futuro da IA nas Empresas', 'Impacto da inteligência artificial na indústria', '2026-10-10 09:00', '2026-10-10 11:00', 80, 1),

-- Evento 7: Workshop A (SOBREPÕE com Evento 6, horário igual, salas diferentes)
('Bases de Dados na Prática', 'Estudo de caso com SQL Server em ambiente real', '2026-10-10 09:30', '2026-10-10 12:00', 30, 2),

-- Evento 8: Sala de Formação, sem sobreposição
('Cibersegurança para Equipas de TI', 'Boas práticas de proteção de dados corporativos', '2026-11-02 09:00', '2026-11-02 16:00', 50, 4);

INSERT INTO Evento_Palestra (IdEvento, IdPalestrante)
VALUES
(1, 1),  -- Conferência de IA -> Ana Silva (IA)
(2, 2),  -- Workshop SQL Server -> Bruno Costa (BD/SQL Server)
(3, 4),  -- Introdução a Cibersegurança -> Diogo Ferreira (Cibersegurança)
(4, 3),  -- Dev Web Full-Stack -> Carla Mendes (Full-Stack)
(5, 5),  -- Mesa Redonda Gestão Ágil -> Eduarda Santos (Gestão Ágil)
(6, 1),  -- Futuro da IA -> Ana Silva (IA)
(6, 5),  -- Futuro da IA -> Eduarda Santos (2º palestrante, complementa com visão de gestão)
(7, 2),  -- Bases de Dados na Prática -> Bruno Costa
(8, 4);  -- Cibersegurança para TI -> Diogo Ferreira

INSERT INTO Inscricao (IdParticipante, IdEvento, DataInscricao, Status)
VALUES
(1, 1, '2026-08-20', 'Confirmada'),   -- Filipe -> Conferência IA
(1, 5, '2026-08-22', 'Confirmada'),   -- Filipe -> Mesa Redonda Gestão Ágil

(2, 1, '2026-08-21', 'Confirmada'),   -- Gabriela -> Conferência IA
(2, 8, '2026-08-25', 'Aguardando'),   -- Gabriela -> Cibersegurança para TI

(3, 2, '2026-08-23', 'Confirmada'),   -- Hugo -> Workshop SQL Server
(3, 6, '2026-08-28', 'Confirmada'),   -- Hugo -> Futuro da IA

(4, 3, '2026-08-24', 'Confirmada'),   -- Inês -> Introdução a Cibersegurança
(4, 5, '2026-08-24', 'Cancelada'),    -- Inês -> Mesa Redonda (cancelou depois)

(5, 4, '2026-08-26', 'Confirmada'),   -- João -> Dev Web Full-Stack

(6, 7, '2026-08-27', 'Confirmada'),   -- Lara -> Bases de Dados na Prática
(6, 8, '2026-08-30', 'Aguardando'),   -- Lara -> Cibersegurança para TI

(7, 1, '2026-08-19', 'Confirmada'),   -- Miguel -> Conferência IA
(7, 2, '2026-08-29', 'Confirmada'),   -- Miguel -> Workshop SQL Server

(8, 6, '2026-08-31', 'Confirmada'),   -- Nádia -> Futuro da IA
(8, 3, '2026-09-01', 'Confirmada'),   -- Nádia -> Introdução a Cibersegurança

(9, 4, '2026-09-02', 'Confirmada'),   -- Óscar -> Dev Web Full-Stack
(9, 8, '2026-09-03', 'Confirmada'),   -- Óscar -> Cibersegurança para TI

(10, 5, '2026-09-04', 'Confirmada'),  -- Paula -> Mesa Redonda Gestão Ágil
(10, 7, '2026-09-05', 'Aguardando');  -- Paula -> Bases de Dados na Prática