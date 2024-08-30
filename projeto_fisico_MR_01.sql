CREATE TABLE departamento(
    cod_depto       NUMBER(4)       CONSTRAINT  emp_departamento_pk         PRIMARY KEY,
    desc_depto      VARCHAR2(30)    NOT NULL);

CREATE TABLE processo_seletivo(
    cod_processo    NUMBER(6)       CONSTRAINT  emp_processo_seletivo_pk    PRIMARY KEY,
    desc_processo   VARCHAR2(80)    NOT NULL);

CREATE TABLE cargo(
    cod_cargo       NUMBER(4)       CONSTRAINT  emp_cargo_pk                PRIMARY KEY,
    desc_cargo      VARCHAR2(30)    NOT NULL);

CREATE TABLE candidato(
    cod_candidato   NUMBER(5)       CONSTRAINT  emp_candidato_pk            PRIMARY KEY,
    nome            VARCHAR2(60)    UNIQUE,
    cpf             NUMBER(11)      UNIQUE);

CREATE TABLE funcionario(
    matricula       NUMBER(5)       CONSTRAINT  emp_funcionario_pk          PRIMARY KEY,
    cod_depto       NUMBER(4)       CONSTRAINT  emp_cod_dept_nn             NOT NULL,       
    cod_cargo       NUMBER(4)       CONSTRAINT  emp_cod_cargo_nn            NOT NULL,
    Gerente         NUMBER(5),
    nome            VARCHAR2(50)    UNIQUE,
    cpf             NUMBER(11)      UNIQUE,
    rg              CHAR(15)        UNIQUE);

CREATE TABLE candidato_funcionario(
    cod_inscricao   NUMBER(5)       CONSTRAINT  emp_pk_cod_inscricao        PRIMARY KEY,
    matricula       NUMBER(5)       CONSTRAINT  emp_cod_matricula_nn        NOT NULL,
    cod_candidato   NUMBER(5)       CONSTRAINT  emp_cod_candidato_nn        NOT NULL,
    dt_inscricao    DATE            NOT NULL);

CREATE TABLE inscricao(
    nr_inscricao   NUMBER(5)        CONSTRAINT   emp_pk_candidato_cargo      PRIMARY KEY,
    cod_candidato   NUMBER(5)       CONSTRAINT  emp_cod_candidato_nn_2      NOT NULL,
    cod_cargo       NUMBER(4)       CONSTRAINT  emp_cod_cargo_nn_2          NOT NULL,
    dt_inscricao    DATE            NOT NULL);

CREATE TABLE teste(
    cod_teste       NUMBER(5)       CONSTRAINT  emp_pk_cod_teste            PRIMARY KEY,
    cod_processo    NUMBER(6)       CONSTRAINT  emp_cod_processo_nn         NOT NULL,
    cod_cargo       NUMBER(4)       CONSTRAINT  emp_cod_cargo_nn_3          NOT NULL,
    nr_inscricao    NUMBER(5)       CONSTRAINT  emp_nr_inscricao_nn         NOT NULL,
    dt_teste        DATE            NOT NULL,
    nota            NUMBER(4,2));

ALTER TABLE funcionario
ADD CONSTRAINT emp_departamento_fk
FOREIGN KEY (cod_depto)
REFERENCES departamento(cod_depto);

ALTER TABLE funcionario
ADD CONSTRAINT emp_cod_cargo_fk
FOREIGN KEY (cod_cargo)
REFERENCES cargo(cod_cargo);

ALTER TABLE candidato_funcionario
ADD CONSTRAINT emp_cod_matricula_fk
FOREIGN KEY (matricula)
REFERENCES funcionario(matricula);

ALTER TABLE candidato_funcionario
ADD CONSTRAINT emp_cod_candidato_fk
FOREIGN KEY (cod_candidato)
REFERENCES candidato(cod_candidato);

ALTER TABLE inscricao
ADD CONSTRAINT emp_cod_candidato_fk_2
FOREIGN KEY (cod_candidato)
REFERENCES candidato(cod_candidato);

ALTER TABLE inscricao
ADD CONSTRAINT emp_cod_cargo_fk_2
FOREIGN KEY (cod_cargo)
REFERENCES cargo(cod_cargo);

ALTER TABLE teste
ADD CONSTRAINT emp_processo_seletivo_fk
FOREIGN KEY (cod_processo)
REFERENCES processo_seletivo(cod_processo);

ALTER TABLE teste
ADD CONSTRAINT emp_cod_cargo_fk_3
FOREIGN KEY (cod_cargo)
REFERENCES cargo(cod_cargo);

ALTER TABLE teste
ADD CONSTRAINT emp_nr_inscricao_fk
FOREIGN KEY (nr_inscricao)
REFERENCES inscricao(nr_inscricao);