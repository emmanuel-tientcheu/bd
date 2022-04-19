drop table if exists ESEIGNANT;

drop table if exists NIVEAU;

drop table if exists OCCUPER;

drop table if exists PERIODE;

drop table if exists SALLE;

drop table if exists UE;



/*==============================================================*/
/* Table: ESEIGNANT                                             */
/*==============================================================*/
create table ESEIGNANT
(
   MATRICULEENS         varchar(15) not null,
   NOMENS               varchar(50),
   PRENOMENS            varchar(25),
   TELENS               varchar(15),
   primary key (MATRICULEENS)
);

/*==============================================================*/
/* Table: NIVEAU                                                */
/*==============================================================*/
create table NIVEAU
(
   IDNIVEAU             varchar(15) not null,
   NOMNIVEAU            varchar(25),
   primary key (IDNIVEAU)
);

/*==============================================================*/
/* Table: OCCUPER                                               */
/*==============================================================*/
create table OCCUPER
(
   IDSALLE              varchar(15) not null,
   MATRICULEENS         varchar(15) not null,
   IDPERIODE            int not null,
   PRESENCE             bool,
   primary key (IDSALLE, MATRICULEENS, IDPERIODE)
);

/*==============================================================*/
/* Table: PERIODE                                               */
/*==============================================================*/
create table PERIODE
(
   IDPERIODE            int not null,
   DATECOUR             timestamp,
   HEUREDEPAT           time,
   HEUREFIN             time,
   primary key (IDPERIODE)
);

/*==============================================================*/
/* Table: SALLE                                                 */
/*==============================================================*/
create table SALLE
(
   IDSALLE              varchar(15) not null,
   NOMSALLE             varchar(15),
   primary key (IDSALLE)
);

/*==============================================================*/
/* Table: UE                                                    */
/*==============================================================*/
create table UE
(
   IDUE                 varchar(15) not null,
   MATRICULEENS         varchar(15) not null,
   IDNIVEAU             varchar(15) not null,
   INTITITULE           varchar(150),
   primary key (IDUE)
);

alter table OCCUPER add constraint FK_OCCUPER foreign key (IDSALLE)
      references SALLE (IDSALLE) on delete restrict on update restrict;

alter table OCCUPER add constraint FK_OCCUPER2 foreign key (MATRICULEENS)
      references ESEIGNANT (MATRICULEENS) on delete restrict on update restrict;

alter table OCCUPER add constraint FK_OCCUPER3 foreign key (IDPERIODE)
      references PERIODE (IDPERIODE) on delete restrict on update restrict;

alter table UE add constraint FK_APPARTENIR foreign key (IDNIVEAU)
      references NIVEAU (IDNIVEAU) on delete restrict on update restrict;

alter table UE add constraint FK_ENSEIGNE foreign key (MATRICULEENS)
      references ESEIGNANT (MATRICULEENS) on delete restrict on update restrict;
