--- >>>>>> Cria��o do Banco de Dados com as Suas tabelas <<<<<< ---

--Criando Banco de dados
create database DS_Vestibulares;

--Usuando o BD correto
use DS_Vestibulares;

--Criando a tabela Usu�rios
create table Usuarios(
	ID_Usuario		int primary key identity,
	Nome_Usuario	varchar(60)		not null,
	Email_Usuario	varchar(260)	not null unique,
	Senha_Usuario	varchar(100)	not null,
	Dt_Nascimento	date			not null,
	Idade_Usuario as datediff(year, Dt_Nascimento, getdate()) - case when month(Dt_Nascimento) > month(getdate()) or (month(Dt_Nascimento) = month(getdate()) and day(Dt_Nascimento) > day(getdate())) then 1 else 0 end,
	Status_Usuario	varchar(10)		not null,
	Nivel_Usuario	varchar(15)		not null
);


--Crando a tabela Hist�rico de Opera��es executadas pelos Usu�rios
create table Historico_Operacoes(
	ID_Operacao			int primary key identity,
	Descricao_Operacao	text	not null,
	Dt_Operacao			smalldatetime	not null,
	ID_Usuario			int		not null,
	foreign key(ID_Usuario) references Usuarios(ID_Usuario)
);


-- Criando tabela das Avalia��es dos Usu�rios
create table Avaliacoes(
	ID_Avaliacao			int primary key identity,
	Comentario_Avaliacao	text	not null,
	Dt_Avaliacao			date	not null,
	Nota_Avaliacao			int		not null,
	ID_Usuario				int		not null unique,
	foreign key(ID_Usuario) references Usuarios(ID_Usuario)
);


--Criando tabela das informa��es do site
create table Informacoes_Site(
	ID_Informacao		int primary key identity,
	Texto_Apresentacao	text	not null,
	Dt_Alteracao		date	not null,
	ID_ADM				int		not null,
	foreign key(ID_ADM) references Usuarios(ID_Usuario)
);


--Criando tabela�para armazenar as imagens a serem mostradas na pagina index do site
create table Imagens_Site(
	ID_Imagem		int primary key identity,
	Caminho_Imagem	text	not null,
	ID_Informacao	int		not null,
	foreign key(ID_Informacao) references Informacoes_Site(ID_Informacao)
);


--Criando tabela de Vestibulares
create table Vestibulares(
	ID_Vestibular				int primary key identity,
	Nome_Vestibular				varchar(100)	not null,
	Logo_Vestibular				text			not null,
	Dt_Implementacao			date			not null,
	Regras_Gerais				text			not null,
	Descricao_Redacao			text			not null,
	TituloObrigatorio_Redacao	varchar(5)		not null,
	QtMaxima_Redacao			int				not null,
	QtMinima_Redacao			int				not null,
	PontuacaoMinima_Redacao		int				not null,
	PontuacaoMaxima_Redacao		int				not null,
	Pontos_Questao				int				not null,
	Minutos_Questao				float			not null,
	ID_ADM						int				not null,
	foreign key(ID_ADM) references Usuarios(ID_Usuario)
);


--Criando tabela Unidades de Ensino
create table Unidades_Ensino(
	ID_Unidade		int primary key identity,
	Nome_Unidade	varchar(100)	not null,
	ID_Vestibular	int				not null,
	foreign key(ID_Vestibular) references Vestibulares(ID_Vestibular)
);


--Criando tabela Temas de Reda��es
create table Temas_Redacoes(
	ID_Tema		int primary key identity,
	Tema		text		not null,
	Origem		varchar(15) not null,
	Ano_Tema	int			not null,
	ID_Origem	int			not null
);


--Criando tabela Reda��es
create table Redacoes(
	ID_Redacao		int primary key identity,
	Titulo_Redacao	varchar(100)	not null,
	Redacao			text			not null,
	Tipo_Envio		varchar(10)		not null,
	Dt_Envio		date			not null,
	ID_Vestibular	int				not null,
	ID_Usuario		int				not null,
	ID_Tema			int				not null,
	foreign key(ID_Vestibular)	references Vestibulares(ID_Vestibular),
	foreign key(ID_Tema)		references Temas_Redacoes(ID_Tema),
	foreign key(ID_Usuario)		references Usuarios(ID_Usuario)
);


--Criando tabela Corre��es das Reda��es
create table Correcoes_Redacoes(
	ID_Correcao			int primary key identity,
	Nota_Correcao		int			not null,
	Dt_Correcao			date		not null,
	Tipo_Correcao		varchar(10) not null,
	Redacao_Corrigida	text		not null,
	Comentario_Redacao	text		not null,
	ID_Corretor			int			not null,
	ID_Redacao			int			not null,
	foreign key(ID_Redacao)		references Redacoes(ID_Redacao),
	foreign key(ID_Corretor)	references Usuarios(ID_Usuario)
);


--Criando tabela Disciplinas
create table Disciplinas(
	ID_Disciplina	int primary key identity,
	Nome_Disciplina varchar(100)	not null,
	ID_ADM			int				not null,
	foreign key(ID_ADM) references Usuarios(ID_Usuario)
);


--Criando tabela Quest�es
create table Questoes(
	ID_Questao			int primary key identity,
	Texto_Questao		text		not null,
	Ano_Questao			int			not null,
	Alternativa_Correta varchar(2)	not null,
	ID_ADM				int			not null,
	ID_Vestibular		int			not null,
	foreign key(ID_ADM) references Usuarios(ID_Usuario),
	foreign key(ID_Vestibular) references Vestibulares(ID_Vestibular)
);


--Criando tabela para relacionamento N para N entre as tabelas Disciplinas e Quest�es
create table Disciplinas_Questoes(
	ID_Disciplina	int not null,
	ID_Questao		int not null,
	foreign key(ID_Questao)		references Questoes(ID_Questao),
	foreign key(ID_Disciplina)	references Disciplinas(ID_Disciplina),
	constraint PK_DisQues primary key (ID_Disciplina,ID_Questao)
);


--Criando tabela para as Imagens das Quest�es
create table Imagens_Questoes(
	ID_Imagem		int primary key identity,
	Caminho_Imagem	text not null,
	ID_Questao		int	 not null,
	foreign key(ID_Questao) references Questoes(ID_Questao)
);


--Criando tabela Alternativas
create table Alternativas(
	ID_Alternativa		int primary key identity,
	Alternativa			varchar(2)	not null,
	Texto_Alternativa	text		not null,
	Tipo				varchar(10) not null,
	ID_Questao			int			not null,
	foreign key(ID_Questao) references Questoes(ID_Questao)
);


--Criando tabela de Historico dos Simulados Realizados
create table Historico_Simulados(
	ID_HistoricoSimulados	int primary key identity,
	Dt_Finalizacao			smalldatetime	not null,
	Pontuacao				int				not null,
	Precisao				float			not null,
	Minutos_Gasto			float			not null,

	-- Campo derivado: Esse campo � derivado, pois ser� calculado mediante a divis�o entre os Minutos_Gasto com Quantidade de Quest�es com o ID correspondente na tabela HistoricoSimulados_Questoes, esse calculo ser� feito no site antes da isenser��o dos dados, logo na inser��o da aivividade ele ser� iinserido normalmente.
	Minutos_Pergunta		float				not null, 

	ID_Usuario				int				not null,
	foreign key(ID_Usuario)		references Usuarios(ID_Usuario)
);


--Criando a tabela para o relacionamento N para N com as tabelas Historico_Simulados com as Quest�es
create table HistoricoSimulados_Questoes(
	ID_HistoricoSimulados	int			not null,
	ID_Questao				int			not null,
	Alt_Selecionada			varchar(2) not null,
	foreign key(ID_Questao)				references Questoes(ID_Questao),
	foreign key (ID_HistoricoSimulados)	references Historico_Simulados(ID_HistoricoSimulados),
	constraint PK_HistQues primary key (ID_HistoricoSimulados,ID_Questao)
);


--Criando tabela de Simulados Salvos pelo Usu�rio
create table Simulados_Salvos(
	ID_SimuladoSalvo	int primary key identity,
	Dt_Salvamento		smalldatetime	not null,
	Nome_Simulado		varchar(100)	not null,
	Visualiizacao		varchar(15)		not null,
	Status_Simulado		varchar(15)		not null,
	ID_Usuario			int				not null,
	foreign key(ID_Usuario)		references Usuarios(ID_Usuario)
);



--Criando a tabela para o relacionamento N para N com as tabelas Simulados_Salvos com as Quest�es
create table SimuladosSalvos_Questoes(
	ID_SimuladoSalvo	int not null,
	ID_Questao			int not null,
	Alt_Selecionada		varchar(10) not null,
	foreign key(ID_Questao)		references Questoes(ID_Questao),
	foreign key(ID_SimuladoSalvo)	references Simulados_Salvos(ID_SimuladoSalvo),
	constraint PK_SalvosQues primary key (ID_SimuladoSalvo,ID_Questao)
);



--- >>>>>> Inser��o dos 20 Registros por Tabela <<<<<< ---

--Ajustando o formato da data para a iser��o dos dados
SET DATEFORMAT ymd; 

--Inserindo Usu�rios na Tabela Usuarios
insert into Usuarios (Nome_Usuario, Email_Usuario, Senha_Usuario, Dt_Nascimento, Status_Usuario, Nivel_Usuario) values 
('Luis', 'luis@gmail.com', '123', '2006-02-23', 'Ativo', 'Aluno'),
('Pedro', 'pedro@gmail.com', '456', '2005-12-13', 'Ativo', 'Aluno'),
('Dutra', 'dutra@gmail.com', '789', '2001-01-16', 'Ativo', 'Corretor'),
('Carrocini', 'carrocini@gmail.com', '123456', '2000-12-18', 'Ativo', 'ADM'),
('Lu�s Pedro Dutra Carrocini', 'luiscarrocini@gmail.com', 'luispedrin123', '2006-02-23', 'Ativo', 'ADM Geral'),
('Ivanilde', 'ivanilde@gmail.com', 'ivan789', '1976-02-23', 'Ativo', 'Professor'),
('C�sar', 'cesar@gmail.com', 'cesinha456', '1984-06-10', 'Ativo', 'Professor'),
('Ant�nio C�sar', 'antonio@gmail.com', 'antonio789', '2001-01-16', 'Ativo', 'ADM'),
('Iraci', 'iraci@gmail.com', 'iraci', '1986-09-27', 'Ativo', 'Corretor'),
('Ivo', 'ivo@gmail.com', 'ivo123456789', '1980-02-23', 'Ativo', 'Aluno'),
('Tainara', 'tainara@gmail.com', 'tainara2408', '2005-08-24', 'Banido', 'Aluno'),
('Nathan', 'nathane@gmail.com', 'nathan', '2000-07-12', 'Banido', 'Professor'),
('Aldair', 'aldair@gmail.com', 'aldair789', '1976-12-23', 'Ativo', 'Professor'),
('Ana', 'ana@gmail.com', 'ana123', '1995-03-15', 'Banido', 'Aluno'),
('Bruno', 'bruno@gmail.com', 'bruno123', '1998-10-05', 'Ativo', 'Aluno'),
('Carlos', 'carlos@gmail.com', 'carlos123', '2001-02-28', 'Banido', 'Aluno'),
('Daniela', 'daniela@gmail.com', 'daniela123', '1997-06-18', 'Ativo', 'Aluno'),
('Eduardo', 'eduardo@gmail.com', 'eduardo123', '1999-09-22', 'Banido', 'Aluno'),
('Fernanda', 'fernanda@gmail.com', 'fernanda123', '2000-11-12', 'Banido', 'Aluno'),
('Gabriel', 'gabriel@gmail.com', 'gabriel123', '1996-12-30', 'Banido', 'Aluno'),
('Helena', 'helena@gmail.com', 'helena123', '1994-01-17', 'Ativo', 'Aluno'),
('Igor', 'igor@gmail.com', 'igor123', '1993-04-25', 'Banido', 'Aluno'),
('Juliana', 'juliana@gmail.com', 'juliana123', '1992-08-14', 'Banido', 'Aluno'),
('Lucas', 'lucas@gmail.com', 'lucas123', '2001-05-20', 'Banido', 'Aluno'),
('Mariana', 'mariana@gmail.com', 'mariana123', '1990-07-07', 'Ativo', 'Aluno'),
('Nina', 'nina@gmail.com', 'nina123', '1991-09-30', 'Banido', 'Aluno'),
('Otavio', 'otavio@gmail.com', 'otavio123', '2002-03-10', 'Ativo', 'Aluno'),
('Patricia', 'patricia@gmail.com', 'patricia123', '1989-12-24', 'Ativo', 'Aluno');

--Selecionando e mostrando todos os Usu�rios cadastrados
select * from Usuarios;


--Inserindo as Avalia��es dos Usu�rios na tabela Avaliacoes
insert into Avaliacoes values
('Muito Bom', '2024-05-23', 10, 1),
('Muito Ruim', '2022-07-13', 5, 2),
('Procisa melhorar tal coisa', '2014-04-23', 6, 10),
('Otimo site para estudar pro ENEM', '2024-06-23', 7, 11),
('Me ajudou muito', '2024-12-23', 0, 12),
('Top de linha', '2020-05-23', 6, 13),
('Mi� do mundo', '2021-02-23', 2, 14),
('Bom', '2023-06-27', 1, 15),
('B�o de mais da conta', '2009-02-14', 3, 16),
('Ai sim', '2020-05-23', 4, 17),
('Poderia criar tal funcionalidade', '2024-05-23', 5, 18),
('S� acho que...', '2023-05-23', 6, 19),
('O site ta muito lento', '2021-05-23', 7, 20),
('Sua ideia � boa', '2024-05-23', 8, 21),
('A intervace pode melhorar em tal coisa', '2024-02-23', 9, 22),
('Muito top', '2024-03-23', 10, 23),
('Por enquanto tudo tranquilo', '2024-04-23', 0, 24),
('Bom bom', '2024-06-25', 10, 25),
('God god', '2024-05-07', 3, 26),
('Box of god god', '2024-08-09', 9, 27);

--Selecionando e mostrando todas as Avalia��es cadatradas
select * from Avaliacoes;


--Inserindo os Vestibulares na tabela Vestibulares
insert into Vestibulares values 
('ENEM', 'img/enem.png', '1998-05-27', 'N�o pode colar', 'Texto  Disertativo', 'N�o', 15, 30, 400, 1000, 6, 2.5, 4),
('FUVEST', 'img/fuvest.png', '2001-07-20', 'Apenas caneta preta', 'Reda��o e Objetiva', 'N�o', 18, 50, 500, 1200, 7, 3.0, 5.0),
('UNICAMP', 'img/unicamp.png', '2002-08-18', 'Material pr�prio', 'Prova Dissertativa', 'Sim', 14, 40, 450, 1000, 6, 2.8, 4.2),
('UNESP', 'img/unesp.png', '2003-09-25', 'Uso de calculadora permitido', 'Reda��o e Objetiva', 'N�o', 16, 35, 400, 900, 5, 2.5, 4.0),
('UERJ', 'img/uerj.png', '2004-10-05', 'Proibido o uso de eletr�nicos', 'Prova Dissertativa', 'Sim', 20, 45, 600, 1400, 8, 3.5, 5.5),
('UFRJ', 'img/ufrj.png', '2005-11-12', 'Sil�ncio obrigat�rio', 'Reda��o e Objetiva', 'N�o', 10, 30, 300, 700, 4, 1.5, 2.5),
('UNIFESP', 'img/unifesp.png', '2006-12-15', 'Revis�o n�o permitida', 'Prova Dissertativa', 'Sim', 22, 50, 550, 1300, 7, 3.2, 4.8),
('UFMG', 'img/ufmg.png', '2007-01-20', 'Prova individual', 'Reda��o e Objetiva', 'N�o', 15, 40, 450, 1000, 6, 2.5, 4.0),
('UFBA', 'img/ufba.png', '2008-02-25', 'Sem consulta', 'Prova Dissertativa', 'Sim', 18, 45, 500, 1100, 6, 2.8, 4.5),
('UFG', 'img/ufg.png', '2009-03-30', 'Apenas caneta azul', 'Reda��o e Objetiva', 'N�o', 13, 25, 350, 800, 5, 2.0, 3.0),
('UFSC', 'img/ufsc.png', '2010-04-10', 'Material pr�prio', 'Prova Dissertativa', 'Sim', 21, 50, 550, 1200, 7, 3.0, 4.5),
('UFPR', 'img/ufpr.png', '2011-05-15', 'Uso de calculadora permitido', 'Reda��o e Objetiva', 'N�o', 19, 40, 450, 1000, 6, 2.8, 4.2),
('UFRGS', 'img/ufrgs.png', '2012-06-20', 'Proibido o uso de eletr�nicos', 'Prova Dissertativa', 'Sim', 16, 35, 400, 900, 5, 2.5, 4.0),
('UFC', 'img/ufc.png', '2013-07-25', 'Sil�ncio obrigat�rio', 'Reda��o e Objetiva', 'N�o', 11, 30, 300, 700, 4, 1.5, 2.5),
('UFPA', 'img/ufpa.png', '2014-08-30', 'Revis�o n�o permitida', 'Prova Dissertativa', 'Sim', 23, 50, 600, 1300, 7, 3.2, 5.0),
('UFMA', 'img/ufma.png', '2015-09-10', 'Prova individual', 'Reda��o e Objetiva', 'N�o', 17, 45, 500, 1100, 6, 2.8, 4.0),
('UFMT', 'img/ufmt.png', '2016-10-15', 'Sem consulta', 'Prova Dissertativa', 'Sim', 20, 50, 550, 1200, 7, 3.0, 4.5),
('UFAM', 'img/ufam.png', '2017-11-20', 'Apenas caneta preta', 'Reda��o e Objetiva', 'N�o', 14, 40, 450, 1000, 6, 2.5, 4.0),
('UFRN', 'img/ufrn.png', '2018-12-25', 'Material pr�prio', 'Prova Dissertativa', 'Sim', 22, 45, 500, 1100, 6, 2.8, 4.5),
('UFPE', 'img/ufpe.png', '2019-01-30', 'Uso de calculadora permitido', 'Reda��o e Objetiva', 'N�o', 18, 35, 400, 900, 5, 2.5, 4.0);

--Selecionando e mostrando todos os Vestibulares cadastrados
select * from Vestibulares;


--Inserindo as Unidades de Ensino na tabela Unidades_Ensino
insert into Unidades_Ensino values
('FATEC', 20),
('USP', 2),
('UNICAMP', 3),
('UNESP', 4),
('UFABC', 5),
('UFRJ', 6),
('UFMG', 7),
('UNIFESP', 8),
('UFBA', 9),
('UFSC', 10),
('UFPR', 11),
('UFRGS', 12),
('UFC', 13),
('UFPA', 14),
('UFMA', 15),
('UFMT', 16),
('UFAM', 17),
('UFRN', 18),
('UFPE', 19),
('UFG', 20);

--Selecionando e mostrando todas as Unidades de Ensino inseridas
select * from Unidades_Ensino;


--Inserindo os Temas de Reda��es na tabela Temas_Redacoes
insert into Temas_Redacoes values
('Desafios para o enfrentamento da invisibilidade do trabalho de cuidado realizado pela mulher no Brasil', 'Vestibular', 2023, 1),
('Meu tema inventado professor', 'Professor', 2024, 6),
('Meu tema inventado aluno', 'Aluno', 2024, 1),
('O voto facultativo', 'Vestibular', 2023, 4),
('Outro tema inventadoo por professor', 'Professor', 2020, 7),
('Outro tema inventadoo por aluno', 'Aluno', 2019, 10),
('Impacto das Tecnologias no Mercado de Trabalho', 'Aluno', 2023, 1),
('A Influ�ncia das Redes Sociais na Educa��o', 'Professor', 2022, 13),
('Desafios do Sistema Educacional Brasileiro', 'Vestibular', 2021, 3),
('Sustentabilidade e Meio Ambiente', 'Aluno', 2024, 4),
('Sa�de Mental na Escola', 'Professor', 2023, 6),
('Desigualdade Social no Brasil', 'Vestibular', 2020, 6),
('Cultura e Identidade', 'Aluno', 2022, 7),
('Inova��es na Educa��o', 'Professor', 2021, 6),
('O Papel da Fam�lia na Educa��o', 'Vestibular', 2019, 9),
('Viol�ncia Urbana e Escolar', 'Aluno', 2024, 10),
('A Import�ncia da Leitura', 'Professor', 2023, 12),
('Educa��o Inclusiva', 'Vestibular', 2022, 12),
('Tecnologia e Sociedade', 'Aluno', 2021, 13),
('Cidadania e Democracia', 'Professor', 2020, 7),
('Mudan�as Clim�ticas', 'Vestibular', 2024, 15),
('Desafios da Globaliza��o', 'Aluno', 2023, 16),
('�tica e Corrup��o', 'Professor', 2022, 7),
('Crescimento Urbano Desordenado', 'Vestibular', 2021, 18),
('Mobilidade Urbana', 'Aluno', 2020, 19),
('Educa��o para o S�culo XXI', 'Professor', 2019, 7);

--Selecionando e mostrando todos os Temas cadastrados
select * from Temas_Redacoes;


--Inserindo as Reda��es dos Alunos na tebela Redacoes
insert into Redacoes (Titulo_Redacao, Tipo_Envio, Redacao, Dt_Envio, ID_Vestibular, ID_Usuario, ID_Tema) values
('O combate contra a Dengue', 'Texto', 'Bla bla bla bla', '2024-05-23', 1, 1, 2),
('A invisibilidade da mulher no trabalho', 'Arquivo', 'arquivos/redacoes/redacao.txt', '2024-05-23', 7, 2, 7),
('O combate contra a COVID', 'Texto', 'Tururururu', '2022-12-27', 10, 10, 12),
('Um tema dahora que s� ele', 'Arquivo', 'arquivos/redacoes/redacao2.docx', '2022-12-27', 9, 15, 16),
('Os desafios da educa��o', 'Texto', 'De acordo com o artigo tal da Constitui��o Federal, � dever do governo garantir a educa��o as todos os...', '2024-01-27', 10, 10, 12),
('A import�ncia da vacina��o', 'Texto', 'A vacina��o � essencial para a imuniza��o em massa...', '2023-01-10', 5, 14, 18),
('Desafios da educa��o a dist�ncia', 'Arquivo', 'caminho/para/arquivo1.pdf', '2023-02-15', 3, 15, 16),
('Mudan�as clim�ticas e suas consequ�ncias', 'Texto', 'O aquecimento global � um dos maiores desafios da atualidade...', '2023-03-20', 7, 21, 19),
('A influ�ncia da tecnologia na vida moderna', 'Arquivo', 'caminho/para/arquivo2.docx', '2023-04-25', 11, 27, 13),
('A revolu��o das energias renov�veis', 'Texto', 'A transi��o para energias limpas � crucial para o futuro do planeta...', '2023-05-30', 4, 15, 20),
('A import�ncia da vacina��o', 'Texto', 'A vacina��o � essencial para a imuniza��o em massa...', '2023-01-10', 5, 14, 18),
('Desafios da educa��o a dist�ncia', 'Arquivo', 'caminho/para/arquivo1.pdf', '2023-02-15', 3, 27, 16),
('Mudan�as clim�ticas e suas consequ�ncias', 'Texto', 'O aquecimento global � um dos maiores desafios da atualidade...', '2023-03-20', 7, 14, 19),
('A influ�ncia da tecnologia na vida moderna', 'Arquivo', 'caminho/para/arquivo2.docx', '2023-04-25', 11, 6, 13),
('A revolu��o das energias renov�veis', 'Texto', 'A transi��o para energias limpas � crucial para o futuro do planeta...', '2023-05-30', 4, 15, 20),
('O impacto da intelig�ncia artificial', 'Texto', 'A intelig�ncia artificial est� mudando a forma como vivemos e trabalhamos...', '2023-06-10', 9, 10, 11),
('Sustentabilidade no s�culo XXI', 'Arquivo', 'caminho/para/arquivo3.pdf', '2023-07-15', 2, 13, 17),
('Os desafios do aquecimento global', 'Texto', 'O aquecimento global representa um desafio urgente para a humanidade...', '2023-08-20', 8, 9, 15),
('A evolu��o das energias renov�veis', 'Arquivo', 'caminho/para/arquivo4.docx', '2023-09-25', 1, 11, 14),
('A influ�ncia das redes sociais', 'Texto', 'As redes sociais t�m um grande impacto na sociedade moderna...', '2023-10-30', 6, 18, 12),
('Educa��o para o futuro', 'Arquivo', 'caminho/para/arquivo5.pdf', '2023-11-05', 12, 10, 16),
('O futuro da mobilidade urbana', 'Texto', 'Novas formas de mobilidade urbana est�o surgindo em todo o mundo...', '2023-12-10', 14, 23, 18),
('A import�ncia da conserva��o ambiental', 'Arquivo', 'caminho/para/arquivo6.docx', '2024-01-15', 7, 8, 13),
('Tecnologia e privacidade', 'Texto', 'A quest�o da privacidade est� cada vez mais em evid�ncia com o avan�o da tecnologia...', '2024-02-20', 11, 28, 19),
('O impacto da globaliza��o', 'Arquivo', 'caminho/para/arquivo7.pdf', '2024-03-25', 10, 9, 15),
('O papel da ci�ncia na sociedade', 'Texto', 'A ci�ncia desempenha um papel crucial no desenvolvimento da sociedade...', '2024-04-30', 3, 22, 17),
('A import�ncia da leitura', 'Arquivo', 'caminho/para/arquivo8.docx', '2024-05-10', 5, 13, 16),
('A revolu��o digital', 'Texto', 'A revolu��o digital est� transformando todos os aspectos da vida moderna...', '2024-06-15', 4, 11, 14),
('A �tica no desenvolvimento tecnol�gico', 'Arquivo', 'caminho/para/arquivo9.pdf', '2024-07-20', 6, 10, 18),
('Os desafios da democracia moderna', 'Texto', 'A democracia enfrenta v�rios desafios no mundo moderno...', '2024-08-25', 8, 14, 12);

--Selecionando e mostrando todos os registros da tabela Reda��es
select * from Redacoes;


--Inserindo as Corre��es das Reda��es na tabela Correcoes_Redacoes
insert into Correcoes_Redacoes (Nota_Correcao, Dt_Correcao, Tipo_Correcao, Redacao_Corrigida, Comentario_Redacao, ID_Corretor, ID_Redacao) values
(1000, '2024-05-23', 'Texto', 'Bla bla bla bla', 'B�o', 3, 1),
(950, '2024-04-23', 'Texto', 'Bla bla bla blu', 'Chegando l�', 9, 1),
(100, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao1.txt', 'Bem mau', 3, 2),
(850, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Bom', 9, 2),
(820, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao2.docx', 'Bom', 3, 3),
(13, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao3.txt', 'Muito ruim', 3, 4),
(20, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ta mal ein', 3,5),
(450, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 9, 5),
(1000, '2024-05-23', 'Texto', 'Bla bla bla bla', 'B�o', 3, 6),
(620, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao4.pdf', 'Melhorando', 3, 7),
(840, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao5.txt', 'Bom', 3, 8),
(730, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Quase bom', 9, 9),
(630, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Melhorando', 3, 10),
(500, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao6.doc', 'Ruim', 3, 11),
(990, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Bateu na trave', 3, 12),
(1000, '2024-05-23', 'Texto', 'Bla bla bla bla', 'B�o', 9, 12),
(300, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 3, 13),
(400, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 3, 14),
(200, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao7.txt', 'Ruim', 3, 15),
(220, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 9, 16),
(580, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao8.txt', 'Ruim', 3, 17),
(740, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Quase bom', 3, 18);

--Selecionando e mostrando todas as Corre��es das Reda��es cadastradas
select * from Correcoes_Redacoes;


--Inserindo as Disciplinas na tebala Disciplinas
insert into Disciplinas (Nome_Disciplina, ID_ADM) values
('Matem�tica', 4),
('Portugu�s', 4),
('Algebra Linear', 4),
('Hist�ria', 4),
('Geografia', 4),
('F�sica', 4),
('Biologia', 4),
('Sociologia', 4),
('Educa��o F�sica', 4),
('Qu�mica', 4),
('Teologia', 4),
('Filosofia', 4),
('Inform�tica', 4),
('L�gica', 4),
('Ingl�s', 4),
('Espanhol', 4),
('Fran�es', 4),
('Mitologia', 4),
('Artes', 4),
('Literatura', 4),
('Ensino Religioso', 4),
('Musica', 4);

--Selecionando e mostrando as Disciplinas cadastradas
select * from Disciplinas;


--Inserindo as Quest�es na tabela Questoes
insert into Questoes (Texto_Questao, Ano_Questao, Alternativa_Correta, ID_ADM, ID_Vestibular) values
('As my official bio reads, I was made in Cuba, assembled in Spain, and imported to the United States � meaning my mother, seven months pregnant, and the rest of my family arrived as exiles from Cuba to Madrid, where I was born. Less than two months later, we emigrated once more and settled in New York City, then eventually in Miami, where I was raised and educated. Although technically we lived in the United States, the Cuban community was culturally insular in Miami during the 1970s, bonded together by the trauma of exile. What�s more, it seemed that practically everyone was Cuban: my teachers, my classmates, the mechanic, the bus driver. I didn�t grow up feeling different or treated as a minority. The few kids who got picked on in my grade school were the ones with freckles and funny last names like Dawson and O�Neil. BLANCO, R. Dispon�vel em: http://edition.cnn.com. Acesso em: 9 dez. 2017 (adaptado). Ao relatar suas viv�ncias, o autor destaca o:', 2022, 'd', 5, 1),
('Esse cartaz tem a fun��o social de:', 2022, 'e', 5, 1),
('Peque�o hermano Es, no cabe duda, el instrumento m�s presente y m�s poderoso de todos los que entraron en nuestras vidas. Ni la televisi�n ni el ordenador, no hablemos ya del obsoleto fax o de las agendas o los libros electr�nicos, ha tenido tal influencia, tal predicamento sobre nosotros. El m�vil somos nosotros mismos. Todo desactivado e inerte, inocuo, ya les digo. Y de repente, tras un viaje y tres o cuatro imprudentes fotos, salta un aviso en la pantalla. Con sonido, adem�s, pese a que tengo tambi�n todas las alertas desactivadas. Y mi monstruo dom�stico me dice: tienes un recuerdo nuevo. Lo repetir�: tienes un recuerdo nuevo. �Y t� qu� sabes? �Y a ti, m�quina demon�aca, qu� te importa? �C�mo te atreves a decirme qu� son o no son mis recuerdos? �Qu� es esta intromisi�n, este descaro? El peque�o hermano lo sabe casi todo. S�lo hay una esperanza: que la obsolescencia programada mate antes al peque�o hermano y que nosotros sigamos vivos, con los recuerdos que nos d� la gana. FERN�NDEZ, D. Dispon�vel em: www.lavanguardia.com. Acesso em: 5 dez. 2018 (adaptado). \r\nNo texto, o autor faz uma cr�tica ao(�): \r\n', 2022, 'd', 5, 1),
('En los suburbios de La Habana, llaman al amigo mi tierra o mi sangre. En Caracas, el amigo es mi pana o mi llave: pana, por panader�a, la fuente del buen pan para las hambres del alma; y llave por... � Llave, por llave � me dice Mario Benedetti. Y me cuenta que cuando viv�a en Buenos Aires, en los tiempos del terror, �l llevaba cinco llaves ajenas en su llavero: cinco llaves, de cinco casas, de cinco amigos: las llaves que lo salvaron. GALEANO, E. El libro de los abrazos. Madri: Siglo Veintiuno, 2015. \r\nNesse texto, o autor demonstra como as diferentes express�es existentes em espanhol para se referir a �amigo� variam em fun��o \r\n', 2022, 'c', 5, 1),
('No texto, as palavras �crianza� e �tribu� s�o usadas para: ', 2022, 'a', 5, 1),
('Two hundred years ago, Jane Austen lived in a world where single men boasted vast estates; single ladies were expected to speak several languages, sing and play the piano. In both cases, it was, of course, advantageous if you looked good too. So, how much has � or hasn�t � changed? Dating apps opaquely outline the demands of today�s relationship market; users ruminate long and hard over their choice of pictures and what they write in their biographies to hook in potential lovers, and that�s just your own profile. What do you look for in a future partner�s profile � potential signifiers of a popular personality, a good job, a nice car? These apps are a poignant reminder of the often classist attitudes we still adopt, as well as the financial and aesthetic expectations we demand from potential partners. GALER, S. Dispon�vel em: www.bbc.com. Acesso em: 8 dez. 2017 (adaptado).\r\nO texto aborda rela��es interpessoais com o objetivo de:\r\n', 2022, 'c', 5, 1),
('Nessa tirinha, o comportamento da mulher expressa:', 2022, 'b', 5, 1),
('A Teen�s View of Social Media Instagram is made up of all photos and videos. There is the home page that showcases the posts from people you follow, an explore tab which offers posts from accounts all over the world, and your own page, with a notification tab to show who likes and comments on your posts. It has some downsides though. It is known to make many people feel insecure or down about themselves because the platform showcases the highlights of everyone�s lives, while rarely showing the negatives. This can make one feel like their life is not going as well as others, contributing to the growing rates of anxiety or depression in many teens today. There is an underlying desire for acceptance through the number of likes or followers one has. Dispon�vel em: https://cyberbullying.org. Acesso em: 29 out. 2021. \r\nO termo �downsides� introduz a ideia de que o Instagram � respons�vel por: \r\n', 2022, 'd', 5, 1),
('I tend the mobile now like an injured bird We text, text, text our significant words. I re-read your first, your second, your third, Look for your small xx, feeling absurd. The codes we send arrive with a broken chord. I try to picture your hands, their image is blurred. Nothing my thumbs press will ever be heard. DUFFY, C. Dispon�vel em: www.independent.co.uk. Acesso em: 27 out. 2021.\r\nNesse poema, o eu l�rico evidencia um sentimento de:\r\n', 2022, 'e', 5, 1),
('Espera, resignado, o dia 13 daquele m�s porque, em tal data, usan�a avoenga lhe faculta sondar o futuro, interrogando a provid�ncia. � a experi�ncia tradicional de Santa Luzia. No dia 12 ao anoitecer exp�e ao relento, em linha, seis pedrinhas de sal, que representam, em ordem sucessiva da esquerda para a direita, os seis meses vindouros, de janeiro a junho. Ao alvorecer de 13 observa-as: se est�o intactas, pressagiam a seca; se a primeira apenas se deliu, transmudada em alj�far l�mpido, � certa a chuva em janeiro; se a segunda, em fevereiro; se a maioria ou todas, � inevit�vel o inverno benfazejo. Esta experi�ncia � bel�ssima. \r\nCUNHA, E. Os sert�es. S�o Paulo: Editora Tr�s, 1984. \r\nNo experimento descrito, a rela��o com a paisagem e com a religiosidade permite que o sertanejo seja: \r\n', 2022, 'd', 5, 1),
('Sempre que a relev�ncia do discurso entra em jogo, a quest�o torna-se pol�tica por defini��o, pois � o discurso que faz do homem um ser pol�tico. E tudo que os homens fazem, sabem ou experimentam s� tem sentido na medida em que pode ser discutido. Haver�, talvez, verdades que ficam al�m da linguagem e que podem ser de grande relev�ncia para o homem no singular, isto �, para o homem que, seja o que for, n�o � um ser pol�tico. Mas homens no plural, isto �, os homens que vivem e se movem e agem neste mundo, s� podem experimentar o significado das coisas por poderem falar e ser intelig�veis entre si e consigo mesmos. \r\nARENDT, H. A condi��o humana. Rio de Janeiro: Forense Universit�ria, 2004. \r\nNo trecho, a fil�sofa Hannah Arendt mostra a import�ncia da linguagem no processo de:', 2022, 'e', 5, 1),
('Eu estava pagando o sapateiro e conversando com um preto que estava lendo um jornal. Ele estava revoltado com um guarda civil que espancou um preto e amarrou numa �rvore. O guarda civil � branco. E h� certos brancos que transforma preto em bode expiat�rio. Quem sabe se guarda civil ignora que j� foi extinta a escravid�o e ainda estamos no regime da chibata? \r\nJESUS, C. M. Quarto de despejo: di�rio de uma favelada. S�o Paulo: �tica, 2014. \r\nO texto, que guarda a grafia original da autora, exp�e uma caracter�stica da sociedade brasileira, que � o(a): \r\n', 2022, 'a', 5, 1),
('PAZ, A. D. Dispon�vel em: www.ct.ufpb.br. Acesso em: 15 out. 2021 (adaptado). \r\nA intensifica��o da ocupa��o urbana demonstrada afeta de forma imediata o(a); \r\n', 2022, 'b', 5, 1),
('Na constru��o da ferrovia Madeira-Mamor�, o que dizer dos doentes, eternos moribundos a vagar entre del�rios febris, doses de quinino e corredores da morte? O Hospital da Candel�ria era santu�rio e t�mulo, monumento ao progresso cient�fico e pre�mbulo da escurid�o. Foi ali, com suas instala��es modern�ssimas, que m�dicos e sanitaristas dirigiram seu combate aos males tropicais. As maiores v�timas, contudo, permaneceriam na sombra � margem do palco, cobaias sem consolo, credores sem nome de uma sociedade que n�o lhes concedera tempo algum para ser decifrada. \r\nFOOT HARDMAN, F. Trem fantasma: modernidade na selva. S�o Paulo: Cia. das Letras, 1988 (adaptado). \r\nNo texto, h� uma cr�tica ao modo de ocupa��o do espa�o amaz�nico pautada na: \r\n', 2022, 'e', 5, 1),
('Uma nova economia surgiu em escala global no �ltimo quartel do s�culo XX. Chamo-a de informacional, global e em rede para identificar suas caracter�sticas fundamentais e diferenciadas e enfatizar sua interliga��o. � informacional porque depende basicamente de sua capacidade de gerar, processar e aplicar de forma eficiente a informa��o baseada em conhecimentos. � global porque seus componentes est�o organizados em escala global, diretamente ou mediante uma rede de conex�es entre agentes econ�micos. � rede porque � feita em uma rede global de intera��o entre redes empresariais. \r\nCASTELLS, M. A sociedade em rede � a era da informa��o: economia, sociedade e cultura. S�o Paulo: Paz e Terra, 1999 (adaptado). \r\nQual mudan�a estrutural � resultado da forma de organiza��o econ�mica descrita no texto? \r\n', 2022, 'e', 5, 1),
('Olhar o Brasil e n�o ver o sert�o \r\n� como negar o queijo com a faca na m�o \r\nEsse gigante em movimento \r\nMovido a tijolo e cimento Precisa de arroz com feij�o \r\nQue tenha comida na mesa \r\nQue agrade�a sempre a grandeza \r\nDe cada peda�o de p�o \r\nAgrade�a a Clemente \r\nQue leva a semente \r\nEm seu embornal \r\nZez� e o penoso bal� \r\nDe pisar no cacau \r\nMaria que amanhece o dia \r\nL� no milharal \r\nVANDER LEE. Do Brasil. In: Pensei que fosse o c�u: ao vivo. Rio de Janeiro: Indie Records, 2006 (fragmento). \r\nA letra da can��o valoriza uma dimens�o do espa�o rural brasileiro em sua rela��o com a cidade ao ressaltar sua fun��o de: \r\n', 2022, 'd', 5, 1),
('O n�mero cada vez maior de mulheres letradas e interessadas pela literatura e pelas novelas, muitas divulgadas em cap�tulos, se��es, classificadas comumente como folhetim, al�ou a um g�nero de fic��o corrente j� em 1840, fazendo parte do florescimento da literatura nacional brasileira, instigando a forma��o e a amplia��o de um p�blico leitor feminino, �vido por novidades, pelo apelo dos folhetins e �narrativas modernas� que encenavam �os dramas e os conflitos de uma mulher em processo de transforma��o patriarcal e provinciana que, progressivamente, come�ava a se abrir para modernizar seus costumes�. No Segundo Reinado, as mulheres foram se tornando p�blico determinante na constru��o da literatura e da imprensa nacional. E n�o apenas p�blico, porquanto crescer� o n�mero de escritoras que colaboram para isso e emergir� uma imprensa feminina, editada, escrita e dirigida por e para mulheres. \r\nABRANTES, A. Do �lbum de fam�lia � vitrine impressa: trajetos de retratos (PB, 1920), Revista Temas em Educa��o, n. 24, 2015 (adaptado). \r\nO registro das atividades descritas associa a inser��o da figura feminina nos espa�os de leitura e escrita do Segundo Reinado ao(�): \r\n', 2022, 'a', 5, 1),
('Os caixeiros do com�rcio a retalho do Rio de Janeiro estiveram entre as primeiras categorias de trabalhadores a se organizar em associa��es e a exigir a interven��o dos poderes p�blicos na media��o de suas lutas por direitos. Na d�cada de 1880, os caixeiros participaram da arena pol�tica e ganharam as ruas com v�rios outros, como os republicanos e os abolicionistas.\r\nPOPINIGIS, F. �Todas as liberdades s�o irm�s�: os caixeiros e as lutas dos trabalhadores por direitos entre o Imp�rio e a Rep�blica. Estudos Hist�ricos, n. 59, set.-dez. 2016 (adaptado).\r\nA atua��o dos trabalhadores mencionados no texto representou, na capital do Imp�rio, um momento de:\r\n', 2022, 'e', 5, 1),
('Solos salinos ou alom�rficos apresentam como caracter�stica comum uma concentra��o muito alta de sais sol�veis e/ou de s�dio troc�vel. Eles ocorrem nos locais mais baixos do relevo, em regi�es �ridas e semi�ridas e pr�ximas do mar. Em regi�es semi�ridas, por exemplo, o pol�gono das secas do Nordeste brasileiro, os locais menos elevados recebem �gua que se escoa dos declives adjacentes, durante as chuvas que caem em alguns meses do ano. Essa �gua traz solu��es de sais minerais e evapora-se rapidamente antes de infiltrar-se totalmente, havendo ent�o, cada vez que esse processo � repetido, um pequeno ac�mulo de sais no horizonte superficial que, com o passar dos anos, provoca a saliniza��o do solo. Nas �ltimas d�cadas, a expans�o das atividades agr�colas na regi�o tem ampliado esse processo.\r\nLEPSCH, I. F. Solos: forma��o e conserva��o. S�o Paulo: Melhoramentos, 1993 (adaptado). \r\nAs atividades agr�colas, desenvolvidas na regi�o mencionada, intensificam o problema ambiental exposto ao: \r\n', 2022, 'e', 5, 1),
('� como se os problemas fossem criados pela pandemia quando, em verdade, isso s� demonstra o quanto eles sofrem uma tentativa de serem naturalizados. Eles estavam l�, empurrados para debaixo de v�rios tapetes. Diversos levantamentos realizados indicam que parcela significativa dos estudantes n�o t�m acesso � internet em suas casas, n�o t�m computadores; t�m celulares, mas com pacotes baratos que n�o permitem assistir a todas as aulas. E, caso tenham celulares e dados, pergunta-se: � poss�vel elaborar um texto no celular? � poss�vel interagir na aula remota pelo celular? \r\nASSIS, A. E. S. Q. Educa��o e pandemia. Educa��o em Revista, n. 37, 2021 (adaptado). \r\nA cr�tica contida no texto e na figura evidencia o seguinte aspecto da sociedade contempor�nea: \r\n', 2022, 'b', 5, 1),
('O leproso � visto dentro de uma pr�tica da rejei��o, do ex�lio-cerca; deixa-se que se perca l� dentro como numa massa que n�o tem muita import�ncia diferenciar; os pestilentos s�o considerados num policiamento t�tico meticuloso onde as diferencia��es individuais s�o os efeitos limitantes de um poder que se multiplica, se articula e se subdivide. O grande fechamento por um lado; o bom treinamento por outro. A lepra e sua divis�o; a peste e seus recortes. Uma � marcada; a outra, analisada e repartida. O ex�lio do leproso e a pris�o da peste n�o trazem consigo o mesmo sonho pol�tico. \r\nFOUCAULT, M. Vigiar e punir: nascimento da pris�o. Petr�polis: Vozes, 1987. \r\nOs modelos autorit�rios descritos no texto apontam para um sistema de controle que se baseia no(a): \r\n', 2022, 'a', 5, 1),
('TEXTO I \r\nEm mar�o de 1889, quando apareceram as primeiras romarias atra�das pelos milagres da beata Maria de Ara�jo, Juazeiro inseriu-se no rol da funda��o do espa�o religioso. Constru�a-se mais um centro, como Aparecida do Norte, Canind� ou Lourdes. \r\nRAMOS, F. R. L. O meio do mundo: territ�rio sagrado em Juazeiro do Padre C�cero. Fortaleza: Imprensa Universit�ria, 2014\r\nTEXTO II\r\nN�o sabemos ao certo quantas pessoas estavam presentes na capela no momento em que a h�stia sangrou na boca de Maria de Ara�jo. O Padre C�cero nos conta que o fato surpreendeu n�o s� aos presentes, mas a pr�pria beata parecia atordoada com o ocorrido. O fen�meno continuou acontecendo todas as quartas e sextas na Capela de Nossa Senhora das Dores a partir daquele dia. Os paninhos manchados do sangue que escorria da h�stia e da boca da beata, a princ�pio, ficaram sob a guarda do Padre C�cero, mas logo foram expostos � visita��o p�blica e, al�m disso, o sangramento foi proclamado como milagre sem o conhecimento e sem a autoriza��o do bispo diocesano. \r\nNOBRE, E. Inc�ndios da alma. Rio de Janeiro: Multifoco, 2016 (adaptado). \r\nAs pr�ticas religiosas mencionadas nos textos est�o associadas, respectivamente, �: \r\n', 2022, 'a', 5, 1);

--Selecionando e mostrando todas as Quest�es cadastradas
select * from Questoes;


--Inserindo as liga��es de N para N entre as tabelas Quest�es e Disciplinas
insert into Disciplinas_Questoes (ID_Questao, ID_Disciplina) values
(1, 15),
(2, 16),
(3, 16),
(4, 16),
(5, 16),
(6, 16),
(7, 15),
(8, 15),
(9, 15),
(10, 15),
(11, 5),
(12, 12),
(13, 8),
(14, 5),
(15, 8),
(16, 8),
(17, 5),
(18, 4),
(19, 4),
(20, 5),
(21, 8),
(22, 8);

--Mostrando todas as liga��es entre as tabelas citadas
select * from Disciplinas_Questoes order by ID_Questao;


--Inserindo os caminhos das Imagens nas Quest�es que possuem
insert into Imagens_Questoes (Caminho_Imagem, ID_Questao) values
('img1-enem-questao2.png', 2),
('img1-enem-questao3.png', 3),
('img1-enem-questao4.png', 4),
('img1-enem-questao5.png', 5),
('img1-enem-questao6.png', 6),
('img1-enem-questao7.png', 7),
('img1-enem-questao8.png', 8),
('img1-enem-questao9.png', 9),
('img2-enem-questao9.png', 9),
('img1-enem-questao10.png', 10),
('img1-enem-questao11.png', 11),
('img1-enem-questao12.png', 12),
('img1-enem-questao13.png', 13),
('img1-enem-questao14.png', 14),
('img2-enem-questao14.png', 14),
('img1-enem-questao15.png', 15),
('img1-enem-questao16.png', 16),
('img1-enem-questao17.png', 17),
('img1-enem-questao18.png', 18),
('img1-enem-questao19.png', 19),
('img1-enem-questao20.png', 20),
('img1-enem-questao21.png', 21),
('img2-enem-questao21.png', 21),
('img3-enem-questao21.png', 21);

--Mostrando todos os caminhos das Imagens cadastradas
select * from Imagens_Questoes;


--Inserindo as Alternativas das Quest�es cadastradas
insert into Alternativas (ID_Questao, Texto_Alternativa, Alternativa, Tipo) values
(1, 'qualidade da educa��o formal em Miami. ', 'a', 'Texto'),
(1, 'prest�gio da cultura cubana nos Estados Unidos.', 'b', 'Texto'),
(1, 'oportunidade de qualifica��o profissional em Miami. ', 'c', 'Texto'),
(1, 'cen�rio da integra��o de cubanos nos Estados Unidos. ', 'd', 'Texto'),
(1, 'fortalecimento do elo familiar em comunidades estadunidenses.', 'e', 'Texto'),
(2, 'difundir a arte iconogr�fica ind�gena mexicana. ', 'a', 'Texto'),
(2, 'resgatar a literatura popular produzida em l�ngua zapoteca. ', 'b', 'Texto'),
(2, 'questionar o conhecimento do povo mexicano sobre as l�nguas amer�ndias. ', 'c', 'Texto'),
(2, 'destacar o papel dos �rg�os governamentais na conserva��o das l�nguas no M�xico. ', 'd', 'Texto'),
(2, 'defender a preserva��o das l�nguas origin�rias garantindo a diversidade lingu�stica mexicana.', 'e', 'Texto'),
(3, 'conhecimento das pessoas sobre as tecnologias. ', 'a', 'Texto'),
(3, 'uso do celular alheio por pessoas desautorizadas. ', 'b', 'Texto'),
(3, 'funcionamento de recursos tecnol�gicos obsoletos. ', 'c', 'Texto'),
(3, 'inger�ncia do celular sobre as escolhas dos usu�rios. ', 'd', 'Texto'),
(3, 'falta de informa��o sobre a configura��o de alertas no celular.', 'e', 'Texto'),
(4, 'das peculiaridades dos sub�rbios hispano-americanos.', 'a', 'Texto'),
(4, 'da for�a da conex�o espiritual entre os amigos.', 'b', 'Texto'),
(4, 'do papel da amizade em diferentes contextos. ', 'c', 'Texto'),
(4, 'do h�bito de reunir amigos em torno da mesa. ', 'd', 'Texto'),
(4, 'dos graus de intimidade entre os amigos.', 'e', 'Texto'),
(5, 'evidenciar a import�ncia de uma rede de apoio para as m�es na cria��o de seus filhos. ', 'a', 'Texto'),
(5, 'denunciar a disparidade entre o trabalho das m�es de diferentes classes sociais. ', 'b', 'Texto'),
(5, 'ressaltar o fechamento de escolas e creches durante o per�odo pand�mico. ', 'c', 'Texto'),
(5, 'ratificar a romantiza��o da dedica��o das m�es na educa��o das crian�as. ', 'd', 'Texto'),
(5, 'enfatizar a prote��o aos filhos em raz�o do isolamento social das fam�lias.', 'e', 'Texto'),
(6, 'problematizar o papel de g�nero em casamentos modernos.', 'a', 'Texto'),
(6, 'apontar a relev�ncia da educa��o formal na escolha de parceiros.', 'b', 'Texto'),
(6, 'comparar a expectativa de parceiros amorosos em �pocas distintas.', 'c', 'Texto'),
(6, 'discutir o uso de aplicativos para proporcionar encontros rom�nticos.', 'd', 'Texto'),
(6, 'valorizar a import�ncia da apar�ncia f�sica na sele��o de pretendentes', 'e', 'Texto'),
(7, 'revolta com a falta de sorte. ', 'a', 'Texto'),
(7, 'gosto pela pr�tica da leitura. ', 'b', 'Texto'),
(7, 'receio pelo futuro do casamento.', 'c', 'Texto'),
(7, 'entusiasmo com os livros de terror. ', 'd', 'Texto'),
(7, 'rejei��o ao novo tipo de resid�ncia.', 'e', 'Texto'),
(8, 'oferecer recursos de fotografia. ', 'a', 'Texto'),
(8, 'divulgar problemas dos usu�rios. ', 'b', 'Texto'),
(8, 'estimular aceita��o dos seguidores. ', 'c', 'Texto'),
(8, 'provocar ansiedade nos adolescentes. ', 'd', 'Texto'),
(8, 'aproximar pessoas ao redor do mundo.', 'e', 'Texto'),
(9, 'contentamento com a intera��o virtual. ', 'a', 'Texto'),
(9, 'zelo com o envio de mensagens. ', 'b', 'Texto'),
(9, 'preocupa��o com a composi��o de textos. ', 'c', 'Texto'),
(9, 'm�goa com o comportamento de algu�m. ', 'd', 'Texto'),
(9, 'insatisfa��o com uma forma de comunica��o.', 'e', 'Texto'),
(10, 'afeito � devo��o ao aceitar destinos sacralizados. ', 'a', 'Texto'),
(10, 'acostumado � pobreza ao admitir acasos naturais. ', 'b', 'Texto'),
(10, 'habituado ao solo ao conhecer terrenos cultiv�veis.', 'c', 'Texto'),
(10, '�ntimo � Caatinga ao interpretar condi��es ambientais. ', 'd', 'Texto'),
(10, 'pr�ximo � vegeta��o ao identificar esp�cies arbustivas.', 'e', 'Texto'),
(11, 'entendimento da cultura.', 'a', 'Texto'),
(11, 'aumento da criatividade.', 'b', 'Texto'),
(11, 'percep��o da individualidade.', 'c', 'Texto'),
(11, 'melhoria da t�cnica.', 'd', 'Texto'),
(11, 'constru��o da sociabilidade.', 'e', 'Texto'),
(12, 'Racismo estrutural. ', 'a', 'Texto'),
(12, 'Desemprego latente. ', 'b', 'Texto'),
(12, 'Concentra��o de renda. ', 'c', 'Texto'),
(12, 'Exclus�o informacional. ', 'd', 'Texto'),
(12, 'Precariedade da educa��o.', 'e', 'Texto'),
(13, 'n�vel altim�trico. ', 'a', 'Texto'),
(13, 'ciclo hidrol�gico. ', 'b', 'Texto'),
(13, 'padr�o clim�tico.', 'c', 'Texto'),
(13, 'tect�nica de placas. ', 'd', 'Texto'),
(13, 'estrutura das rochas.', 'e', 'Texto'),
(14, 'discrep�ncia entre engenharia ambiental e equil�brio da fauna. ', 'a', 'Texto'),
(14, 'incoer�ncia entre maquinaria estrangeira e controle da floresta. ', 'b', 'Texto'),
(14, 'incompatibilidade entre investimento estatal e prote��o aos nativos. ', 'c', 'Texto'),
(14, 'competi��o entre farmacologia internacional e produtos da fitoterapia. ', 'd', 'Texto'),
(14, 'contradi��o entre desenvolvimento nacional e respeito aos trabalhadores.', 'e', 'Texto'),
(15, 'Fabrica��o em s�rie. ', 'a', 'Texto'),
(15, 'Amplia��o de estoques. ', 'b', 'Texto'),
(15, 'Fragiliza��o dos cart�is. ', 'c', 'Texto'),
(15, 'Padroniza��o de mercadorias.', 'd', 'Texto'),
(15, 'Desterritorializa��o da produ��o.', 'e', 'Texto'),
(16, 'fornecer a m�o de obra qualificada. ', 'a', 'Texto'),
(16, 'incorporar a inova��o tecnol�gica.', 'b', 'Texto'),
(16, 'preservar a diversidade biol�gica. ', 'c', 'Texto'),
(16, 'promover a produ��o alimentar. ', 'd', 'Texto'),
(16, 'garantir a moradia b�sica.', 'e', 'Texto'),
(17, 'surgimento de novas pr�ticas culturais. ', 'a', 'Texto'),
(17, 'contesta��o de antigos h�bitos masculinos. ', 'b', 'Texto'),
(17, 'valoriza��o de recentes publica��es juvenis. ', 'c', 'Texto'),
(17, 'circula��o de variados manuais pedag�gicos. ', 'd', 'Texto'),
(17, 'aparecimento de diversas editoras comerciais.', 'e', 'Texto'),
(18, 'manuten��o das regras patronais.', 'a', 'Texto'),
(18, 'desprendimento das ideias liberais.', 'b', 'Texto'),
(18, 'fortalecimento dos contratos laborais.', 'c', 'Texto'),
(18, 'consolida��o das estruturas sindicais.', 'd', 'Texto'),
(18, 'contesta��o dos princ�pios mon�rquicos. ', 'e', 'Texto'),
(19, 'realizar florestamentos de pinus, desrespeitando a pr�tica do pousio. ', 'a', 'Texto'),
(19, 'utilizar sistemas de irriga��o, desprezando uma drenagem adequada. ', 'b', 'Texto'),
(19, 'instalar a�udes nos grot�es, retardando a velocidade da vaz�o fluvial. ', 'c', 'Texto'),
(19, 'desmatar �reas de preserva��o permanente, causando assoreamento. ', 'd', 'Texto'),
(19, 'aplicar fertilizantes de origem org�nica, modificando a qu�mica da terra.', 'e', 'Texto'),
(20, 'Exclus�o social. ', 'a', 'Texto'),
(20, 'Expans�o digital. ', 'b', 'Texto'),
(20, 'Manifesta��o cultural. ', 'c', 'Texto'),
(20, 'Organiza��o espacial. ', 'd', 'Texto'),
(20, 'Valoriza��o intelectual.', 'e', 'Texto'),
(21, 'Forma��o de sociedade disciplinar. ', 'a', 'Texto'),
(21, 'Flexibiliza��o do regramento social. ', 'b', 'Texto'),
(21, 'Banimento da autoridade repressora. ', 'c', 'Texto'),
(21, 'Condena��o da degrada��o humana. ', 'd', 'Texto'),
(21, 'Hierarquiza��o da burocracia estatal.', 'e', 'Texto'),
(22, 'img-alternativa-a-22', 'a', 'Imagem'),
(22, 'img-alternativa-b-22', 'b', 'Imagem'),
(22, 'img-alternativa-c-22', 'c', 'Imagem'),
(22, 'img-alternativa-d-22', 'd', 'Imagem'),
(22, 'img-alternativa-e-22', 'e', 'Imagem');

--Selecionando e mostrando todas as Alternativas cadastradas
select * from Alternativas;


--Inserindo dados na tabela Historico_Operacoes
insert into Historico_Operacoes (Descricao_Operacao, Dt_Operacao, ID_Usuario) values
('Cadastro de Quest�o - ID_Questao: 1', '2024-05-23 19:49:00', 4),
('Altera��o de Quest�o - ID_Questao: 1', '2024-05-23 19:55:00', 4),
('Banimento de Usu�rio - ID_Usuario: 14', '2024-05-23 20:00:00', 4),
('Anula��o do banimento de Usu�rio - ID_Usuario: 14', '2024-05-23 20:07:00', 4),
('Banimento de Usu�rio - ID_Usuario: 14', '2024-05-23 20:08:00', 4),
('Altera��o de Niv�l de Usu�rio para Corretor - ID_Usuario: 3', '2024-05-23 20:10:00', 5),
('Cadastro de Quest�o - ID_Questao: 2', '2024-05-24 19:51:00', 8),
('Altera��o de Quest�o - ID_Questao: 2', '2024-05-24 19:52:00', 8),
('Exclus�o de Questao - ID_Questao: 2', '2024-05-24 19:59:00', 8),
('Banimento de Usu�rio - ID_Usuario: 15', '2024-05-24 20:01:00', 8),
('Anula��o do banimento de Usu�rio - ID_Usuario: 15', '2024-05-24 20:04:00', 8),
('Altera��o de Niv�l de Usu�rio para ADM - ID_Usuario: 8', '2024-05-24 20:10:00', 5),
('Cadastro de Quest�o - ID_Questao: 3', '2024-05-24 20:15:00', 4),
('Altera��o de Quest�o - ID_Questao: 3', '2024-05-24 20:16:00', 4),
('Banimento de Usu�rio - ID_Usuario: 25', '2024-05-24 20:20:00', 4),
('Anula��o do banimento de Usu�rio - ID_Usuario: 25', '2024-05-24 20:27:00', 4),
('Altera��o de Niv�l de Usu�rio para Corretor - ID_Usuario: 9', '2024-05-24 20:28:00', 5),
('Cadastro de Quest�o - ID_Questao: 23', '2024-05-24 20:42:00', 4),
('Altera��o de Quest�o - ID_Questao: 23', '2024-05-24 20:43:00', 4),
('Exclus�o de Questao - ID_Questao: 23', '2024-05-24 20:45:00', 4),
('Banimento de Usu�rio - ID_Usuario: 10', '2024-05-24 20:50:00', 4),
('Anula��o do banimento de Usu�rio - ID_Usuario: 10', '2024-05-24 20:55:00', 4),
('Altera��o de Niv�l de Usu�rio para Professor - ID_Usuario: 7', '2024-05-24 21:10:00', 5);

--Selecionando e mostrando os Hist�rico de Opera��es
select * from Historico_Operacoes;


--Inserindo as informa��es do site
--Nota: Nessa tabela foi pensado em inserir somente um �nico registro, que ser� ele alterado conforme o tempo, caso seja necess�rio, porque mudou alguma coisa que seja relevante mostrar na apresenta��o do site.
insert into Informacoes_Site (Texto_Apresentacao, Dt_Alteracao, ID_ADM) values
('Tendo em vista que o Enem cobra o conte�do dos tr�s anos do ensino m�dio, o grau de dificuldade para alunos que acabaram de terminar os estudos.....', '2024-05-24', 5);

--Selecionando e mostrando o unico registro das informa��es do site
select * from Informacoes_Site;

--Inserindo os caminhos das imagens que aparecer�o durante a apresenta��o do site na tabela Imagens_Site
insert into Imagens_Site (Caminho_Imagem, ID_Informacao) values
('img-apresentacaosite1.png', 1),
('img-apresentacaosite2.png', 1),
('img-apresentacaosite3.png', 1),
('img-apresentacaosite4.png', 1),
('img-apresentacaosite5.png', 1),
('img-apresentacaosite6.png', 1),
('img-apresentacaosite7.png', 1),
('img-apresentacaosite8.png', 1),
('img-apresentacaosite9.png', 1),
('img-apresentacaosite10.png', 1),
('img-apresentacaosite11.png', 1),
('img-apresentacaosite12.png', 1),
('img-apresentacaosite13.png', 1),
('img-apresentacaosite14.png', 1),
('img-apresentacaosite15.png', 1),
('img-apresentacaosite16.png', 1),
('img-apresentacaosite17.png', 1),
('img-apresentacaosite18.png', 1),
('img-apresentacaosite19.png', 1),
('img-apresentacaosite20.png', 1),
('img-apresentacaosite21.png', 1),
('img-apresentacaosite22.png', 1);

--Selecionando e mostrando os caminhos das imagens a serem utilizadas durante a apresenta��o
select * from Imagens_Site;

--Inserindo dados na tabela Hist�rico_Simulados
insert into Historico_Simulados values
('2024-04-20 08:06:00', 20, 20, 15, 2.5, 1),
('2024-04-20 09:01:00', 15, 60, 14, 2.6, 2),
('2024-04-21 10:27:00', 24, 80, 25, 1.5, 10),
('2024-04-22 11:15:00', 27, 14, 25, 2.5, 11),
('2024-04-23 12:45:00', 30, 26, 16, 2.3, 14),
('2024-04-24 13:14:00', 12, 23, 25, 1.57, 15),
('2024-04-25 14:12:00', 6, 14, 25, 1.5, 16),
('2024-05-15 00:19:00', 14, 20, 23, 2.5, 17),
('2024-05-15 01:48:00', 15, 60, 25, 3.5, 18),
('2024-05-15 02:24:00', 20, 12, 14, 1.5, 19),
('2024-05-18 03:27:00', 26, 15, 25, 4.5, 20),
('2024-05-18 04:57:00', 14, 18, 56, 2.5, 21),
('2024-05-19 05:17:00', 23, 21, 25, 2.5, 22),
('2024-05-19 06:45:00', 18, 27, 17, 3.6, 23),
('2024-05-20 07:15:00', 18, 28, 25, 2.5, 24),
('2024-05-21 08:30:00', 46, 30, 25, 2.12, 25),
('2024-05-22 09:29:00', 100, 30, 19, 2.5, 26),
('2024-05-23 10:48:00', 140, 40, 25, 2.14, 27),
('2024-05-24 11:54:00', 100, 26, 25, 2.5, 28),
('2024-05-25 20:42:00', 21, 12, 23, 2.01, 28);

--Selecionando e mostrando o Hist�rico de Simulados
select * from Historico_Simulados;


--Inserindo os dados do relacionamento N para N entre as tabelas Historico_Simulados e Questoes na tabela HistoricoSimulados_Questoes
insert into HistoricoSimulados_Questoes values
(2, 1, 'a'), (2, 2, 'b'), (2, 3, 'c'), (2, 4, 'd'), (2, 5, 'e'),
(3, 6, 'a'), (3, 7, 'a'), (3, 8, 'c'), (3, 9, 'd'), (3, 10, 'b'), (3, 11, 'e'),
(4, 12, 'e'), (4, 13, 'd'), (4, 14, 'c'), (4, 15, 'b'), (4, 16, 'a'),
(5, 17, 'd'), (5, 18, 'b'), (5, 19, 'e'), (5, 20, 'c'), (5, 21, 'a'), (5, 22, 'b'),
(6, 1, 'a'), (6, 2, 'b'), (6, 3, 'c'), (6, 4, 'd'), (6, 5, 'e'),
(7, 6, 'e'), (7, 7, 'a'), (7, 8, 'b'), (7, 9, 'c'), (7, 10, 'd'),
(8, 12, 'd'), (8, 13, 'c'), (8, 18, 'b'), (8, 15, 'a'), (8, 16, 'a'),
(9, 17, 'b'), (9, 18, 'b'), (9, 19, 'c'), (9, 20, 'a'), (9, 21, 'd'), (9, 22, 'd'),
(10, 1, 'a'), (10, 2, 'b'), (10, 3, 'c'), (10, 4, 'd'), (10, 5, 'e'),
(11, 1, 'e'), (11, 2, 'd'), (11, 3, 'b'), (11, 4, 'a'), (11, 6, 'c'), (11, 7, 'd'), (11, 11, 'e'), (11, 15, 'e'), (11, 16, 'd'),
(12, 3, 'd'), (12, 4, 'c'), (12, 5, 'e'), (12, 6, 'd'), (12, 7, 'c'),
(13, 1, 'a'), (13, 2, 'b'), (13, 3, 'c'), (13, 4, 'd'), (13, 5, 'e'),
(14, 1, 'e'), (14, 2, 'd'), (14, 3, 'c'), (14, 4, 'b'), (14, 5, 'a'),
(15, 1, 'c'), (15, 2, 'a'), (15, 3, 'd'), (15, 4, 'e'), (15, 5, 'b'),
(16, 1, 'c'), (16, 2, 'd'), (16, 3, 'e'), (16, 4, 'b'), (16, 5, 'a'),
(17, 1, 'd'), (17, 2, 'e'), (17, 3, 'd'), (17, 4, 'c'), (17, 5, 'b'),
(18, 1, 'e'), (18, 2, 'c'), (18, 3, 'c'), (18, 4, 'd'), (18, 5, 'c'),
(19, 1, 'c'), (19, 2, 'd'), (19, 3, 'b'), (19, 4, 'e'), (19, 5, 'd'),
(20, 1, 'a'), (20, 2, 'e'), (20, 3, 'a'), (20, 4, 'a'), (20, 5, 'e'),
(1, 1, 'e'), (1, 2, 'b'), (1, 3, 'e'), (1, 4, 'b'), (1, 5, 'a');

--Selecionado e mostrando as rela��es das tabelas citadas
select * from HistoricoSimulados_Questoes;


--Inserindo dados na tabela Simulados_Salvos
insert into Simulados_Salvos values
('2024-04-20 08:06:00', 'Teste 123', 'Todos', 'Finalizado', 1),
('2024-04-20 09:01:00', 'Biologia', 'Somente eu', 'Em andamento', 1),
('2024-04-21 10:27:00', 'Teste 1', 'Todos', 'Finalizado', 2),
('2024-04-22 11:15:00', 'Quest�es de Sociologia', 'Somente eu', 'Em andamento', 2),
('2024-04-23 12:45:00', 'Teste 2', 'Todos', 'Finalizado', 2),
('2024-04-24 13:14:00', 'Prova a ser aplicada', 'Somente eu', 'Finalizado', 10),
('2024-04-25 14:12:00', 'Teste 3', 'Todos', 'Finalizado', 10),
('2024-05-15 00:19:00', 'Meu simulado', 'Somente eu', 'Em andamento', 17),
('2024-05-15 01:48:00', 'Simulado  dahorinha', 'Somente eu', 'Em andamento', 17),
('2024-05-15 02:24:00', 'Meu simulado 1', 'Todos', 'Finalizado', 17),
('2024-05-18 04:57:00', 'Treinamento para o enem', 'Todos', 'Finalizado', 10),
('2024-05-19 05:17:00', 'Top de linha', 'Somente eu', 'Em andamento', 24),
('2024-05-19 06:45:00', 'Teste 123', 'Todos', 'Finalizado', 24),
('2024-05-20 07:15:00', 'Geografia', 'Somente eu', 'Em andamento', 27),
('2024-05-21 08:30:00', 'Biologia', 'Somente eu', 'Finalizado', 27),
('2024-05-22 09:29:00', 'Teste 4', 'Todos', 'Finalizado', 28),
('2024-05-23 10:48:00', 'Teste 5', 'Todos', 'Finalizado', 28),
('2024-05-24 11:54:00', 'Teste 6', 'Todos', 'Finalizado', 23),
('2024-05-25 20:42:00', 'Hist�ria', 'Somente eu', 'Em andamento', 22),
('2024-05-18 04:57:00', 'Treinamento para a Fatec', 'Somente eu', 'Em andamento', 10);

--Selecionando e mostrando o Hist�rico de Simulados
select * from Simulados_Salvos;


--Inserindo os dados do relacionamento N para N entre as tabelas Simulados_Salvos e Questoes na tabela SimuladosSalvos_Questoes
insert into SimuladosSalvos_Questoes values
(2, 1, 'a'), (2, 2, 'b'), (2, 3, 'c'), (2, 4, 'd'), (2, 5, 'e'),
(3, 6, 'Nenhuma'), (3, 7, 'a'), (3, 8, 'c'), (3, 9, 'd'), (3, 10, 'b'), (3, 11, 'e'),
(4, 12, 'e'), (4, 13, 'd'), (4, 14, 'c'), (4, 15, 'b'), (4, 16, 'a'),
(5, 17, 'd'), (5, 18, 'Nenhuma'), (5, 19, 'e'), (5, 20, 'c'), (5, 21, 'a'), (5, 22, 'b'),
(6, 1, 'a'), (6, 2, 'b'), (6, 3, 'c'), (6, 4, 'd'), (6, 5, 'e'),
(7, 6, 'e'), (7, 7, 'a'), (7, 8, 'b'), (7, 9, 'c'), (7, 10, 'd'),
(8, 12, 'Nenhuma'), (8, 13, 'Nenhuma'), (8, 18, 'Nenhuma'), (8, 15, 'Nenhuma'), (8, 16, 'Nenhuma'),
(9, 17, 'b'), (9, 18, 'b'), (9, 19, 'c'), (9, 20, 'a'), (9, 21, 'd'), (9, 22, 'd'),
(10, 1, 'a'), (10, 2, 'Nenhuma'), (10, 3, 'c'), (10, 4, 'd'), (10, 5, 'e'),
(11, 1, 'Nenhuma'), (11, 2, 'd'), (11, 3, 'b'), (11, 4, 'a'), (11, 6, 'c'), (11, 7, 'd'), (11, 11, 'e'), (11, 15, 'Nenhuma'), (11, 16, 'Nenhuma'),
(12, 3, 'd'), (12, 4, 'c'), (12, 5, 'e'), (12, 6, 'd'), (12, 7, 'c'),
(13, 1, 'a'), (13, 2, 'b'), (13, 3, 'c'), (13, 4, 'd'), (13, 5, 'e'),
(14, 1, 'e'), (14, 2, 'Nenhuma'), (14, 3, 'c'), (14, 4, 'b'), (14, 5, 'a'),
(15, 1, 'c'), (15, 2, 'a'), (15, 3, 'd'), (15, 4, 'e'), (15, 5, 'b'),
(16, 1, 'c'), (16, 2, 'd'), (16, 3, 'e'), (16, 4, 'b'), (16, 5, 'a'),
(17, 1, 'd'), (17, 2, 'e'), (17, 3, 'd'), (17, 4, 'c'), (17, 5, 'b'),
(18, 1, 'e'), (18, 2, 'c'), (18, 3, 'c'), (18, 4, 'd'), (18, 5, 'c'),
(19, 1, 'c'), (19, 2, 'd'), (19, 3, 'b'), (19, 4, 'e'), (19, 5, 'd'),
(20, 1, 'a'), (20, 2, 'e'), (20, 3, 'a'), (20, 4, 'a'), (20, 5, 'e'),
(1, 1, 'e'), (1, 2, 'b'), (1, 3, 'e'), (1, 4, 'b'), (1, 5, 'a');

--Selecionando e mostrando as rela��es entre as tabelas citadas
select * from SimuladosSalvos_Questoes;


--- >>>>>> Execu��o do CRUD nas tabelas do BD <<<<<< ---

--- Crud - Inser��o de dados na tabela Usuarios
--- Inserindo tr�s usu�rios diferentes com todos os atributos
insert into Usuarios values
('Deivid', 'deivid@gmail.com', 'deivid321', '1999-09-30', 'Ativo', 'Aluno'),
('Guilherme', 'guilherme@gmail.com', 'guilherme654', '2002-05-14', 'Ativo', 'Professor'),
('Fabio', 'fabio@gmail.com', 'fabio789', '1963-12-24', 'Ativo', 'Corretor');

--- Exibindo resultado:
select * from Usuarios;

--- Inserindo uma nova Quest�o com as suas Alternativas
insert into Questoes values ('Quest�o teste 123', 2024, 'a', 5, 1);

--- Exibindo resultado:
select * from Questoes;

insert into Alternativas values 
('a', 'Texto a', 'Texto', 23),
('b', 'Texto da alternativa b', 'Texto', 23),
('c', 'Texto c', 'Texto', 23),
('d', 'Texto d de dado', 'Texto', 23),
('e', 'Texto e de enegumeno', 'Texto', 23);

--- Exibindo resultado:
select * from Alternativas where ID_Questao = 23;

--- cRud - Leitura de dados
--- Lendo os atributos Comentario, Data, Nota e ID do Usuario de todos os registros da tabela Avaliacoes dos Usu�rios
select Comentario_Avaliacao, Dt_Avaliacao, Nota_Avaliacao, ID_Avaliacao from Avaliacoes;


--- crUd - Altera��o de Dados
--- Alterando o Nome e a Visualiza��o de um simulado, cuja o c�digo � 15, salvo por um usu�rio
update Simulados_Salvos set Nome_Simulado = 'Quest�es de Humanas da UNESP', Visualiizacao = 'Todos' where ID_SimuladoSalvo = 15;

--- Exibindo resultado:
select * from Simulados_Salvos;

--- cruD - Dele��o de Dados
--- Deletando a Quest�o e as suas alternativas, cadastradas anteriormente, ID = 23;
delete Alternativas where ID_Questao = 23;

--- Exibindo resultado:
select * from Alternativas where ID_Questao = 23;

delete Questoes where ID_Questao = 23;

--- Exibindo resultado:
select * from Questoes;



--- >>>>>> Relat�rios de Sele��es com Filtros e Ordena��es <<<<<< ---

--- 1) Selecionando O Nome, N�vel e Data de Nascimento de todos os Usu�rios que s�o de um n�vel superior (Corretor, ADM e ADM Geral), come�ando pelos mais velhos de idade
select Nome_Usuario, Nivel_Usuario, Dt_Nascimento from Usuarios where (Nivel_Usuario = 'Corretor' or Nivel_Usuario = 'ADM' or Nivel_Usuario = 'ADM Geral') order by Dt_Nascimento;

--- 2) Selecionando o Nome, N�vel e Status de todos os Usu�rios que s�o Alunos e que n�o est�o banidos, come�ando pelos mais antigos de registro, ou seja, do ID menor pro maior
select Nome_Usuario, Nivel_Usuario, Status_Usuario from Usuarios where Nivel_Usuario = 'Aluno' and Status_Usuario != 'Banido' order by ID_Usuario;

--- 3) Selecionando todas as alternativas que pertencem a um quet�o, cuja o seu ID � 18
select * from Alternativas where ID_Questao = 18;

--- 4) Selecionando a alternativa C dessa mesma quest�o
select * from Alternativas where ID_Questao = 18 and Alternativa = 'c';

--- 5) Selecionando todas as reda��es de um usu�rio de c�digo = 11, ordenadas pela data de envio
select * from Redacoes where ID_Usuario = 11 order by Dt_Envio;

--- 6) Selecionando todas as corre��es da primeira reda��o exibida (ID = 19), caso haja - Nesse caso n�o ha nenhuma corre��o
select * from Correcoes_Redacoes where ID_Redacao = 19;

--- 7) Selecionando todos os ID's das quest�es que s�o de sociologia (ID = 8)
select * from Disciplinas_Questoes where ID_Disciplina = 8;

--- 8) Selecionando todas as opera��es efetuadas pelo usu�rio de ID = 8, ordenados pela opera��o mais recente
select * from Historico_Operacoes where ID_Usuario = 8 order by Dt_Operacao desc;

--- 9) Selecionando as quest�es que est�o salvas no simulado salvo de ID = 20
select * from SimuladosSalvos_Questoes where ID_SimuladoSalvo = 20;

--- 10) Selecionando as alternativas preenchidas pelo usu�rio desse mesmo simulado
select * from SimuladosSalvos_Questoes where ID_SimuladoSalvo = 20 and Alt_Selecionada != 'Nenhuma';