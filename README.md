# Modelagem Completa de Banco de Dados - Desenrola Vestibulares

Esse projeto foi criado afim de cumprir a avaliação final de Modelagem de Banco de dados, do curso DSM (Desenvolvimento de Software Multiplataforma) da Faculdade de Tecnologia FATEC Franca Dr. Thomaz Novelino. Nesse repositório esta contido toda a modelagem para a criação do banco de dados, desde o Modelo Conceitual até o Modelo Físico. Além de cumprir a avaliação, ele também será utilizado em um projeto particular (Desenrola Vestibulares), que em breve será criado e terá um repositório  também.


## 📄 1 - Descrição do Cenário

### Apresentação do Site:
Deve ser desenvolvido um banco de dados para um site que tem o intuito de ajudar alunos do ensino médio, ou pessoas de outras idades, a realizarem vestibulares para poderem entrarem nas faculdades que desejarem. Fazendo com que eles adquiriram resistência e resiliência, além de passarem a saber qual o conteúdo que exigido em cada vestibular, bem como o seu grau de dificuldade. Portanto, para o funcionamento completo do site, será necessário a criação de um banco de dados que possa abastecer o site com as informações necessárias.

Os vestibulares que o banco de dados deve suportar são diversos, como ENEM, Fatec, USP, entre outros. Por isso ele deve ser adaptado para suportar todos esses estilos de vestibulares, já que as disciplinas, quantidade de alternativas, quantidades de respostas e entre outros atributos, variam de cada um. Além disso, ele deve ser adaptado para as diversas funcionalidades do site.

Uma informação a saber antes de serrem apresentadas as funcionalidades, é que o site, obviamente, terá usuários, porém estes serão divididos em dois tipos, essa informação é apenas para contextualizar, ela tem ligação com o banco de dados, porém não tanto. Segue a frente eles e suas respectivas funções:  

**Alunos:** Poderão praticar simulados, escrever redações, consultar provas, questões, temas de redações e outras redações, salvar simulados, avaliar e entre outras funcionalidades;

**Professores:** Serão divididos em três níveis (Normal, Corretor, ADM e ADM Geral)

- Normal: Poderá fazer as mesmas funções que os alunos, porém eles poderão gerar desafios aos alunos, seja propondo temas de redações, ou mesmo montando simulados personalizados para eles realizarem, um professor com esse nível poderá se auto cadastrar, porém os outro dos demais níveis não, ou eles serão cadastrados por ADM’s ou serão professores normais que tiveram os seus níveis alterados;

- Corretor: Poderá somente corrigir as redações enviadas pelos alunos, poderá haver mais de um corretor no site;

- ADM: Esse nível terá a responsabilidade de navegar pelo site e observar se todas as coisas estão de acordo com o esperado, verificando se as funções estão funcionando corretamente, se os corretores estão corrigindo as redações, se os alunos, ou mesmo professores, não estão violando as diretrizes da comunidade, bem como analisar as avaliações dos usuários para ver o que pode ser melhorado. Ele também poderá banir ou excluir, usuários com um nível inferior ao dele. Além disso, ele terá a responsabilidade de manter o site atualizado, alterando as informações da página Index, cadastrar novas questões, ou mesmos novos vestibulares, bem como os temas de redações. Poderá haver mais de um ADM, e eles podem alterar o nível de outros usuários, mas não poderão subir o nível de um usuário para o seu nível, e um ADM não pode excluir ou banir outro de um mesmo nível.

- ADM Geral: Esse terá todos os poderes que um ADM possui, porém ele será o único que poderá excluir, alterar nível e banir qualquer usuário, exceto ele. Só deve haver somente um ADM Geral, e ele e nem nenhum outro usuário poderá exclui-lo. 

### Funcionalidades:
Segue logo abaixo as funcionalidades e suas informações relevantes que têm alguma relação com o banco de dados a ser criado:

- **Escolher Vestibular:** O usuário, em várias partes do site, seja ele professor ou aluno, poderá escolher qual dos vestibulares deseja praticar. Logo, se faz necessário que o banco de dados armazene os dados desses vestibulares, sendo eles: Nome, Data de implantação do vestibular, Unidade(s) de Ensino que o vestibular abrange, o Logo do Vestibular (será armazenado o caminho da imagem),  Descrição das regras gerais, Regras da redação (descrição, pontuação mínima e máxima, quantidade de caracteres mínima e máxima, se o título é obrigatório ou não), Quantos pontos vale cada pergunta e Qual a média de tempo esperada por pergunta.

- **Gerar Simulados:** Ao escolher qual o vestibular deseja praticar, o usuário terá a opção de gerar simulados personalizados para responder, podendo ele escolher quantas questões irá responder e de quais disciplinas. Sendo essas questões escolhidas e apresentadas aleatoriamente, de acordoo com as exigências do usuário. Para isso, se faz necessário armazenar as questões com os seus dados, sendo eles: Texto da questão; Alternativas (podem ser imagens ou textos), lembre-se que a quantidade de alternativas pode variar de acordo com o vestibular; Qual a alternativa correta; Caminho(s) da(s) imagem(s) (caso haja); Disciplina pertencente e Ano da Aplicação do vestibular o qual a questão pertence.

- **Salvar Simulados:** O usuário também pode salvar os simulados, caso deseje continuar depois, ou se desejar apresentá-lo a outros usuários do site. Logo, esse simulado deve ser salvo quando o usuário desejar, podendo ele deixar a sua visualização pública ou privada, já que alguns professores podem querer montar simulados para fazer com que os alunos realizem em sala de aula, além disso ele deve salvar as alternativas que o usuário selecionou de cada questão até o momento de salvar. Segue então os dados que devem ser armazenados dos simulados: Nome, Visualização (todos os usuários ou somente o que criou), Status (finalizado ou não), Questões pertencentes a ele (bem como as suas alternativas), Alternativas respondidas até o momento (com a resposta marcada, caso haja), o Usuário que o criou e a Data de quando foi salvo.

- **Histórico de Simulados:** Semelhante ao caso anterior, o site deve gerar e atualizar o histórico de simulados realizados (finalizados) pelo usuário, sendo os dados a serem armazenados: Pontuação, Precisão, Tempo gasto, Questões pertencentes (bem como as suas alternativas), o Usuário que o criou, Data e Hora (minutos) da finalização (será utilizado como nome ao exibir o histórico), Média de Tempo por pergunta.

- **Enviar Redações:** Outra funcionalidade será a de o usuário poder escrever uma redação e enviá-la para que um professor que tenha o nível de corretor possa corrigi-la, avaliá-la e pontuá-la, enviando-a de volta com alguns comentários. Vários professores podem corrigir a mesma redação e apresentarem feedbacks diferentes. Elas poderão ser enviadas através de textos padrões da web, ou por meio de documentos anexados (no caso será armazenado o caminho do documento no lugar do texto em si), elas também poderão ser visualizadas por outros usuários além do professor corretor, caso o usuário permita. Para isso, se faz necessário armazenar os seguintes dados: Redação Enviada (Texto ou Caminho do Arquivo), Escritor, Data de envio, Tema, Título (Caso o modelo de vestibular exigir), Modelo de Vestibular seguido e Visualização (todos os usuários ou somente o que criou).

  Caso a redação possuir alguma correção feita por um Corretor, ela deve armazenar os seguintes dados: Nota, Professor Corretor, Comentário da correção, Data da correção, Redação corrigida (pode ser em texto ou em arquivo, independente de como o aluno a enviou). Uma redação pode ter mais de uma correção feita por diferentes professores.

  Lembre-se as redações possuem regras elas variam de acordo com o modelo de vestibular seguido, logo é interessante armazenar também essas regras, que podem variar para cada vestibular. Os dados a serem armazenados são: Obrigatoriedade de Título (sim ou não), Quantidade Mínima e Máxima de caracteres e Descrição (um texto para explicar como funciona o modelo de redação).

- **Cadastrar Temas:** Todos os professores poderão castrar temas que inventarem, ou temas que caíram em vestibulares passados (nesse caso somente os professores de nível ADM e ADM Geral). Os alunos também poderão cadastrar temas inventados por eles, porém isso será feito de forma automática, ou seja, será feito quando eles escreverem uma redação e escolherem um tema que não esteja cadastrado, inserindo o seu tema e o enviando. Os dados a serem armazenados dos temas são: Tema, Origem (Professor, Aluno ou Vestibular), Criador (nome do professor, aluno ou vestibular que o criou) e Ano da criação/aplicação.

- **Auto Cadastro e Cadastro de Usuários:** Para que todo o site tenha um motivo para existir, é necessário que exista usuários para usá-lo. Sendo assim o site terá dois tipos de usuários citados anteriormente. Sendo assim, os dados a serem armazenados deles são: Nome, Email, Senha, Data de Nascimento, Idade, Nível do Usuário, Status (Ativo ou Banido).
Observação: Caso o usuário seja um aluno, o seu atributo nível será inserido como “aluno”.

- **Avaliações:** Os usuários do site poderão deixar a sua avaliação sobre o site, podendo deixar nelas uma nota de 0 a 10 e um comentário. A avaliação é opcional, usuários como Corretores e ADM’s, não poderão deixar as suas avaliações, pois não há motivos para isso, cada usuário poderá deixar somente uma avaliação, que pode ser alterada.

- **Informações do site:** Se faz necessário que haja uma área no banco de dados que armazene algumas informações do site que serão exibidas na página Index, podendo elas serem alteradas pelos ADM’s quando necessário. São elas: Apresentação/Descrição do site e imagens que aparecerão (podem ser várias), também é preciso registrar as alterações feitas ao longo do tempo, com a data, descrição da alteração e o ADM que alterou as informações.

- **Gerar Histórico de Ações:** O site deverá gerar um histórico de todas as ações feitas pelos usuários, para se ter um monitoramento. Para que isso seja feito, será necessário armazenar os seguintes dados: Descrição da Ação, Usuário que efetuou a ação e Data e Hora (minutos).
  
Essas são algumas das funções que o site executará, sendo elas as mais relevantes e as que têm alguma relação com o banco de dados a ser desenvolvido.

## 📋 2 - Modelagem Conceitual
<img src="/imagens/DER - Site Desenrola nos Vestibulares.jpg">


## 📋 3 - Modelagem Lógica
<img src="/imagens/Modelo Lógico - Desenrola Vestibulares.png">


## 🛠️ 4 - Modelagem Física
### Criação do BD e de suas Tabelas
```sql
--- >>>>>> Criação do Banco de Dados com as Suas tabelas <<<<<< ---

--Criando Banco de dados
create database DS_Vestibulares;

--Usuando o BD correto
use DS_Vestibulares;

--Criando a tabela Usuários
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


--Crando a tabela Histórico de Operações executadas pelos Usuários
create table Historico_Operacoes(
	ID_Operacao			int primary key identity,
	Descricao_Operacao	text	not null,
	Dt_Operacao			smalldatetime	not null,
	ID_Usuario			int		not null,
	foreign key(ID_Usuario) references Usuarios(ID_Usuario)
);


-- Criando tabela das Avaliações dos Usuários
create table Avaliacoes(
	ID_Avaliacao			int primary key identity,
	Comentario_Avaliacao	text	not null,
	Dt_Avaliacao			date	not null,
	Nota_Avaliacao			int		not null,
	ID_Usuario				int		not null unique,
	foreign key(ID_Usuario) references Usuarios(ID_Usuario)
);


--Criando tabela das informações do site
create table Informacoes_Site(
	ID_Informacao		int primary key identity,
	Texto_Apresentacao	text	not null,
	Dt_Alteracao		date	not null,
	ID_ADM				int		not null,
	foreign key(ID_ADM) references Usuarios(ID_Usuario)
);


--Criando tabela´para armazenar as imagens a serem mostradas na pagina index do site
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


--Criando tabela Temas de Redações
create table Temas_Redacoes(
	ID_Tema		int primary key identity,
	Tema		text		not null,
	Origem		varchar(15) not null,
	Ano_Tema	int			not null,
	ID_Origem	int			not null
);


--Criando tabela Redações
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


--Criando tabela Correções das Redações
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


--Criando tabela Questões
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


--Criando tabela para relacionamento N para N entre as tabelas Disciplinas e Questões
create table Disciplinas_Questoes(
	ID_Disciplina	int not null,
	ID_Questao		int not null,
	foreign key(ID_Questao)		references Questoes(ID_Questao),
	foreign key(ID_Disciplina)	references Disciplinas(ID_Disciplina),
	constraint PK_DisQues primary key (ID_Disciplina,ID_Questao)
);


--Criando tabela para as Imagens das Questões
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

	-- Campo derivado: Esse campo é derivado, pois será calculado mediante a divisão entre os Minutos_Gasto com Quantidade de Questões com o ID correspondente na tabela HistoricoSimulados_Questoes, esse calculo será feito no site antes da isenserção dos dados, logo na inserção da aivividade ele será iinserido normalmente.
	Minutos_Pergunta		float				not null, 

	ID_Usuario				int				not null,
	foreign key(ID_Usuario)		references Usuarios(ID_Usuario)
);


--Criando a tabela para o relacionamento N para N com as tabelas Historico_Simulados com as Questões
create table HistoricoSimulados_Questoes(
	ID_HistoricoSimulados	int			not null,
	ID_Questao				int			not null,
	Alt_Selecionada			varchar(2) not null,
	foreign key(ID_Questao)				references Questoes(ID_Questao),
	foreign key (ID_HistoricoSimulados)	references Historico_Simulados(ID_HistoricoSimulados),
	constraint PK_HistQues primary key (ID_HistoricoSimulados,ID_Questao)
);


--Criando tabela de Simulados Salvos pelo Usuário
create table Simulados_Salvos(
	ID_SimuladoSalvo	int primary key identity,
	Dt_Salvamento		smalldatetime	not null,
	Nome_Simulado		varchar(100)	not null,
	Visualiizacao		varchar(15)		not null,
	Status_Simulado		varchar(15)		not null,
	ID_Usuario			int				not null,
	foreign key(ID_Usuario)		references Usuarios(ID_Usuario)
);



--Criando a tabela para o relacionamento N para N com as tabelas Simulados_Salvos com as Questões
create table SimuladosSalvos_Questoes(
	ID_SimuladoSalvo	int not null,
	ID_Questao			int not null,
	Alt_Selecionada		varchar(10) not null,
	foreign key(ID_Questao)		references Questoes(ID_Questao),
	foreign key(ID_SimuladoSalvo)	references Simulados_Salvos(ID_SimuladoSalvo),
	constraint PK_SalvosQues primary key (ID_SimuladoSalvo,ID_Questao)
);
```

## 🔧 5 - Inserção de Dados
### Vinte Registros por Tabela
```sql
--- >>>>>> Inserção dos 20 Registros por Tabela <<<<<< ---

--Ajustando o formato da data para a iserção dos dados
SET DATEFORMAT ymd; 

--Inserindo Usuários na Tabela Usuarios
insert into Usuarios (Nome_Usuario, Email_Usuario, Senha_Usuario, Dt_Nascimento, Status_Usuario, Nivel_Usuario) values 
('Luis', 'luis@gmail.com', '123', '2006-02-23', 'Ativo', 'Aluno'),
('Pedro', 'pedro@gmail.com', '456', '2005-12-13', 'Ativo', 'Aluno'),
('Dutra', 'dutra@gmail.com', '789', '2001-01-16', 'Ativo', 'Corretor'),
('Carrocini', 'carrocini@gmail.com', '123456', '2000-12-18', 'Ativo', 'ADM'),
('Luís Pedro Dutra Carrocini', 'luiscarrocini@gmail.com', 'luispedrin123', '2006-02-23', 'Ativo', 'ADM Geral'),
('Ivanilde', 'ivanilde@gmail.com', 'ivan789', '1976-02-23', 'Ativo', 'Professor'),
('César', 'cesar@gmail.com', 'cesinha456', '1984-06-10', 'Ativo', 'Professor'),
('Antônio César', 'antonio@gmail.com', 'antonio789', '2001-01-16', 'Ativo', 'ADM'),
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

--Selecionando e mostrando todos os Usuários cadastrados
select * from Usuarios;


--Inserindo as Avaliações dos Usuários na tabela Avaliacoes
insert into Avaliacoes values
('Muito Bom', '2024-05-23', 10, 1),
('Muito Ruim', '2022-07-13', 5, 2),
('Procisa melhorar tal coisa', '2014-04-23', 6, 10),
('Otimo site para estudar pro ENEM', '2024-06-23', 7, 11),
('Me ajudou muito', '2024-12-23', 0, 12),
('Top de linha', '2020-05-23', 6, 13),
('Mió do mundo', '2021-02-23', 2, 14),
('Bom', '2023-06-27', 1, 15),
('Bão de mais da conta', '2009-02-14', 3, 16),
('Ai sim', '2020-05-23', 4, 17),
('Poderia criar tal funcionalidade', '2024-05-23', 5, 18),
('Só acho que...', '2023-05-23', 6, 19),
('O site ta muito lento', '2021-05-23', 7, 20),
('Sua ideia é boa', '2024-05-23', 8, 21),
('A intervace pode melhorar em tal coisa', '2024-02-23', 9, 22),
('Muito top', '2024-03-23', 10, 23),
('Por enquanto tudo tranquilo', '2024-04-23', 0, 24),
('Bom bom', '2024-06-25', 10, 25),
('God god', '2024-05-07', 3, 26),
('Box of god god', '2024-08-09', 9, 27);

--Selecionando e mostrando todas as Avaliações cadatradas
select * from Avaliacoes;


--Inserindo os Vestibulares na tabela Vestibulares
insert into Vestibulares values 
('ENEM', 'img/enem.png', '1998-05-27', 'Não pode colar', 'Texto  Disertativo', 'Não', 15, 30, 400, 1000, 6, 2.5, 4),
('FUVEST', 'img/fuvest.png', '2001-07-20', 'Apenas caneta preta', 'Redação e Objetiva', 'Não', 18, 50, 500, 1200, 7, 3.0, 5.0),
('UNICAMP', 'img/unicamp.png', '2002-08-18', 'Material próprio', 'Prova Dissertativa', 'Sim', 14, 40, 450, 1000, 6, 2.8, 4.2),
('UNESP', 'img/unesp.png', '2003-09-25', 'Uso de calculadora permitido', 'Redação e Objetiva', 'Não', 16, 35, 400, 900, 5, 2.5, 4.0),
('UERJ', 'img/uerj.png', '2004-10-05', 'Proibido o uso de eletrônicos', 'Prova Dissertativa', 'Sim', 20, 45, 600, 1400, 8, 3.5, 5.5),
('UFRJ', 'img/ufrj.png', '2005-11-12', 'Silêncio obrigatório', 'Redação e Objetiva', 'Não', 10, 30, 300, 700, 4, 1.5, 2.5),
('UNIFESP', 'img/unifesp.png', '2006-12-15', 'Revisão não permitida', 'Prova Dissertativa', 'Sim', 22, 50, 550, 1300, 7, 3.2, 4.8),
('UFMG', 'img/ufmg.png', '2007-01-20', 'Prova individual', 'Redação e Objetiva', 'Não', 15, 40, 450, 1000, 6, 2.5, 4.0),
('UFBA', 'img/ufba.png', '2008-02-25', 'Sem consulta', 'Prova Dissertativa', 'Sim', 18, 45, 500, 1100, 6, 2.8, 4.5),
('UFG', 'img/ufg.png', '2009-03-30', 'Apenas caneta azul', 'Redação e Objetiva', 'Não', 13, 25, 350, 800, 5, 2.0, 3.0),
('UFSC', 'img/ufsc.png', '2010-04-10', 'Material próprio', 'Prova Dissertativa', 'Sim', 21, 50, 550, 1200, 7, 3.0, 4.5),
('UFPR', 'img/ufpr.png', '2011-05-15', 'Uso de calculadora permitido', 'Redação e Objetiva', 'Não', 19, 40, 450, 1000, 6, 2.8, 4.2),
('UFRGS', 'img/ufrgs.png', '2012-06-20', 'Proibido o uso de eletrônicos', 'Prova Dissertativa', 'Sim', 16, 35, 400, 900, 5, 2.5, 4.0),
('UFC', 'img/ufc.png', '2013-07-25', 'Silêncio obrigatório', 'Redação e Objetiva', 'Não', 11, 30, 300, 700, 4, 1.5, 2.5),
('UFPA', 'img/ufpa.png', '2014-08-30', 'Revisão não permitida', 'Prova Dissertativa', 'Sim', 23, 50, 600, 1300, 7, 3.2, 5.0),
('UFMA', 'img/ufma.png', '2015-09-10', 'Prova individual', 'Redação e Objetiva', 'Não', 17, 45, 500, 1100, 6, 2.8, 4.0),
('UFMT', 'img/ufmt.png', '2016-10-15', 'Sem consulta', 'Prova Dissertativa', 'Sim', 20, 50, 550, 1200, 7, 3.0, 4.5),
('UFAM', 'img/ufam.png', '2017-11-20', 'Apenas caneta preta', 'Redação e Objetiva', 'Não', 14, 40, 450, 1000, 6, 2.5, 4.0),
('UFRN', 'img/ufrn.png', '2018-12-25', 'Material próprio', 'Prova Dissertativa', 'Sim', 22, 45, 500, 1100, 6, 2.8, 4.5),
('UFPE', 'img/ufpe.png', '2019-01-30', 'Uso de calculadora permitido', 'Redação e Objetiva', 'Não', 18, 35, 400, 900, 5, 2.5, 4.0);

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


--Inserindo os Temas de Redações na tabela Temas_Redacoes
insert into Temas_Redacoes values
('Desafios para o enfrentamento da invisibilidade do trabalho de cuidado realizado pela mulher no Brasil', 'Vestibular', 2023, 1),
('Meu tema inventado professor', 'Professor', 2024, 6),
('Meu tema inventado aluno', 'Aluno', 2024, 1),
('O voto facultativo', 'Vestibular', 2023, 4),
('Outro tema inventadoo por professor', 'Professor', 2020, 7),
('Outro tema inventadoo por aluno', 'Aluno', 2019, 10),
('Impacto das Tecnologias no Mercado de Trabalho', 'Aluno', 2023, 1),
('A Influência das Redes Sociais na Educação', 'Professor', 2022, 13),
('Desafios do Sistema Educacional Brasileiro', 'Vestibular', 2021, 3),
('Sustentabilidade e Meio Ambiente', 'Aluno', 2024, 4),
('Saúde Mental na Escola', 'Professor', 2023, 6),
('Desigualdade Social no Brasil', 'Vestibular', 2020, 6),
('Cultura e Identidade', 'Aluno', 2022, 7),
('Inovações na Educação', 'Professor', 2021, 6),
('O Papel da Família na Educação', 'Vestibular', 2019, 9),
('Violência Urbana e Escolar', 'Aluno', 2024, 10),
('A Importância da Leitura', 'Professor', 2023, 12),
('Educação Inclusiva', 'Vestibular', 2022, 12),
('Tecnologia e Sociedade', 'Aluno', 2021, 13),
('Cidadania e Democracia', 'Professor', 2020, 7),
('Mudanças Climáticas', 'Vestibular', 2024, 15),
('Desafios da Globalização', 'Aluno', 2023, 16),
('Ética e Corrupção', 'Professor', 2022, 7),
('Crescimento Urbano Desordenado', 'Vestibular', 2021, 18),
('Mobilidade Urbana', 'Aluno', 2020, 19),
('Educação para o Século XXI', 'Professor', 2019, 7);

--Selecionando e mostrando todos os Temas cadastrados
select * from Temas_Redacoes;


--Inserindo as Redações dos Alunos na tebela Redacoes
insert into Redacoes (Titulo_Redacao, Tipo_Envio, Redacao, Dt_Envio, ID_Vestibular, ID_Usuario, ID_Tema) values
('O combate contra a Dengue', 'Texto', 'Bla bla bla bla', '2024-05-23', 1, 1, 2),
('A invisibilidade da mulher no trabalho', 'Arquivo', 'arquivos/redacoes/redacao.txt', '2024-05-23', 7, 2, 7),
('O combate contra a COVID', 'Texto', 'Tururururu', '2022-12-27', 10, 10, 12),
('Um tema dahora que só ele', 'Arquivo', 'arquivos/redacoes/redacao2.docx', '2022-12-27', 9, 15, 16),
('Os desafios da educação', 'Texto', 'De acordo com o artigo tal da Constituição Federal, é dever do governo garantir a educação as todos os...', '2024-01-27', 10, 10, 12),
('A importância da vacinação', 'Texto', 'A vacinação é essencial para a imunização em massa...', '2023-01-10', 5, 14, 18),
('Desafios da educação a distância', 'Arquivo', 'caminho/para/arquivo1.pdf', '2023-02-15', 3, 15, 16),
('Mudanças climáticas e suas consequências', 'Texto', 'O aquecimento global é um dos maiores desafios da atualidade...', '2023-03-20', 7, 21, 19),
('A influência da tecnologia na vida moderna', 'Arquivo', 'caminho/para/arquivo2.docx', '2023-04-25', 11, 27, 13),
('A revolução das energias renováveis', 'Texto', 'A transição para energias limpas é crucial para o futuro do planeta...', '2023-05-30', 4, 15, 20),
('A importância da vacinação', 'Texto', 'A vacinação é essencial para a imunização em massa...', '2023-01-10', 5, 14, 18),
('Desafios da educação a distância', 'Arquivo', 'caminho/para/arquivo1.pdf', '2023-02-15', 3, 27, 16),
('Mudanças climáticas e suas consequências', 'Texto', 'O aquecimento global é um dos maiores desafios da atualidade...', '2023-03-20', 7, 14, 19),
('A influência da tecnologia na vida moderna', 'Arquivo', 'caminho/para/arquivo2.docx', '2023-04-25', 11, 6, 13),
('A revolução das energias renováveis', 'Texto', 'A transição para energias limpas é crucial para o futuro do planeta...', '2023-05-30', 4, 15, 20),
('O impacto da inteligência artificial', 'Texto', 'A inteligência artificial está mudando a forma como vivemos e trabalhamos...', '2023-06-10', 9, 10, 11),
('Sustentabilidade no século XXI', 'Arquivo', 'caminho/para/arquivo3.pdf', '2023-07-15', 2, 13, 17),
('Os desafios do aquecimento global', 'Texto', 'O aquecimento global representa um desafio urgente para a humanidade...', '2023-08-20', 8, 9, 15),
('A evolução das energias renováveis', 'Arquivo', 'caminho/para/arquivo4.docx', '2023-09-25', 1, 11, 14),
('A influência das redes sociais', 'Texto', 'As redes sociais têm um grande impacto na sociedade moderna...', '2023-10-30', 6, 18, 12),
('Educação para o futuro', 'Arquivo', 'caminho/para/arquivo5.pdf', '2023-11-05', 12, 10, 16),
('O futuro da mobilidade urbana', 'Texto', 'Novas formas de mobilidade urbana estão surgindo em todo o mundo...', '2023-12-10', 14, 23, 18),
('A importância da conservação ambiental', 'Arquivo', 'caminho/para/arquivo6.docx', '2024-01-15', 7, 8, 13),
('Tecnologia e privacidade', 'Texto', 'A questão da privacidade está cada vez mais em evidência com o avanço da tecnologia...', '2024-02-20', 11, 28, 19),
('O impacto da globalização', 'Arquivo', 'caminho/para/arquivo7.pdf', '2024-03-25', 10, 9, 15),
('O papel da ciência na sociedade', 'Texto', 'A ciência desempenha um papel crucial no desenvolvimento da sociedade...', '2024-04-30', 3, 22, 17),
('A importância da leitura', 'Arquivo', 'caminho/para/arquivo8.docx', '2024-05-10', 5, 13, 16),
('A revolução digital', 'Texto', 'A revolução digital está transformando todos os aspectos da vida moderna...', '2024-06-15', 4, 11, 14),
('A ética no desenvolvimento tecnológico', 'Arquivo', 'caminho/para/arquivo9.pdf', '2024-07-20', 6, 10, 18),
('Os desafios da democracia moderna', 'Texto', 'A democracia enfrenta vários desafios no mundo moderno...', '2024-08-25', 8, 14, 12);

--Selecionando e mostrando todos os registros da tabela Redações
select * from Redacoes;


--Inserindo as Correções das Redações na tabela Correcoes_Redacoes
insert into Correcoes_Redacoes (Nota_Correcao, Dt_Correcao, Tipo_Correcao, Redacao_Corrigida, Comentario_Redacao, ID_Corretor, ID_Redacao) values
(1000, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Bão', 3, 1),
(950, '2024-04-23', 'Texto', 'Bla bla bla blu', 'Chegando lá', 9, 1),
(100, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao1.txt', 'Bem mau', 3, 2),
(850, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Bom', 9, 2),
(820, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao2.docx', 'Bom', 3, 3),
(13, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao3.txt', 'Muito ruim', 3, 4),
(20, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ta mal ein', 3,5),
(450, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 9, 5),
(1000, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Bão', 3, 6),
(620, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao4.pdf', 'Melhorando', 3, 7),
(840, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao5.txt', 'Bom', 3, 8),
(730, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Quase bom', 9, 9),
(630, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Melhorando', 3, 10),
(500, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao6.doc', 'Ruim', 3, 11),
(990, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Bateu na trave', 3, 12),
(1000, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Bão', 9, 12),
(300, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 3, 13),
(400, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 3, 14),
(200, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao7.txt', 'Ruim', 3, 15),
(220, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Ruim', 9, 16),
(580, '2024-05-23', 'Arquivo', 'correcoes/redacoes/corecao8.txt', 'Ruim', 3, 17),
(740, '2024-05-23', 'Texto', 'Bla bla bla bla', 'Quase bom', 3, 18);

--Selecionando e mostrando todas as Correções das Redações cadastradas
select * from Correcoes_Redacoes;


--Inserindo as Disciplinas na tebala Disciplinas
insert into Disciplinas (Nome_Disciplina, ID_ADM) values
('Matemática', 4),
('Português', 4),
('Algebra Linear', 4),
('História', 4),
('Geografia', 4),
('Física', 4),
('Biologia', 4),
('Sociologia', 4),
('Educação Física', 4),
('Química', 4),
('Teologia', 4),
('Filosofia', 4),
('Informática', 4),
('Lógica', 4),
('Inglês', 4),
('Espanhol', 4),
('Françes', 4),
('Mitologia', 4),
('Artes', 4),
('Literatura', 4),
('Ensino Religioso', 4),
('Musica', 4);

--Selecionando e mostrando as Disciplinas cadastradas
select * from Disciplinas;


--Inserindo as Questões na tabela Questoes
insert into Questoes (Texto_Questao, Ano_Questao, Alternativa_Correta, ID_ADM, ID_Vestibular) values
('As my official bio reads, I was made in Cuba, assembled in Spain, and imported to the United States — meaning my mother, seven months pregnant, and the rest of my family arrived as exiles from Cuba to Madrid, where I was born. Less than two months later, we emigrated once more and settled in New York City, then eventually in Miami, where I was raised and educated. Although technically we lived in the United States, the Cuban community was culturally insular in Miami during the 1970s, bonded together by the trauma of exile. What’s more, it seemed that practically everyone was Cuban: my teachers, my classmates, the mechanic, the bus driver. I didn’t grow up feeling different or treated as a minority. The few kids who got picked on in my grade school were the ones with freckles and funny last names like Dawson and O’Neil. BLANCO, R. Disponível em: http://edition.cnn.com. Acesso em: 9 dez. 2017 (adaptado). Ao relatar suas vivências, o autor destaca o:', 2022, 'd', 5, 1),
('Esse cartaz tem a função social de:', 2022, 'e', 5, 1),
('Pequeño hermano Es, no cabe duda, el instrumento más presente y más poderoso de todos los que entraron en nuestras vidas. Ni la televisión ni el ordenador, no hablemos ya del obsoleto fax o de las agendas o los libros electrónicos, ha tenido tal influencia, tal predicamento sobre nosotros. El móvil somos nosotros mismos. Todo desactivado e inerte, inocuo, ya les digo. Y de repente, tras un viaje y tres o cuatro imprudentes fotos, salta un aviso en la pantalla. Con sonido, además, pese a que tengo también todas las alertas desactivadas. Y mi monstruo doméstico me dice: tienes un recuerdo nuevo. Lo repetiré: tienes un recuerdo nuevo. ¿Y tú qué sabes? ¿Y a ti, máquina demoníaca, qué te importa? ¿Cómo te atreves a decirme qué son o no son mis recuerdos? ¿Qué es esta intromisión, este descaro? El pequeño hermano lo sabe casi todo. Sólo hay una esperanza: que la obsolescencia programada mate antes al pequeño hermano y que nosotros sigamos vivos, con los recuerdos que nos dé la gana. FERNÁNDEZ, D. Disponível em: www.lavanguardia.com. Acesso em: 5 dez. 2018 (adaptado). \r\nNo texto, o autor faz uma crítica ao(à): \r\n', 2022, 'd', 5, 1),
('En los suburbios de La Habana, llaman al amigo mi tierra o mi sangre. En Caracas, el amigo es mi pana o mi llave: pana, por panadería, la fuente del buen pan para las hambres del alma; y llave por... — Llave, por llave — me dice Mario Benedetti. Y me cuenta que cuando vivía en Buenos Aires, en los tiempos del terror, él llevaba cinco llaves ajenas en su llavero: cinco llaves, de cinco casas, de cinco amigos: las llaves que lo salvaron. GALEANO, E. El libro de los abrazos. Madri: Siglo Veintiuno, 2015. \r\nNesse texto, o autor demonstra como as diferentes expressões existentes em espanhol para se referir a “amigo” variam em função \r\n', 2022, 'c', 5, 1),
('No texto, as palavras “crianza” e “tribu” são usadas para: ', 2022, 'a', 5, 1),
('Two hundred years ago, Jane Austen lived in a world where single men boasted vast estates; single ladies were expected to speak several languages, sing and play the piano. In both cases, it was, of course, advantageous if you looked good too. So, how much has — or hasn’t — changed? Dating apps opaquely outline the demands of today’s relationship market; users ruminate long and hard over their choice of pictures and what they write in their biographies to hook in potential lovers, and that’s just your own profile. What do you look for in a future partner’s profile — potential signifiers of a popular personality, a good job, a nice car? These apps are a poignant reminder of the often classist attitudes we still adopt, as well as the financial and aesthetic expectations we demand from potential partners. GALER, S. Disponível em: www.bbc.com. Acesso em: 8 dez. 2017 (adaptado).\r\nO texto aborda relações interpessoais com o objetivo de:\r\n', 2022, 'c', 5, 1),
('Nessa tirinha, o comportamento da mulher expressa:', 2022, 'b', 5, 1),
('A Teen’s View of Social Media Instagram is made up of all photos and videos. There is the home page that showcases the posts from people you follow, an explore tab which offers posts from accounts all over the world, and your own page, with a notification tab to show who likes and comments on your posts. It has some downsides though. It is known to make many people feel insecure or down about themselves because the platform showcases the highlights of everyone’s lives, while rarely showing the negatives. This can make one feel like their life is not going as well as others, contributing to the growing rates of anxiety or depression in many teens today. There is an underlying desire for acceptance through the number of likes or followers one has. Disponível em: https://cyberbullying.org. Acesso em: 29 out. 2021. \r\nO termo “downsides” introduz a ideia de que o Instagram é responsável por: \r\n', 2022, 'd', 5, 1),
('I tend the mobile now like an injured bird We text, text, text our significant words. I re-read your first, your second, your third, Look for your small xx, feeling absurd. The codes we send arrive with a broken chord. I try to picture your hands, their image is blurred. Nothing my thumbs press will ever be heard. DUFFY, C. Disponível em: www.independent.co.uk. Acesso em: 27 out. 2021.\r\nNesse poema, o eu lírico evidencia um sentimento de:\r\n', 2022, 'e', 5, 1),
('Espera, resignado, o dia 13 daquele mês porque, em tal data, usança avoenga lhe faculta sondar o futuro, interrogando a providência. É a experiência tradicional de Santa Luzia. No dia 12 ao anoitecer expõe ao relento, em linha, seis pedrinhas de sal, que representam, em ordem sucessiva da esquerda para a direita, os seis meses vindouros, de janeiro a junho. Ao alvorecer de 13 observa-as: se estão intactas, pressagiam a seca; se a primeira apenas se deliu, transmudada em aljôfar límpido, é certa a chuva em janeiro; se a segunda, em fevereiro; se a maioria ou todas, é inevitável o inverno benfazejo. Esta experiência é belíssima. \r\nCUNHA, E. Os sertões. São Paulo: Editora Três, 1984. \r\nNo experimento descrito, a relação com a paisagem e com a religiosidade permite que o sertanejo seja: \r\n', 2022, 'd', 5, 1),
('Sempre que a relevância do discurso entra em jogo, a questão torna-se política por definição, pois é o discurso que faz do homem um ser político. E tudo que os homens fazem, sabem ou experimentam só tem sentido na medida em que pode ser discutido. Haverá, talvez, verdades que ficam além da linguagem e que podem ser de grande relevância para o homem no singular, isto é, para o homem que, seja o que for, não é um ser político. Mas homens no plural, isto é, os homens que vivem e se movem e agem neste mundo, só podem experimentar o significado das coisas por poderem falar e ser inteligíveis entre si e consigo mesmos. \r\nARENDT, H. A condição humana. Rio de Janeiro: Forense Universitária, 2004. \r\nNo trecho, a filósofa Hannah Arendt mostra a importância da linguagem no processo de:', 2022, 'e', 5, 1),
('Eu estava pagando o sapateiro e conversando com um preto que estava lendo um jornal. Ele estava revoltado com um guarda civil que espancou um preto e amarrou numa árvore. O guarda civil é branco. E há certos brancos que transforma preto em bode expiatório. Quem sabe se guarda civil ignora que já foi extinta a escravidão e ainda estamos no regime da chibata? \r\nJESUS, C. M. Quarto de despejo: diário de uma favelada. São Paulo: Ática, 2014. \r\nO texto, que guarda a grafia original da autora, expõe uma característica da sociedade brasileira, que é o(a): \r\n', 2022, 'a', 5, 1),
('PAZ, A. D. Disponível em: www.ct.ufpb.br. Acesso em: 15 out. 2021 (adaptado). \r\nA intensificação da ocupação urbana demonstrada afeta de forma imediata o(a); \r\n', 2022, 'b', 5, 1),
('Na construção da ferrovia Madeira-Mamoré, o que dizer dos doentes, eternos moribundos a vagar entre delírios febris, doses de quinino e corredores da morte? O Hospital da Candelária era santuário e túmulo, monumento ao progresso científico e preâmbulo da escuridão. Foi ali, com suas instalações moderníssimas, que médicos e sanitaristas dirigiram seu combate aos males tropicais. As maiores vítimas, contudo, permaneceriam na sombra à margem do palco, cobaias sem consolo, credores sem nome de uma sociedade que não lhes concedera tempo algum para ser decifrada. \r\nFOOT HARDMAN, F. Trem fantasma: modernidade na selva. São Paulo: Cia. das Letras, 1988 (adaptado). \r\nNo texto, há uma crítica ao modo de ocupação do espaço amazônico pautada na: \r\n', 2022, 'e', 5, 1),
('Uma nova economia surgiu em escala global no último quartel do século XX. Chamo-a de informacional, global e em rede para identificar suas características fundamentais e diferenciadas e enfatizar sua interligação. É informacional porque depende basicamente de sua capacidade de gerar, processar e aplicar de forma eficiente a informação baseada em conhecimentos. É global porque seus componentes estão organizados em escala global, diretamente ou mediante uma rede de conexões entre agentes econômicos. É rede porque é feita em uma rede global de interação entre redes empresariais. \r\nCASTELLS, M. A sociedade em rede — a era da informação: economia, sociedade e cultura. São Paulo: Paz e Terra, 1999 (adaptado). \r\nQual mudança estrutural é resultado da forma de organização econômica descrita no texto? \r\n', 2022, 'e', 5, 1),
('Olhar o Brasil e não ver o sertão \r\nÉ como negar o queijo com a faca na mão \r\nEsse gigante em movimento \r\nMovido a tijolo e cimento Precisa de arroz com feijão \r\nQue tenha comida na mesa \r\nQue agradeça sempre a grandeza \r\nDe cada pedaço de pão \r\nAgradeça a Clemente \r\nQue leva a semente \r\nEm seu embornal \r\nZezé e o penoso balé \r\nDe pisar no cacau \r\nMaria que amanhece o dia \r\nLá no milharal \r\nVANDER LEE. Do Brasil. In: Pensei que fosse o céu: ao vivo. Rio de Janeiro: Indie Records, 2006 (fragmento). \r\nA letra da canção valoriza uma dimensão do espaço rural brasileiro em sua relação com a cidade ao ressaltar sua função de: \r\n', 2022, 'd', 5, 1),
('O número cada vez maior de mulheres letradas e interessadas pela literatura e pelas novelas, muitas divulgadas em capítulos, seções, classificadas comumente como folhetim, alçou a um gênero de ficção corrente já em 1840, fazendo parte do florescimento da literatura nacional brasileira, instigando a formação e a ampliação de um público leitor feminino, ávido por novidades, pelo apelo dos folhetins e “narrativas modernas” que encenavam “os dramas e os conflitos de uma mulher em processo de transformação patriarcal e provinciana que, progressivamente, começava a se abrir para modernizar seus costumes”. No Segundo Reinado, as mulheres foram se tornando público determinante na construção da literatura e da imprensa nacional. E não apenas público, porquanto crescerá o número de escritoras que colaboram para isso e emergirá uma imprensa feminina, editada, escrita e dirigida por e para mulheres. \r\nABRANTES, A. Do álbum de família à vitrine impressa: trajetos de retratos (PB, 1920), Revista Temas em Educação, n. 24, 2015 (adaptado). \r\nO registro das atividades descritas associa a inserção da figura feminina nos espaços de leitura e escrita do Segundo Reinado ao(à): \r\n', 2022, 'a', 5, 1),
('Os caixeiros do comércio a retalho do Rio de Janeiro estiveram entre as primeiras categorias de trabalhadores a se organizar em associações e a exigir a intervenção dos poderes públicos na mediação de suas lutas por direitos. Na década de 1880, os caixeiros participaram da arena política e ganharam as ruas com vários outros, como os republicanos e os abolicionistas.\r\nPOPINIGIS, F. “Todas as liberdades são irmãs”: os caixeiros e as lutas dos trabalhadores por direitos entre o Império e a República. Estudos Históricos, n. 59, set.-dez. 2016 (adaptado).\r\nA atuação dos trabalhadores mencionados no texto representou, na capital do Império, um momento de:\r\n', 2022, 'e', 5, 1),
('Solos salinos ou alomórficos apresentam como característica comum uma concentração muito alta de sais solúveis e/ou de sódio trocável. Eles ocorrem nos locais mais baixos do relevo, em regiões áridas e semiáridas e próximas do mar. Em regiões semiáridas, por exemplo, o polígono das secas do Nordeste brasileiro, os locais menos elevados recebem água que se escoa dos declives adjacentes, durante as chuvas que caem em alguns meses do ano. Essa água traz soluções de sais minerais e evapora-se rapidamente antes de infiltrar-se totalmente, havendo então, cada vez que esse processo é repetido, um pequeno acúmulo de sais no horizonte superficial que, com o passar dos anos, provoca a salinização do solo. Nas últimas décadas, a expansão das atividades agrícolas na região tem ampliado esse processo.\r\nLEPSCH, I. F. Solos: formação e conservação. São Paulo: Melhoramentos, 1993 (adaptado). \r\nAs atividades agrícolas, desenvolvidas na região mencionada, intensificam o problema ambiental exposto ao: \r\n', 2022, 'e', 5, 1),
('É como se os problemas fossem criados pela pandemia quando, em verdade, isso só demonstra o quanto eles sofrem uma tentativa de serem naturalizados. Eles estavam lá, empurrados para debaixo de vários tapetes. Diversos levantamentos realizados indicam que parcela significativa dos estudantes não têm acesso à internet em suas casas, não têm computadores; têm celulares, mas com pacotes baratos que não permitem assistir a todas as aulas. E, caso tenham celulares e dados, pergunta-se: É possível elaborar um texto no celular? É possível interagir na aula remota pelo celular? \r\nASSIS, A. E. S. Q. Educação e pandemia. Educação em Revista, n. 37, 2021 (adaptado). \r\nA crítica contida no texto e na figura evidencia o seguinte aspecto da sociedade contemporânea: \r\n', 2022, 'b', 5, 1),
('O leproso é visto dentro de uma prática da rejeição, do exílio-cerca; deixa-se que se perca lá dentro como numa massa que não tem muita importância diferenciar; os pestilentos são considerados num policiamento tático meticuloso onde as diferenciações individuais são os efeitos limitantes de um poder que se multiplica, se articula e se subdivide. O grande fechamento por um lado; o bom treinamento por outro. A lepra e sua divisão; a peste e seus recortes. Uma é marcada; a outra, analisada e repartida. O exílio do leproso e a prisão da peste não trazem consigo o mesmo sonho político. \r\nFOUCAULT, M. Vigiar e punir: nascimento da prisão. Petrópolis: Vozes, 1987. \r\nOs modelos autoritários descritos no texto apontam para um sistema de controle que se baseia no(a): \r\n', 2022, 'a', 5, 1),
('TEXTO I \r\nEm março de 1889, quando apareceram as primeiras romarias atraídas pelos milagres da beata Maria de Araújo, Juazeiro inseriu-se no rol da fundação do espaço religioso. Construía-se mais um centro, como Aparecida do Norte, Canindé ou Lourdes. \r\nRAMOS, F. R. L. O meio do mundo: território sagrado em Juazeiro do Padre Cícero. Fortaleza: Imprensa Universitária, 2014\r\nTEXTO II\r\nNão sabemos ao certo quantas pessoas estavam presentes na capela no momento em que a hóstia sangrou na boca de Maria de Araújo. O Padre Cícero nos conta que o fato surpreendeu não só aos presentes, mas a própria beata parecia atordoada com o ocorrido. O fenômeno continuou acontecendo todas as quartas e sextas na Capela de Nossa Senhora das Dores a partir daquele dia. Os paninhos manchados do sangue que escorria da hóstia e da boca da beata, a princípio, ficaram sob a guarda do Padre Cícero, mas logo foram expostos à visitação pública e, além disso, o sangramento foi proclamado como milagre sem o conhecimento e sem a autorização do bispo diocesano. \r\nNOBRE, E. Incêndios da alma. Rio de Janeiro: Multifoco, 2016 (adaptado). \r\nAs práticas religiosas mencionadas nos textos estão associadas, respectivamente, à: \r\n', 2022, 'a', 5, 1);

--Selecionando e mostrando todas as Questões cadastradas
select * from Questoes;


--Inserindo as ligações de N para N entre as tabelas Questões e Disciplinas
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

--Mostrando todas as ligações entre as tabelas citadas
select * from Disciplinas_Questoes order by ID_Questao;


--Inserindo os caminhos das Imagens nas Questões que possuem
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


--Inserindo as Alternativas das Questões cadastradas
insert into Alternativas (ID_Questao, Texto_Alternativa, Alternativa, Tipo) values
(1, 'qualidade da educação formal em Miami. ', 'a', 'Texto'),
(1, 'prestígio da cultura cubana nos Estados Unidos.', 'b', 'Texto'),
(1, 'oportunidade de qualificação profissional em Miami. ', 'c', 'Texto'),
(1, 'cenário da integração de cubanos nos Estados Unidos. ', 'd', 'Texto'),
(1, 'fortalecimento do elo familiar em comunidades estadunidenses.', 'e', 'Texto'),
(2, 'difundir a arte iconográfica indígena mexicana. ', 'a', 'Texto'),
(2, 'resgatar a literatura popular produzida em língua zapoteca. ', 'b', 'Texto'),
(2, 'questionar o conhecimento do povo mexicano sobre as línguas ameríndias. ', 'c', 'Texto'),
(2, 'destacar o papel dos órgãos governamentais na conservação das línguas no México. ', 'd', 'Texto'),
(2, 'defender a preservação das línguas originárias garantindo a diversidade linguística mexicana.', 'e', 'Texto'),
(3, 'conhecimento das pessoas sobre as tecnologias. ', 'a', 'Texto'),
(3, 'uso do celular alheio por pessoas desautorizadas. ', 'b', 'Texto'),
(3, 'funcionamento de recursos tecnológicos obsoletos. ', 'c', 'Texto'),
(3, 'ingerência do celular sobre as escolhas dos usuários. ', 'd', 'Texto'),
(3, 'falta de informação sobre a configuração de alertas no celular.', 'e', 'Texto'),
(4, 'das peculiaridades dos subúrbios hispano-americanos.', 'a', 'Texto'),
(4, 'da força da conexão espiritual entre os amigos.', 'b', 'Texto'),
(4, 'do papel da amizade em diferentes contextos. ', 'c', 'Texto'),
(4, 'do hábito de reunir amigos em torno da mesa. ', 'd', 'Texto'),
(4, 'dos graus de intimidade entre os amigos.', 'e', 'Texto'),
(5, 'evidenciar a importância de uma rede de apoio para as mães na criação de seus filhos. ', 'a', 'Texto'),
(5, 'denunciar a disparidade entre o trabalho das mães de diferentes classes sociais. ', 'b', 'Texto'),
(5, 'ressaltar o fechamento de escolas e creches durante o período pandêmico. ', 'c', 'Texto'),
(5, 'ratificar a romantização da dedicação das mães na educação das crianças. ', 'd', 'Texto'),
(5, 'enfatizar a proteção aos filhos em razão do isolamento social das famílias.', 'e', 'Texto'),
(6, 'problematizar o papel de gênero em casamentos modernos.', 'a', 'Texto'),
(6, 'apontar a relevância da educação formal na escolha de parceiros.', 'b', 'Texto'),
(6, 'comparar a expectativa de parceiros amorosos em épocas distintas.', 'c', 'Texto'),
(6, 'discutir o uso de aplicativos para proporcionar encontros românticos.', 'd', 'Texto'),
(6, 'valorizar a importância da aparência física na seleção de pretendentes', 'e', 'Texto'),
(7, 'revolta com a falta de sorte. ', 'a', 'Texto'),
(7, 'gosto pela prática da leitura. ', 'b', 'Texto'),
(7, 'receio pelo futuro do casamento.', 'c', 'Texto'),
(7, 'entusiasmo com os livros de terror. ', 'd', 'Texto'),
(7, 'rejeição ao novo tipo de residência.', 'e', 'Texto'),
(8, 'oferecer recursos de fotografia. ', 'a', 'Texto'),
(8, 'divulgar problemas dos usuários. ', 'b', 'Texto'),
(8, 'estimular aceitação dos seguidores. ', 'c', 'Texto'),
(8, 'provocar ansiedade nos adolescentes. ', 'd', 'Texto'),
(8, 'aproximar pessoas ao redor do mundo.', 'e', 'Texto'),
(9, 'contentamento com a interação virtual. ', 'a', 'Texto'),
(9, 'zelo com o envio de mensagens. ', 'b', 'Texto'),
(9, 'preocupação com a composição de textos. ', 'c', 'Texto'),
(9, 'mágoa com o comportamento de alguém. ', 'd', 'Texto'),
(9, 'insatisfação com uma forma de comunicação.', 'e', 'Texto'),
(10, 'afeito à devoção ao aceitar destinos sacralizados. ', 'a', 'Texto'),
(10, 'acostumado à pobreza ao admitir acasos naturais. ', 'b', 'Texto'),
(10, 'habituado ao solo ao conhecer terrenos cultiváveis.', 'c', 'Texto'),
(10, 'íntimo à Caatinga ao interpretar condições ambientais. ', 'd', 'Texto'),
(10, 'próximo à vegetação ao identificar espécies arbustivas.', 'e', 'Texto'),
(11, 'entendimento da cultura.', 'a', 'Texto'),
(11, 'aumento da criatividade.', 'b', 'Texto'),
(11, 'percepção da individualidade.', 'c', 'Texto'),
(11, 'melhoria da técnica.', 'd', 'Texto'),
(11, 'construção da sociabilidade.', 'e', 'Texto'),
(12, 'Racismo estrutural. ', 'a', 'Texto'),
(12, 'Desemprego latente. ', 'b', 'Texto'),
(12, 'Concentração de renda. ', 'c', 'Texto'),
(12, 'Exclusão informacional. ', 'd', 'Texto'),
(12, 'Precariedade da educação.', 'e', 'Texto'),
(13, 'nível altimétrico. ', 'a', 'Texto'),
(13, 'ciclo hidrológico. ', 'b', 'Texto'),
(13, 'padrão climático.', 'c', 'Texto'),
(13, 'tectônica de placas. ', 'd', 'Texto'),
(13, 'estrutura das rochas.', 'e', 'Texto'),
(14, 'discrepância entre engenharia ambiental e equilíbrio da fauna. ', 'a', 'Texto'),
(14, 'incoerência entre maquinaria estrangeira e controle da floresta. ', 'b', 'Texto'),
(14, 'incompatibilidade entre investimento estatal e proteção aos nativos. ', 'c', 'Texto'),
(14, 'competição entre farmacologia internacional e produtos da fitoterapia. ', 'd', 'Texto'),
(14, 'contradição entre desenvolvimento nacional e respeito aos trabalhadores.', 'e', 'Texto'),
(15, 'Fabricação em série. ', 'a', 'Texto'),
(15, 'Ampliação de estoques. ', 'b', 'Texto'),
(15, 'Fragilização dos cartéis. ', 'c', 'Texto'),
(15, 'Padronização de mercadorias.', 'd', 'Texto'),
(15, 'Desterritorialização da produção.', 'e', 'Texto'),
(16, 'fornecer a mão de obra qualificada. ', 'a', 'Texto'),
(16, 'incorporar a inovação tecnológica.', 'b', 'Texto'),
(16, 'preservar a diversidade biológica. ', 'c', 'Texto'),
(16, 'promover a produção alimentar. ', 'd', 'Texto'),
(16, 'garantir a moradia básica.', 'e', 'Texto'),
(17, 'surgimento de novas práticas culturais. ', 'a', 'Texto'),
(17, 'contestação de antigos hábitos masculinos. ', 'b', 'Texto'),
(17, 'valorização de recentes publicações juvenis. ', 'c', 'Texto'),
(17, 'circulação de variados manuais pedagógicos. ', 'd', 'Texto'),
(17, 'aparecimento de diversas editoras comerciais.', 'e', 'Texto'),
(18, 'manutenção das regras patronais.', 'a', 'Texto'),
(18, 'desprendimento das ideias liberais.', 'b', 'Texto'),
(18, 'fortalecimento dos contratos laborais.', 'c', 'Texto'),
(18, 'consolidação das estruturas sindicais.', 'd', 'Texto'),
(18, 'contestação dos princípios monárquicos. ', 'e', 'Texto'),
(19, 'realizar florestamentos de pinus, desrespeitando a prática do pousio. ', 'a', 'Texto'),
(19, 'utilizar sistemas de irrigação, desprezando uma drenagem adequada. ', 'b', 'Texto'),
(19, 'instalar açudes nos grotões, retardando a velocidade da vazão fluvial. ', 'c', 'Texto'),
(19, 'desmatar áreas de preservação permanente, causando assoreamento. ', 'd', 'Texto'),
(19, 'aplicar fertilizantes de origem orgânica, modificando a química da terra.', 'e', 'Texto'),
(20, 'Exclusão social. ', 'a', 'Texto'),
(20, 'Expansão digital. ', 'b', 'Texto'),
(20, 'Manifestação cultural. ', 'c', 'Texto'),
(20, 'Organização espacial. ', 'd', 'Texto'),
(20, 'Valorização intelectual.', 'e', 'Texto'),
(21, 'Formação de sociedade disciplinar. ', 'a', 'Texto'),
(21, 'Flexibilização do regramento social. ', 'b', 'Texto'),
(21, 'Banimento da autoridade repressora. ', 'c', 'Texto'),
(21, 'Condenação da degradação humana. ', 'd', 'Texto'),
(21, 'Hierarquização da burocracia estatal.', 'e', 'Texto'),
(22, 'img-alternativa-a-22', 'a', 'Imagem'),
(22, 'img-alternativa-b-22', 'b', 'Imagem'),
(22, 'img-alternativa-c-22', 'c', 'Imagem'),
(22, 'img-alternativa-d-22', 'd', 'Imagem'),
(22, 'img-alternativa-e-22', 'e', 'Imagem');

--Selecionando e mostrando todas as Alternativas cadastradas
select * from Alternativas;


--Inserindo dados na tabela Historico_Operacoes
insert into Historico_Operacoes (Descricao_Operacao, Dt_Operacao, ID_Usuario) values
('Cadastro de Questão - ID_Questao: 1', '2024-05-23 19:49:00', 4),
('Alteração de Questão - ID_Questao: 1', '2024-05-23 19:55:00', 4),
('Banimento de Usuário - ID_Usuario: 14', '2024-05-23 20:00:00', 4),
('Anulação do banimento de Usuário - ID_Usuario: 14', '2024-05-23 20:07:00', 4),
('Banimento de Usuário - ID_Usuario: 14', '2024-05-23 20:08:00', 4),
('Alteração de Nivél de Usuário para Corretor - ID_Usuario: 3', '2024-05-23 20:10:00', 5),
('Cadastro de Questão - ID_Questao: 2', '2024-05-24 19:51:00', 8),
('Alteração de Questão - ID_Questao: 2', '2024-05-24 19:52:00', 8),
('Exclusão de Questao - ID_Questao: 2', '2024-05-24 19:59:00', 8),
('Banimento de Usuário - ID_Usuario: 15', '2024-05-24 20:01:00', 8),
('Anulação do banimento de Usuário - ID_Usuario: 15', '2024-05-24 20:04:00', 8),
('Alteração de Nivél de Usuário para ADM - ID_Usuario: 8', '2024-05-24 20:10:00', 5),
('Cadastro de Questão - ID_Questao: 3', '2024-05-24 20:15:00', 4),
('Alteração de Questão - ID_Questao: 3', '2024-05-24 20:16:00', 4),
('Banimento de Usuário - ID_Usuario: 25', '2024-05-24 20:20:00', 4),
('Anulação do banimento de Usuário - ID_Usuario: 25', '2024-05-24 20:27:00', 4),
('Alteração de Nivél de Usuário para Corretor - ID_Usuario: 9', '2024-05-24 20:28:00', 5),
('Cadastro de Questão - ID_Questao: 23', '2024-05-24 20:42:00', 4),
('Alteração de Questão - ID_Questao: 23', '2024-05-24 20:43:00', 4),
('Exclusão de Questao - ID_Questao: 23', '2024-05-24 20:45:00', 4),
('Banimento de Usuário - ID_Usuario: 10', '2024-05-24 20:50:00', 4),
('Anulação do banimento de Usuário - ID_Usuario: 10', '2024-05-24 20:55:00', 4),
('Alteração de Nivél de Usuário para Professor - ID_Usuario: 7', '2024-05-24 21:10:00', 5);

--Selecionando e mostrando os Histórico de Operações
select * from Historico_Operacoes;


--Inserindo as informações do site
--Nota: Nessa tabela foi pensado em inserir somente um único registro, que será ele alterado conforme o tempo, caso seja necessário, porque mudou alguma coisa que seja relevante mostrar na apresentação do site.
insert into Informacoes_Site (Texto_Apresentacao, Dt_Alteracao, ID_ADM) values
('Tendo em vista que o Enem cobra o conteúdo dos três anos do ensino médio, o grau de dificuldade para alunos que acabaram de terminar os estudos.....', '2024-05-24', 5);

--Selecionando e mostrando o unico registro das informações do site
select * from Informacoes_Site;

--Inserindo os caminhos das imagens que aparecerão durante a apresentação do site na tabela Imagens_Site
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

--Selecionando e mostrando os caminhos das imagens a serem utilizadas durante a apresentação
select * from Imagens_Site;

--Inserindo dados na tabela Histórico_Simulados
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

--Selecionando e mostrando o Histórico de Simulados
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

--Selecionado e mostrando as relações das tabelas citadas
select * from HistoricoSimulados_Questoes;


--Inserindo dados na tabela Simulados_Salvos
insert into Simulados_Salvos values
('2024-04-20 08:06:00', 'Teste 123', 'Todos', 'Finalizado', 1),
('2024-04-20 09:01:00', 'Biologia', 'Somente eu', 'Em andamento', 1),
('2024-04-21 10:27:00', 'Teste 1', 'Todos', 'Finalizado', 2),
('2024-04-22 11:15:00', 'Questões de Sociologia', 'Somente eu', 'Em andamento', 2),
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
('2024-05-25 20:42:00', 'História', 'Somente eu', 'Em andamento', 22),
('2024-05-18 04:57:00', 'Treinamento para a Fatec', 'Somente eu', 'Em andamento', 10);

--Selecionando e mostrando o Histórico de Simulados
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

--Selecionando e mostrando as relações entre as tabelas citadas
select * from SimuladosSalvos_Questoes;
```

## 🛠️ 6 - CRUD
### Inserção de dados
#### Inserindo três usuários diferentes com todos os atributos:
```sql
--- Crud - Inserção de dados na tabela Usuarios
--- Inserindo três usuários diferentes com todos os atributos
insert into Usuarios values
('Deivid', 'deivid@gmail.com', 'deivid321', '1999-09-30', 'Ativo', 'Aluno'),
('Guilherme', 'guilherme@gmail.com', 'guilherme654', '2002-05-14', 'Ativo', 'Professor'),
('Fabio', 'fabio@gmail.com', 'fabio789', '1963-12-24', 'Ativo', 'Corretor');

--- Exibindo resultado:
select * from Usuarios;
```
<img src="/imagens/crud/crud-insercao-alunos.png">

#### Inserindo uma nova Questão:
```sql
--- Inserindo uma nova Questão com as suas Alternativas
insert into Questoes values ('Questão teste 123', 2024, 'a', 5, 1);

--- Exibindo resultado:
select * from Questoes;
```
<img src="/imagens/crud/crud-insercao-questao.png">

#### Inserindo as suas Alternativas:
```sql
insert into Alternativas values 
('a', 'Texto a', 'Texto', 23),
('b', 'Texto da alternativa b', 'Texto', 23),
('c', 'Texto c', 'Texto', 23),
('d', 'Texto d de dado', 'Texto', 23),
('e', 'Texto e de enegumeno', 'Texto', 23);

--- Exibindo resultado:
select * from Alternativas where ID_Questao = 23;
```
<img src="/imagens/crud/crud-insercao-alernativa.png">

### Leitura de Dados
```sql
--- cRud - Leitura de dados
--- Lendo os atributos Comentario, Data, Nota e ID do Usuario de todos os registros da tabela Avaliacoes dos Usuários
select Comentario_Avaliacao, Dt_Avaliacao, Nota_Avaliacao, ID_Avaliacao from Avaliacoes;
```
<img src="/imagens/crud/crud-listagem-avaliacoes.png">

### Alteração de Dados
```sql
--- crUd - Alteração de Dados
--- Alterando o Nome e a Visualização de um simulado, cuja o código é 15, salvo por um usuário
update Simulados_Salvos set Nome_Simulado = 'Questões de Humanas da UNESP', Visualiizacao = 'Todos' where ID_SimuladoSalvo = 15;

--- Exibindo resultado:
select * from Simulados_Salvos;
```

#### Antes:
<img src="/imagens/crud/crud-alteracao-simuladossalvos-antes.png">

#### Depois:
<img src="/imagens/crud/crud-alteracao-simuladossalvos-depois.png">

### Deleção de Dados
#### Deleção das Alternativas:
```sql
--- cruD - Deleção de Dados
--- Deletando a Questão e as suas alternativas, cadastradas anteriormente, ID = 23;
delete Alternativas where ID_Questao = 23;

--- Exibindo resultado:
select * from Alternativas where ID_Questao = 23;

delete Questoes where ID_Questao = 23;

--- Exibindo resultado:
select * from Questoes;
```
<img src="/imagens/crud/crud-delecao-alternativa.png">

#### Deleção da Questão:
```sql
--- Deleção da Questão
delete Questoes where ID_Questao = 23;

--- Exibindo resultado:
select * from Questoes;
```
<img src="/imagens/crud/crud-delecao-questao.png">



## 🔧 7 - Relatórios
### Seleção, Filtro e Ordenação

1) Selecionando O Nome, Nível e Data de Nascimento de todos os Usuários que são de um nível superior (Corretor, ADM e ADM Geral), começando pelos mais velhos de idade.
```sql
select Nome_Usuario, Nivel_Usuario, Dt_Nascimento from Usuarios where (Nivel_Usuario = 'Corretor' or Nivel_Usuario = 'ADM' or Nivel_Usuario = 'ADM Geral') order by Dt_Nascimento;
```
<img src="/imagens/relatorios/1relatorio-niviessuperiores.png">

2) Selecionando o Nome, Nível e Status de todos os Usuários que são Alunos e que não estão banidos, começando pelos mais antigos de registro, ou seja, do ID menor pro maior
```sql
select Nome_Usuario, Nivel_Usuario, Status_Usuario from Usuarios where Nivel_Usuario = 'Aluno' and Status_Usuario != 'Banido' order by ID_Usuario;
```
<img src="/imagens/relatorios/2relatorio-alunosativos.png">

3) Selecionando todas as alternativas que pertencem a um quetão, cuja o seu ID é 18.
```sql
select * from Alternativas where ID_Questao = 18;
```
<img src="/imagens/relatorios/3relatorio-alternativasques.png">

4) Selecionando a alternativa C dessa mesma questão.
```sql
select * from Alternativas where ID_Questao = 18 and Alternativa = 'c';
```
<img src="/imagens/relatorios/4relatorio-alternativac.png">

5) Selecionando todas as redações de um usuário de código = 11, ordenadas pela data de envio.
```sql
select * from Redacoes where ID_Usuario = 11 order by Dt_Envio;
```
<img src="/imagens/relatorios/5relatorio-redacao11.png">

6) Selecionando todas as correções da primeira redação exibida (ID = 19), caso haja - Nesse caso não haverá nenhuma correção.
```sql
select * from Correcoes_Redacoes where ID_Redacao = 19;
```
<img src="/imagens/relatorios/6relatorio-correcao19.png">

7) Selecionando todos os ID's das questões que são de sociologia (ID = 8).
```sql
select * from Disciplinas_Questoes where ID_Disciplina = 8;
```
<img src="/imagens/relatorios/7relatorio-questoes8.png">

8) Selecionando todas as operações efetuadas pelo usuário de ID = 8, ordenados pela operação mais recente.
```sql
select * from Historico_Operacoes where ID_Usuario = 8 order by Dt_Operacao desc;
```
<img src="/imagens/relatorios/8relatorio-usuario8.png">

9) Selecionando as questões que estão salvas no simulado salvo de ID = 20.
```sql
select * from SimuladosSalvos_Questoes where ID_SimuladoSalvo = 20;
```
<img src="/imagens/relatorios/9relatorio-questoessimu20.png">

10) Selecionando as alternativas preenchidas pelo usuário desse mesmo simulado.
```sql
select * from SimuladosSalvos_Questoes where ID_SimuladoSalvo = 20 and Alt_Selecionada != 'Nenhuma';
```
<img src="/imagens/relatorios/10relatorio-altselecionada.png">

## 🚀 Obter cópia

* Para obter uma cópia do Modelo Físico você pode baixar o arquivo PROVA.SQL, onde está todo o código apresentado únicamente. Ou você pode executar o código apresentado passo a passo;
* Para obter uma cópia dos Modelos Conceitual e Lógico, basta baixar as imagens apresentadas;


## 🛠️ Construído com

* Para o desenvolvimento do Modelo Conceitual foi o uilizado o site Miro;
* Para o desenvolvimento do Modelo Lógico foi o uilizado o software BR-Modelo;
* O SGBD utilizado para o desenvolvimento do código foi o SQL Server, logo para a execução desse código seria necessário obte-lo;
* Caso queira utiliza-lo em outro SGBD será necessário fazer algumas alterações no código


## ✒️ Autor

* **[Luís Pedro Dutra Carrocini](https://github.com/luis-pedro-dutra-carrocini)** - *Criação de todos os Modelos e do Código*
* **[Projeto TCC - Desenrola ENEM 2023](https://github.com/luis-pedro-dutra-carrocini/Projeto-TCC-2023-Desenrola-ENEM)** - *Créditos reservados a todos os integrantes e colaboradores desse projeto, de onde foi baseado a idéia do Site e do Banco de dados dessa atividade*

## 🎁 Expressões de gratidão

* Agradeço a Deus pela força e determinação que me deu para o desenvolvimento dessa atividade;
* Agradeço ao [Prof. Márcio](https://github.com/marciofunes) pelo conhecimento transmitido;
