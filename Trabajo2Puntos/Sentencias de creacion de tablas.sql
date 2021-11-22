/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/*==============================================================*/



/*==============================================================*/
/* Table: CITAS                                                 */
/*==============================================================*/
create table CITAS (
   ID_CITA              INT4                 not null,
   ID_MASCOTA           INT4                 not null,
   ID_VETERINARIO       INT4                 not null,
   FECHA_CITA           DATE                 not null,
   constraint PK_CITAS primary key (ID_CITA)
);

/*==============================================================*/
/* Index: CITAS_PK                                              */
/*==============================================================*/
create unique index CITAS_PK on CITAS (
ID_CITA
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on CITAS (
ID_VETERINARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on CITAS (
ID_MASCOTA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   CEDULA_CL            VARCHAR(10)          not null,
   NOMBRE_CL            VARCHAR(45)          not null,
   APELLIDO_CL          VARCHAR(45)          not null,
   GENERO_CL            VARCHAR(15)          not null,
   DIRECCION_CL         VARCHAR(60)          not null,
   TELEFONO_CL          VARCHAR(15)          not null,
   FECHA_REGISTRO_CL    DATE                 not null,
   ANTIGUEDAD           NUMERIC(2)           not null,
   FECHA_ULTIMA_VISITA  DATE                 not null,
   CANT_MASCOTA         NUMERIC(3)           not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DETALLE_VACUNA                                        */
/*==============================================================*/
create table DETALLE_VACUNA (
   ID_DET_VACUNA        INT4                 not null,
   ID_VETERINARIO       INT4                 not null,
   ID_MASCOTA           INT4                 not null,
   ID_VACUNA            INT4                 not null,
   FECHA_APLICACION     DATE                 not null,
   DOSIS                NUMERIC(3,2)         not null,
   MET_ADQUISICION      VARCHAR(30)          not null,
   constraint PK_DETALLE_VACUNA primary key (ID_DET_VACUNA)
);

/*==============================================================*/
/* Index: DETALLE_VACUNA_PK                                     */
/*==============================================================*/
create unique index DETALLE_VACUNA_PK on DETALLE_VACUNA (
ID_DET_VACUNA
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on DETALLE_VACUNA (
ID_VETERINARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on DETALLE_VACUNA (
ID_MASCOTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on DETALLE_VACUNA (
ID_VACUNA
);

/*==============================================================*/
/* Table: HABITOS                                               */
/*==============================================================*/
create table HABITOS (
   ID_HABITO            INT4                 not null,
   NOMBRE_HAB           VARCHAR(25)          not null,
   DETALLE_HAB          TEXT                 not null,
   constraint PK_HABITOS primary key (ID_HABITO)
);

/*==============================================================*/
/* Index: HABITOS_PK                                            */
/*==============================================================*/
create unique index HABITOS_PK on HABITOS (
ID_HABITO
);

/*==============================================================*/
/* Table: MASCOTA                                               */
/*==============================================================*/
create table MASCOTA (
   ID_MASCOTA           INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_TIPO              INT4                 not null,
   NOMBRE_MASC          VARCHAR(45)          not null,
   FECH_NAC_MASC        DATE                 not null,
   GENERO_MASC          VARCHAR(15)          not null,
   COLOR_MASC           VARCHAR(15)          not null,
   ESTERIL              TEXT                 not null,
   constraint PK_MASCOTA primary key (ID_MASCOTA)
);

/*==============================================================*/
/* Index: MASCOTA_PK                                            */
/*==============================================================*/
create unique index MASCOTA_PK on MASCOTA (
ID_MASCOTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on MASCOTA (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on MASCOTA (
ID_TIPO
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   ID_PRODUCTO          INT4                 not null,
   ID_PROVEEDOR         INT4                 not null,
   ID_CLIENTE           INT4                 null,
   NOMBRE_PROD          VARCHAR(30)          not null,
   FECHA_VENTA          DATE                 null,
   PRECIO_PROD          FLOAT8               not null,
   constraint PK_PRODUCTOS primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTOS_PK                                          */
/*==============================================================*/
create unique index PRODUCTOS_PK on PRODUCTOS (
ID_PRODUCTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on PRODUCTOS (
ID_PROVEEDOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on PRODUCTOS (
ID_CLIENTE
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   ID_PROVEEDOR         INT4                 not null,
   NOMBRE_PROV          VARCHAR(45)          not null,
   TELEFONO_PROV        VARCHAR(15)          not null,
   constraint PK_PROVEEDOR primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
ID_PROVEEDOR
);

/*==============================================================*/
/* Table: RELATIONSHIP_4                                        */
/*==============================================================*/
create table RELATIONSHIP_4 (
   ID_HABITO            INT4                 not null,
   ID_MASCOTA           INT4                 not null,
   constraint PK_RELATIONSHIP_4 primary key (ID_HABITO, ID_MASCOTA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_4_PK on RELATIONSHIP_4 (
ID_HABITO,
ID_MASCOTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on RELATIONSHIP_4 (
ID_MASCOTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on RELATIONSHIP_4 (
ID_HABITO
);

/*==============================================================*/
/* Table: TIPO_ANIMAL                                           */
/*==============================================================*/
create table TIPO_ANIMAL (
   ID_TIPO              INT4                 not null,
   NOMBRE_TIPO          VARCHAR(20)          not null,
   constraint PK_TIPO_ANIMAL primary key (ID_TIPO)
);

/*==============================================================*/
/* Index: TIPO_ANIMAL_PK                                        */
/*==============================================================*/
create unique index TIPO_ANIMAL_PK on TIPO_ANIMAL (
ID_TIPO
);

/*==============================================================*/
/* Table: TIPO_VACUNA                                           */
/*==============================================================*/
create table TIPO_VACUNA (
   ID_VACUNA            INT4                 not null,
   NOMBRE_VAC           VARCHAR(25)          not null,
   constraint PK_TIPO_VACUNA primary key (ID_VACUNA)
);

/*==============================================================*/
/* Index: VACUNA_PK                                             */
/*==============================================================*/
create unique index VACUNA_PK on TIPO_VACUNA (
ID_VACUNA
);

/*==============================================================*/
/* Table: VETERINARIO                                           */
/*==============================================================*/
create table VETERINARIO (
   ID_VETERINARIO       INT4                 not null,
   CEDULA_VET           VARCHAR(10)          not null,
   NOMBRE_VET           VARCHAR(45)          not null,
   APELLIDO_VET         VARCHAR(45)          not null,
   TELEFONO_VET         VARCHAR(15)          not null,
   constraint PK_VETERINARIO primary key (ID_VETERINARIO)
);

/*==============================================================*/
/* Index: VETERINARIO_PK                                        */
/*==============================================================*/
create unique index VETERINARIO_PK on VETERINARIO (
ID_VETERINARIO
);

alter table CITAS
   add constraint FK_CITAS_RELATIONS_VETERINA foreign key (ID_VETERINARIO)
      references VETERINARIO (ID_VETERINARIO)
      on delete restrict on update restrict;

alter table CITAS
   add constraint FK_CITAS_RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

alter table DETALLE_VACUNA
   add constraint FK_DETALLE__RELATIONS_VETERINA foreign key (ID_VETERINARIO)
      references VETERINARIO (ID_VETERINARIO)
      on delete restrict on update restrict;

alter table DETALLE_VACUNA
   add constraint FK_DETALLE__RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

alter table DETALLE_VACUNA
   add constraint FK_DETALLE__RELATIONS_TIPO_VAC foreign key (ID_VACUNA)
      references TIPO_VACUNA (ID_VACUNA)
      on delete restrict on update restrict;

alter table MASCOTA
   add constraint FK_MASCOTA_RELATIONS_TIPO_ANI foreign key (ID_TIPO)
      references TIPO_ANIMAL (ID_TIPO)
      on delete restrict on update restrict;

alter table MASCOTA
   add constraint FK_MASCOTA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PRODUCTOS
   add constraint FK_PRODUCTO_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PRODUCTOS
   add constraint FK_PRODUCTO_RELATIONS_PROVEEDO foreign key (ID_PROVEEDOR)
      references PROVEEDOR (ID_PROVEEDOR)
      on delete restrict on update restrict;

alter table RELATIONSHIP_4
   add constraint FK_RELATION_RELATIONS_HABITOS foreign key (ID_HABITO)
      references HABITOS (ID_HABITO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_4
   add constraint FK_RELATION_RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

