DROP comuna;
DROP direccion;
DROP sucursal;
DROP bono;

CREATE TABLE comuna
    (
    id_comuna NUMERIC(5) NOT NULL
    ,nom_comuna VARCHAR(20) NOT NULL    
    )
;

CREATE TABLE direccion
    (
    id_direccion NUMERIC(5) NOT NULL
    ,calle VARCHAR (20) NOT NULL
    ,numero NUMERIC (6) NOT NULL
    ,of_depto CHAR (5) NULL
    ,FK_id_comuna NUMERIC (5) NOT NULL
    ,CONSTRAINT PK_direccion PRIMARY KEY (id_direccion)
    ,CONSTRAINT FK_direccion_comuna FOREIGN KEY (FK_id_comuna)
        REFERENCES comuna(id_comuna)
    )
;

CREATE TABLE sucursal
    (
    id_sucursal NUMERIC (5) NOT NULL
    ,nom_sucursal VARCHAR (20) NOT NULL
    ,FK_id_comuna NUMERIC (5) NOT NULL
    ,CONSTRAINT PK_sucursal PRIMARY KEY (id_sucursal)
    ,CONSTRAINT FK_sucursal_comuna FOREIGN KEY (FK_id_sucursal)
    )
;

CREATE TABLE bono
    (
    id_bono NUMERIC (5) NOT NULL
    ,nro_bono NUMERIC (10) NOT NULL
    ,fecha_hora_bono DATE NOT NULL
    ,fecha_venc_bono DATE NOT NULL
    ,total_bono NUMERIC (10) NOT NULL
    ,FK_id_cajero NUMERIC (5) NOT NULL
    ,FK_id_beneficiario NUMERIC (5) NOT NULL
    ,CONSTRAINT PK_bono PRIMARY KEY (id_bono)
    ,CONSTRAINT FK_bono_beneficiario FOREIGN KEY (FK_id_beneficiario)
    ,CONSTRAINT FK_bono_cajero FOREIGN KEY (FK_id_cajero)
    )