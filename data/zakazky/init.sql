-- TODO: foreign keys? composite primary keys?

CREATE SCHEMA IF NOT EXISTS zakazky;

drop table if exists zakazky.etrziste_casti_vz;
create table zakazky.etrziste_casti_vz (
	VZsystemoveCislo varchar,
	CastVZcislo smallint,
	SmluvniCenaVcetneDPH numeric(14, 2),
	SmluvniCenaBezDPH numeric(14, 2),
	SmluvniCenaSazbaDPH numeric(14, 2),
	SmluvniCenaMena varchar -- TODO: enum?
);

drop table if exists zakazky.etrziste_polozky_vz;
create table zakazky.etrziste_polozky_vz (
	VZsystemoveCislo varchar,
	NIPEZkod varchar,
	NIPEZnazev varchar,
	NIPEZpovinnostProEtrziste varchar,
	NIPEZnazevVlastnosti varchar,
	NIPEZdatovyTypVlastnosti varchar,
	NIPEZhodnotaVlastnosti varchar,
	NIPEZmernaJednotkaVlastnosti varchar,
	NIPEZoperatorVlastnosti varchar
);

drop table if exists zakazky.etrziste_kriteria_vz;
create table zakazky.etrziste_kriteria_vz (
	VZsystemoveCislo varchar,
	DilciHodnoticiKriterium varchar,
	DilciHodnoticiKriteriumVaha numeric(5, 2),
	DilciKriteriumCiselneVyjadritelne varchar,
	DilciKriteriumPredmetemEaukce varchar,
	DilciKriteriumZadavatelPozadovalVlozeniNabidkovychHodnot varchar,
	SubkriteriumNabidkoveCeny varchar,
	SubkriteriumNabidkoveCenyVaha numeric(5, 2),
	SubkriteriumDilcihoKriteria varchar,
	SubkriteriumDilcihoKriteriaVaha numeric(5, 2),
	SubkriteriumCiselneVyjadritelne varchar,
	SubkriteriumPredmetemEaukce varchar,
	SubkriteriumZadavatelPozadovalVlozeniNabidkovychHodnot varchar
);

drop table if exists zakazky.etrziste_dodavatele;
create table zakazky.etrziste_dodavatele (
	VZsystemoveCislo varchar,
	CastVZcislo smallint,
	DatumUzavreniSmlouvy timestamp,
	DodavatelUredniNazev varchar,
	DodavatelICO int,
	DodavatelStat varchar
);

drop table if exists zakazky.etrziste_vz;
create table zakazky.etrziste_vz (
	NazevEtrziste varchar,
	VZsystemoveCislo varchar,
	NazevVZ varchar,
	VZstav varchar,
	VZdruh varchar,
	VZtyp varchar,
	DruhZadavaciRizeni varchar,
	PredpokladanaHodnotaVZ numeric(14, 2),
	CelkovaSmluvniCenaBezDPH numeric(14, 2),
	CelkovaSmluvniCenaVcetneDPH numeric(14, 2),
	CelkovaSmluvniCenaMena varchar,
	ZadavatelNazev varchar,
	ZadavatelICO int,
	ZadavatelKategorie varchar,
	VysledekZadavacihoRizeni varchar,
	DatumUzavreniSmlouvy date,
	DelenaNaCasti varchar,
	PocetCasti varchar,
	PocetPolozekVZ varchar,
	MetodaHodnoceni varchar,
	ZakladniHodnoticiKriterium varchar,
	ZruseniVZ varchar,
	DatumZruseniZadavacihoRizeni date,
	BylaDoZRzarazenaEaukce varchar,
	PocetVyzvanychDodavatelu varchar,
	PocetObdrzenychNabidek varchar,
	PocetHodnocenychNabidek varchar,
	NamitkyPocet varchar,
	NamitkyVyhoveno varchar,
	PrezkumUkonu varchar,
	PrezkumnychRizeniPocet varchar,
	ZadostioDodatecneInformacePocet varchar,
	DodavatelNazev varchar,
	dodavatelICO int
);

drop table if exists zakazky.vvz_casti_vz;
create table zakazky.vvz_casti_vz (
	EvidencniCisloVZnaVVZ varchar,
	CisloFormulareNaVVZ varchar,
	CisloCastiZadaniVZ varchar,
	NazevCastiVZ varchar,
	DatumZadaniVZ date,
	PocetObdrzenychNabidek int,
	DodavatelNazev varchar,
	DodavatelICOZeZadani int,
	DodavatelPostovniAdresa varchar,
	DodavatelObec varchar,
	DodavatelPSC varchar,
	DodavatelStat varchar,
	DodavatelWww varchar,
	PuvodniOdhadovanaCelkovaHodnotaVZ numeric(16, 2),
	PuvodniOdhadovanaCelkovaHodnotaVZMena varchar,
	PuvodniOdhadovanaCelkovaHodnotaVZsazbaDPH varchar,
	PuvodniOdhadovanaCelkovaHodnotaVZprocentniSazbaDPH numeric(4, 2),
	CelkovaKonecnaHodnotaVZzaZadani varchar,
	CelkovaKonecnaHodnotaVZmenaZaZadani varchar,
	CelkovaKonecnaHodnotaVZSazbaDPHzaZadani varchar,
	CelkovaKonecnaHodnotaVZprocentniSazbaDPHzaZadani varchar,
	HodnotaNejnizsiNabidky numeric(14, 2),
	HodnotaNejnizsiNabidkyMena varchar,
	HodnotaNejnizsiNabidkySazbaDPH varchar,
	HodnotaNejnizsiNabidkyProcentniSazbaDPH numeric(4, 2),
	RocniCiMesicniHodnotaPocetRoku int,
	RocniCiMesicniHodnotaPocetMesicu int,
	SubdodavkyHodnotaBezDPH numeric(14, 2),
	SubdodavkyMena varchar,
	SubdodavkyPomer numeric(5, 2),
	PlatnyFormular bool
);

drop table if exists zakazky.vvz_vz;
create table zakazky.vvz_vz (
	EvidencniCisloVZnaVVZ varchar,
	CisloFormulareNaVVZ varchar,
	DruhFormulare varchar,
	TypFormulare varchar,
	VZdelenaNaCasti varchar,
	ZadavatelICO int,
	DodavatelICO int,
	LimitVZ varchar,
	DatumOdeslaniFormulareNaVVZ date,
	DatumUverejneni date,
	ZadavatelUredniNazev varchar,
	ZadavatelDruh varchar,
	ZadavatelHlavniPredmetCinnosti varchar,
	ZadavatelZadavaJmenemJinych varchar,
	NazevVZ varchar,
	DruhVZ varchar,
	KategorieSluzeb varchar,
	HlavniMistoPlneni varchar,
	StrucnyPopisVZ varchar,
	CPVhlavni varchar,
	CPVdoplnkovy1 varchar,
	CPVdoplnkovy2 varchar,
	DruhyPredmetCPVhlavni varchar,
	DruhyPredmetCPVdoplnkovy1 varchar,
	DruhyPredmetCPVdoplnkovy2 varchar,
	TretiPredmetCPVhlavni varchar,
	TretiPredmetCPVdoplnkovy1 varchar,
	TretiPredmetCPVdoplnkovy2 varchar,
	CtvrtyPredmetCPVhlavni varchar,
	CtvrtyPredmetCPVdoplnkovy1 varchar,
	CtvrtyPredmetCPVdoplnkovy2 varchar,
	PatyPredmetCPVhlavni varchar,
	PatyPredmetCPVdoplnkovy1 varchar,
	PatyPredmetCPVdoplnkovy2 varchar,
	NaVZseVztahujeGPA varchar,
	CelkovaKonecnaHodnotaVZ varchar,
	CelkovaKonecnaHodnotaVZmena varchar,
	CelkovaKonecnaHodnotaVZsazbaDPH varchar,
	CelkovaKonecnaHodnotaVZprocentniSazbaDPH varchar,
	NejnizsiNabidkaVzataVuvahu varchar,
	NejnizsiNabidkaVzataVuvahuMena varchar,
	NejnizsiNabidkaVzataVuvahuSazbaDPH varchar,
	NejnizsiNabidkaVzataVuvahuProcentniSazbaDPH varchar,
	NejvyssiNabidkaVzataVuvahu varchar,
	DruhRizeni varchar,
	HlavniKriteriaProZadaniZakazky varchar,
	Kriterium1 varchar,
	VahaKriteria1 varchar,
	Kriterium2 varchar,
	VahaKriteria2 varchar,
	Kriterium3 varchar,
	VahaKriteria3 varchar,
	Kriterium4 varchar,
	VahaKriteria4 varchar,
	Kriterium5 varchar,
	VahaKriteria5 varchar,
	Kriterium6 varchar,
	VahaKriteria6 varchar,
	Kriterium7 varchar,
	VahaKriteria7 varchar,
	Kriterium8 varchar,
	VahaKriteria8 varchar,
	Kriterium9 varchar,
	VahaKriteria9 varchar,
	Kriterium10 varchar,
	VahaKriteria10 varchar,
	BylaPouzitaElektronickaDrazba varchar,
	ZakazkaSeVztahujeKprojektuFinZes varchar,
	ProjektyCiprogramy varchar,
	OdhadovanaHodnotaVZbezDPH numeric(14, 2),
	OdhadovanaHodnotaVZmena varchar,
	OdhadovanaHodnotaVZrozsahOd numeric(14, 2),
	OdhadovanaHodnotaVZrozsahDo numeric(14, 2),
	OdhadovanaHodnotaVZrozsahMena varchar,
	PlatnyFormular bool
);

drop table if exists zakazky.zzvz_zadani_vz;
create table zakazky.zzvz_zadani_vz (
	ID_Zakazky varchar,
	EvidencniCisloVZnaVVZ varchar,
	CisloFormulareNaVVZ varchar,
	DruhFormulare varchar,
	ID_Zadani varchar,
	CisloCastiZadaniVZ varchar,
	NazevCastiVZ varchar,
	ZadaniCastiZakazky varchar,
	InformaceONezadaniCastiZakazky varchar,
	DatumZadaniVZ timestamp,
	PocetObdrzenychNabidek varchar,
	PuvodniOdhadovanaCelkovaHodnotaVZ numeric(16, 2),
	PuvodniOdhadovanaCelkovaHodnotaVZMena varchar,
	CelkovaKonecnaHodnotaVZzaZadani numeric(16, 2),
	CelkovaKonecnaHodnotaVZmenaZaZadani varchar,
	HodnotaNejnizsiNabidky numeric(14, 2),
	HodnotaNejnizsiNabidkyMena varchar,
	HodnotaNejvyssiNabidky numeric(14, 2),
	SubdodavkyHodnotaBezDPH numeric(14, 2),
	SubdodavkyMena varchar,
	SubdodavkyPomer numeric(5, 2),
	DatumOdeslaniFormulareNaVVZ timestamp,
	PlatnyFormular bool
);

drop table if exists zakazky.zzvz_casti_vz;
create table zakazky.zzvz_casti_vz (
	ID_Zakazky varchar,
	EvidencniCisloVZnaVVZ varchar,
	CisloFormulareNaVVZ varchar,
	DruhFormulare varchar,
	ID_CastiVZ varchar,
	CisloCastiVZ varchar,
	NazevCastiVZ varchar,
	PopisCastiVZ varchar,
	PredpokladanaCelkovaHodnotaCastiVZ numeric(14, 2),
	PredpokladanaCelkovaHodnotaCastiVZMena varchar,
	HlavniMistoPlneniNUTS varchar,
	HlavniMistoPlneni varchar,
	CPVkod varchar,
	ZakazkaSeVztahujeKprojektuFinZes varchar,
	ProjektyCiProgramyFinZes varchar,
	DatumOdeslaniFormulareNaVVZ timestamp,
	PlatnyFormular bool
);

drop table if exists zakazky.zzvz_dodavatele;
create table zakazky.zzvz_dodavatele (
	ID_Zakazky varchar,
	EvidencniCisloVZnaVVZ varchar,
	CisloFormulareNaVVZ varchar,
	DruhFormulare varchar,
	ID_Zadani varchar,
	CisloCastiZadaniVZ varchar,
	NazevCastiVZ varchar,
	DodavatelICO int,
	DodavatelNazev varchar,
	DodavatelPostovniAdresa varchar,
	DodavatelObec varchar,
	DodavatelPSC varchar,
	DodavatelStat varchar,
	DodavatelWww varchar,
	DatumOdeslaniFormulareNaVVZ timestamp,
	PlatnyFormular bool
);

drop table if exists zakazky.zzvz_vz;
create table zakazky.zzvz_vz (
	ID_Zakazky varchar,
	EvidencniCisloVZnaVVZ varchar,
	CisloFormulareNaVVZ varchar,
	DruhFormulare varchar,
	TypFormulare varchar,
	VZdelenaNaCasti varchar,
	ZadavatelICO int,
	LimitVZ varchar,
	DatumOdeslaniFormulareNaVVZ timestamp,
	DatumUverejneni timestamp,
	ZadavatelUredniNazev varchar,
	ZadavatelDruh varchar,
	ZadavatelHlavniPredmetCinnosti varchar,
	ZakazkaZahrnujeSpolecneZadavaniZakazek varchar,
	ZakazkuZadavaCentralniZadavatel varchar,
	ZadavatelProfilURL varchar,
	ZadavatelProfilURLPlatnost varchar,
	ZadavatelProfilZruseniTyp varchar,
	ZadavatelProfilURLNova varchar,
	DatumZruseniCiZneaktivneniProfilu timestamp,
	NazevVZ varchar,
	DruhVZ varchar,
	StrucnyPopisVZ varchar,
	CPVhlavni varchar,
	CPVdoplnkovy1 varchar,
	NaVZseVztahujeGPA varchar,
	CelkovaKonecnaHodnotaVZ numeric(14, 2),
	CelkovaKonecnaHodnotaVZmena varchar,
	NejnizsiNabidkaVzataVuvahu numeric(14, 2),
	NejnizsiNabidkaVzataVuvahuMena varchar,
	NejvyssiNabidkaVzataVuvahu numeric(14, 2),
	DruhRizeni varchar,
	BylaPouzitaElektronickaDrazba varchar,
	OdhadovanaHodnotaVZbezDPH numeric(14, 2),
	OdhadovanaHodnotaVZmena varchar,
	ZadavatelKontaktniOsoba varchar,
	ZadavatelEmail varchar,
	ZadavatelTelefon varchar,
	LhutaProDoruceniNabidek varchar,
	OteviraniNabidekDatumCas timestamp,
	OteviraniNabidekMisto varchar,
	OteviraniNabidekOpravneneOsobyDalsiInfo varchar,
	UchazecVazanNabidkouDo varchar,
	UchazecVazanNabidkouDobaMesice varchar,
	PlatnyFormular varchar,
	PravidelnePredbezneOznameni varchar,
	PravidelnePredbezneOznameniVyzvaKSoutezi varchar,
	PredbezneOznameni varchar,
	PredbezneOznameniVyzvaKSoutezi varchar,
	SystemKvalifikace varchar,
	SystemKvalifikaceVyzvaKSoutezi varchar,
	OznameniOZahajeniZR varchar,
	OznameniOVysledkuZR varchar,
	OznameniOVysledkuKS varchar
);

drop table if exists zakazky.zzvz_kriteria_vz;
create table zakazky.zzvz_kriteria_vz (
	ID_Zakazky varchar,
	ID_PopisuCastiZakazky varchar,
	EvidencniCisloVZnaVVZ varchar,
	CisloFormulareNaVVZ varchar,
	DruhFormulare varchar,
	CisloCastiVZ varchar,
	NazevCastiVZ varchar,
	PoradiKriteria varchar,
	KriteriumZadaniZakazky varchar,
	NazevKriteria varchar,
	VahaKriteria varchar,
	DatumOdeslaniFormulareNaVVZ timestamp,
	PlatnyFormular bool
);

