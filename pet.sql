


//funcionario tem que ter codigo da casa


CREATE TABLE "funcionario"(
	codFuncionario serial,
	CPF varchar(15) UNIQUE,
	nome varchar(150) NOT NULL,
	sexo char(1) NOT NULL,
	dataNascimento date,
	salario numeric(7,2) NOT NULL,
	telefone char(11),
	CONSTRAINT "CheckSexo" CHECK (Sexo = 'M' or Sexo = 'F'),
	CONSTRAINT "funcionarioPK" PRIMARY KEY(cpf)
)


CREATE TABLE "casa"(
	nomeDono varchar(150) NOT NULL,
	codigo integer,
	dataFundacao date,
	endereco varchar(150) NOT NULL,
	telefone char(13),
	CONSTRAINT "casaPK" PRIMARY KEY (CEP)
)

//sugestão: colocar numero da casa

CREATE TABLE "animais"(
	codigo integer,
	tipo varchar(50) NOT NULL,
	raça varchar(30) NOT NULL,
	sexo char(1) NOT NULL,
	idade integer,
	tipoSanguineo varchar(4) NOT NULL,
	situacao varchar(15) NOT NULL,
	codCasa integer,
	CPFcliente integer,
	CONSTRAINT "animalPK" PRIMARY KEY (codigo),
	
	CONSTRAINT "codCasaFK" FOREIGN KEY ("codCasa")
		REFERENCES "casa"(codigo)
		ON UPDATE CASCADE
		ON DELETE NO ACTION

	CONSTRAINT "CPFclienteFK" FOREIGN KEY ("COFcliente")
		REFERENCES "cliente"(CPF)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
)



CREATE TABLE "produto"(
	codigo serial,
	preco numeric(4,2),
	tipo varchar(50) NOT NULL,
	descricao varchar(200) NOT NULL,
	CONSTRAINT "produtoPK" PRIMARY KEY (codigo)
)



CREATE TABLE "cliente"(
	codCliente serial,
	nome varchar(150) NOT NULL,
	telefone char(13),
	CPF varchar(15) UNIQUE,
	email varchar(150) NOT NULL,
	CONSTRAINT "clientePK" PRIMARY KEY (CPF)
)

//colocar mais coisas no contrato

CREATE TABLE "contrato"(
	codigo integer,
	descricao varchar(200),
	CONSTRAINT "contratoPK" PRIMARY KEY (codigo)
)



CREATE TABLE "adocao"(
	codAdocao serial,
	data date,
	codAnimal integer,
	codCliente integer,
	codFuncionario integer,
	CONSTRAINT "adocaoPK" PRIMARY KEY (codigo),
		
	CONSTRAINT "adocaoAniFK" FOREIGN KEY ("CodAnimal")
		REFERENCES "animais"(codigo)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,

	CONSTRAINT "adocaoCliFK" FOREIGN KEY ("CPFcliente")
		REFERENCES "cliente"(CPF)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,

	CONSTRAINT "adocaoFunFK" FOREIGN KEY ("CPFfuncionario")
		REFERENCES "funcionario"(CPF)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
)



CREATE TABLE "produtoCliente"(
	codProduto integer,
	CPFcliente integer,
	
	CONSTRAINT "codProdutoFK" FOREIGN KEY ("codProduto")
		REFERENCES "produto"(codigo)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,

	CONSTRAINT "CPFclienteFK" FOREIGN KEY ("CPFcliente")
		REFERENCES "cliente"(CPF)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
)



CREATE TABLE "casaProduto"(
	codCasa integer,
	codProduto integer,
	
	CONSTRAINT "CEPcasaFK" FOREIGN KEY ("codProduto")
		REFERENCES "produto"(codigo)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,

	CONSTRAINT "CPFclienteFK" FOREIGN KEY ("codCasa")
		REFERENCES "casa"(codigo)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
)


CREATE TABLE "hospedagem"(
	data date,
	codAnimal integer,

	CONSTRAINT "codAnimalFK" FOREIGN KEY ("codAnimal")
		REFERENCES "animais"(codigo)
		ON UPDATE CASCADE
		ON DELETE NO ACTION

)
	























































	
