

CREATE TABLE Morador (
    bloco VARCHAR2(10),
    numApart NUMBER(10, 2),
    valorAluguel FLOAT,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
); 

CREATE TABLE Sindico (
    inicioMandato DATE NOT NULL,
    fimMandato DATE,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

CREATE TABLE Condominio (
    idCondominio NUMBER PRIMARY KEY,
    nome VARCHAR2(50) NOT NULL,
    endereco VARCHAR2(50),
    num NUMBER(10, 2),
    cep VARCHAR2(15),
    bairro VARCHAR2(30),
    cidade VARCHAR2(20),
    estado VARCHAR2(15),
    proprietario VARCHAR2(45),
    cnpj VARCHAR2(15) UNIQUE
);


CREATE TABLE Condominos (
    idCondomino NUMBER PRIMARY KEY,
    nome VARCHAR2(50) NOT NULL,
    nomeMae VARCHAR2(50) NOT NULL,
    dataNasc DATE,
    cpf VARCHAR2(15) UNIQUE NOT NULL,
    tel VARCHAR2(15) NOT NULL,
    email VARCHAR2(50),
    senha VARCHAR2(50),
    tipo VARCHAR2(15),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);


CREATE TABLE Tarefas (
    idTarefa NUMBER PRIMARY KEY,
    nome VARCHAR2(45) NOT NULL,
    status VARCHAR2(15) DEFAULT 'pendente',
    dataConclusao DATE,
    descricao VARCHAR2(45),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);


CREATE TABLE Portaria (
    idPortaria NUMBER PRIMARY KEY,
    porteiro VARCHAR2(45),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);


CREATE TABLE Mensagem (
    id NUMBER PRIMARY KEY,
    destinatario VARCHAR2(50),
    mensagem VARCHAR2(50),
    Condominios_idCondominio NUMBER NOT NULL,
    Portaria_idPortaria NUMBER,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio),
    FOREIGN KEY (Portaria_idPortaria) REFERENCES Portaria (idPortaria)
);


CREATE TABLE Solicitacoes (
    idSolicitacao NUMBER PRIMARY KEY,
    solicitacao VARCHAR2(50),
    justificativa VARCHAR2(50),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);