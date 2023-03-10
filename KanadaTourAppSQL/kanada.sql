PGDMP                         z         
   kanada_tur    15.1    15.1 g    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16468 
   kanada_tur    DATABASE     ?   CREATE DATABASE kanada_tur WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1254';
    DROP DATABASE kanada_tur;
                postgres    false            ?            1255    24711    kdvli(bigint)    FUNCTION     ?   CREATE FUNCTION public.kdvli(mst_ucret bigint) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
begin
mst_ucret:=mst_ucret*1.2+mst_ucret;
return mst_ucret;
end;
$$;
 .   DROP FUNCTION public.kdvli(mst_ucret bigint);
       public          postgres    false            ?            1255    24703    musteri_ekle(integer, text) 	   PROCEDURE     ?   CREATE PROCEDURE public.musteri_ekle(IN p1 integer, IN p2 text)
    LANGUAGE sql
    AS $$
insert into musteri(mst_id, mst_adsoyad) values (p1,p2);
$$;
 ?   DROP PROCEDURE public.musteri_ekle(IN p1 integer, IN p2 text);
       public          postgres    false            ?            1255    24714    musterigetir(character varying)    FUNCTION       CREATE FUNCTION public.musterigetir(prmt character varying) RETURNS TABLE(idsutun integer, musteriadsoyad character varying)
    LANGUAGE plpgsql
    AS $$
Begin
	Return Query
	Select
	mst_id,
	mst_adsoyad
From
	musteri
Where
	mst_adsoyad like prmt;
End;
$$;
 ;   DROP FUNCTION public.musterigetir(prmt character varying);
       public          postgres    false            ?            1255    24722    test()    FUNCTION     ?   CREATE FUNCTION public.test() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update toplammusteri set sayi=sayi+1;
return new;
end;
$$;
    DROP FUNCTION public.test();
       public          postgres    false            ?            1255    24736    test1()    FUNCTION       CREATE FUNCTION public.test1() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
	uzunluk integer;
begin
uzunluk:=(select length(mst_adsoyad) from musteri order by mst_id desc limit 1);
update toplammusteriiki set sayi=sayi+uzunluk;
return new;
end;
$$;
    DROP FUNCTION public.test1();
       public          postgres    false            ?            1255    24743    test2()    FUNCTION     ?   CREATE FUNCTION public.test2() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
	karakter integer;
begin
karakter:=(select length(tur_ad) from tur order by tur_id desc limit 1);
update toplamturiki set sayi=sayi+karakter;
return new;
end;
$$;
    DROP FUNCTION public.test2();
       public          postgres    false            ?            1255    24729 	   testtwo()    FUNCTION     ?   CREATE FUNCTION public.testtwo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update toplamtur set sayi=sayi+1;
return new;
end;
$$;
     DROP FUNCTION public.testtwo();
       public          postgres    false            ?            1255    24704    tur_ekle(integer, text) 	   PROCEDURE     ?   CREATE PROCEDURE public.tur_ekle(IN p1 integer, IN p2 text)
    LANGUAGE sql
    AS $$
insert into tur(tur_id, tur_ad) values (p1,p2);
$$;
 ;   DROP PROCEDURE public.tur_ekle(IN p1 integer, IN p2 text);
       public          postgres    false            ?            1255    24716    turgetir(character varying)    FUNCTION     ?   CREATE FUNCTION public.turgetir(prmt character varying) RETURNS TABLE(idsutun integer, tur_adsutun character varying)
    LANGUAGE plpgsql
    AS $$
Begin
	Return Query
	Select
	tur_id,
	tur_ad
From
	tur
Where
	tur_ad like prmt;
End;
$$;
 7   DROP FUNCTION public.turgetir(prmt character varying);
       public          postgres    false            ?            1259    16515    adres    TABLE        CREATE TABLE public.adres (
    mst_id integer NOT NULL,
    mst_sehir character varying(50),
    mst_postakodu character varying(50) NOT NULL,
    mst_ulke character varying(50),
    mst_kita character varying(50),
    mst_fatura character varying(50)
);
    DROP TABLE public.adres;
       public         heap    postgres    false            ?            1259    16540    fatura    TABLE     |   CREATE TABLE public.fatura (
    mst_id integer NOT NULL,
    mst_sehir character varying,
    mst_ucret bigint NOT NULL
);
    DROP TABLE public.fatura;
       public         heap    postgres    false            ?            1259    16535    kita    TABLE     ?   CREATE TABLE public.kita (
    mst_id integer NOT NULL,
    mst_kita character varying(50) NOT NULL,
    mst_ulke character varying(50),
    mst_sehir character varying(50)
);
    DROP TABLE public.kita;
       public         heap    postgres    false            ?            1259    16479    mst_tipi    TABLE     ?   CREATE TABLE public.mst_tipi (
    mst_tipiid integer NOT NULL,
    mst_id character varying(50) NOT NULL,
    mst_adsoyad character varying(50),
    mst_cinsiyet character varying(5)
);
    DROP TABLE public.mst_tipi;
       public         heap    postgres    false            ?            1259    24633    mst_tur    TABLE     9   CREATE TABLE public.mst_tur (
    id integer NOT NULL
);
    DROP TABLE public.mst_tur;
       public         heap    postgres    false            ?            1259    16469    musteri    TABLE       CREATE TABLE public.musteri (
    mst_id integer NOT NULL,
    mst_adsoyad character varying(50),
    mst_cinsiyet character varying(5),
    mst_turid integer,
    mst_odano integer,
    mst_ucak integer,
    mst_tcno bigint,
    mst_tel character varying(20)
);
    DROP TABLE public.musteri;
       public         heap    postgres    false            ?            1259    16510    otel    TABLE     ?   CREATE TABLE public.otel (
    id integer NOT NULL,
    mst_odano character varying(50) NOT NULL,
    sure character varying(50),
    mst_id integer
);
    DROP TABLE public.otel;
       public         heap    postgres    false            ?            1259    16520 	   postakodu    TABLE     ?   CREATE TABLE public.postakodu (
    mst_id integer NOT NULL,
    mst_postakodu character varying(50) NOT NULL,
    mst_sehir character varying(50)
);
    DROP TABLE public.postakodu;
       public         heap    postgres    false            ?            1259    16490    rehber    TABLE     ?   CREATE TABLE public.rehber (
    tur_id integer NOT NULL,
    id integer NOT NULL,
    rehber character varying(50) NOT NULL,
    mst_id integer
);
    DROP TABLE public.rehber;
       public         heap    postgres    false            ?            1259    16525    sehir    TABLE     ?   CREATE TABLE public.sehir (
    mst_id integer NOT NULL,
    mst_sehir character varying(50) NOT NULL,
    mst_postakodu character varying(50)
);
    DROP TABLE public.sehir;
       public         heap    postgres    false            ?            1259    16500    sure    TABLE     ?   CREATE TABLE public.sure (
    mst_id integer NOT NULL,
    tur_id integer NOT NULL,
    sure character varying(50) NOT NULL
);
    DROP TABLE public.sure;
       public         heap    postgres    false            ?            1259    16552    telefon    TABLE     ?   CREATE TABLE public.telefon (
    id integer NOT NULL,
    mst_odano integer,
    mst_ucak integer,
    tel bigint,
    mst_id integer
);
    DROP TABLE public.telefon;
       public         heap    postgres    false            ?            1259    24717    toplammusteri    TABLE     A   CREATE TABLE public.toplammusteri (
    sayi integer NOT NULL
);
 !   DROP TABLE public.toplammusteri;
       public         heap    postgres    false            ?            1259    24731    toplammusteriiki    TABLE     D   CREATE TABLE public.toplammusteriiki (
    sayi integer NOT NULL
);
 $   DROP TABLE public.toplammusteriiki;
       public         heap    postgres    false            ?            1259    24724 	   toplamtur    TABLE     =   CREATE TABLE public.toplamtur (
    sayi integer NOT NULL
);
    DROP TABLE public.toplamtur;
       public         heap    postgres    false            ?            1259    24738    toplamturiki    TABLE     @   CREATE TABLE public.toplamturiki (
    sayi integer NOT NULL
);
     DROP TABLE public.toplamturiki;
       public         heap    postgres    false            ?            1259    16474    tur    TABLE     ?   CREATE TABLE public.tur (
    tur_id integer NOT NULL,
    mst_id integer,
    tur_ad character varying(50) NOT NULL,
    tur_suresi character varying(50),
    tur_fatura character varying(50),
    yemek_id integer,
    rehber_id integer
);
    DROP TABLE public.tur;
       public         heap    postgres    false            ?            1259    16505    ucak    TABLE     s   CREATE TABLE public.ucak (
    id integer NOT NULL,
    ucak character varying(50) NOT NULL,
    mst_id integer
);
    DROP TABLE public.ucak;
       public         heap    postgres    false            ?            1259    16547    ucret    TABLE     ?   CREATE TABLE public.ucret (
    id integer NOT NULL,
    mst_ucret bigint NOT NULL,
    mst_sehir character varying(50),
    mst_id integer
);
    DROP TABLE public.ucret;
       public         heap    postgres    false            ?            1259    16530    ulke    TABLE     ?   CREATE TABLE public.ulke (
    mst_id integer NOT NULL,
    mst_ulke character varying(50) NOT NULL,
    mst_postakodu character varying(50)
);
    DROP TABLE public.ulke;
       public         heap    postgres    false            ?            1259    16495    yemek    TABLE     ?   CREATE TABLE public.yemek (
    id integer NOT NULL,
    yemek character varying(50) NOT NULL,
    sure character varying(50),
    mst_id integer
);
    DROP TABLE public.yemek;
       public         heap    postgres    false            ?          0    16515    adres 
   TABLE DATA           a   COPY public.adres (mst_id, mst_sehir, mst_postakodu, mst_ulke, mst_kita, mst_fatura) FROM stdin;
    public          postgres    false    222   ?q       ?          0    16540    fatura 
   TABLE DATA           >   COPY public.fatura (mst_id, mst_sehir, mst_ucret) FROM stdin;
    public          postgres    false    227   6r       ?          0    16535    kita 
   TABLE DATA           E   COPY public.kita (mst_id, mst_kita, mst_ulke, mst_sehir) FROM stdin;
    public          postgres    false    226   }r       ?          0    16479    mst_tipi 
   TABLE DATA           Q   COPY public.mst_tipi (mst_tipiid, mst_id, mst_adsoyad, mst_cinsiyet) FROM stdin;
    public          postgres    false    216   ?r       ?          0    24633    mst_tur 
   TABLE DATA           %   COPY public.mst_tur (id) FROM stdin;
    public          postgres    false    230   s       ?          0    16469    musteri 
   TABLE DATA           w   COPY public.musteri (mst_id, mst_adsoyad, mst_cinsiyet, mst_turid, mst_odano, mst_ucak, mst_tcno, mst_tel) FROM stdin;
    public          postgres    false    214   /s       ?          0    16510    otel 
   TABLE DATA           ;   COPY public.otel (id, mst_odano, sure, mst_id) FROM stdin;
    public          postgres    false    221   ?t       ?          0    16520 	   postakodu 
   TABLE DATA           E   COPY public.postakodu (mst_id, mst_postakodu, mst_sehir) FROM stdin;
    public          postgres    false    223   ?t       ?          0    16490    rehber 
   TABLE DATA           <   COPY public.rehber (tur_id, id, rehber, mst_id) FROM stdin;
    public          postgres    false    217   2u       ?          0    16525    sehir 
   TABLE DATA           A   COPY public.sehir (mst_id, mst_sehir, mst_postakodu) FROM stdin;
    public          postgres    false    224   gu       ?          0    16500    sure 
   TABLE DATA           4   COPY public.sure (mst_id, tur_id, sure) FROM stdin;
    public          postgres    false    219   ?u       ?          0    16552    telefon 
   TABLE DATA           G   COPY public.telefon (id, mst_odano, mst_ucak, tel, mst_id) FROM stdin;
    public          postgres    false    229   ?u       ?          0    24717    toplammusteri 
   TABLE DATA           -   COPY public.toplammusteri (sayi) FROM stdin;
    public          postgres    false    231   ?u       ?          0    24731    toplammusteriiki 
   TABLE DATA           0   COPY public.toplammusteriiki (sayi) FROM stdin;
    public          postgres    false    233   v       ?          0    24724 	   toplamtur 
   TABLE DATA           )   COPY public.toplamtur (sayi) FROM stdin;
    public          postgres    false    232   7v       ?          0    24738    toplamturiki 
   TABLE DATA           ,   COPY public.toplamturiki (sayi) FROM stdin;
    public          postgres    false    234   Vv       ?          0    16474    tur 
   TABLE DATA           b   COPY public.tur (tur_id, mst_id, tur_ad, tur_suresi, tur_fatura, yemek_id, rehber_id) FROM stdin;
    public          postgres    false    215   vv       ?          0    16505    ucak 
   TABLE DATA           0   COPY public.ucak (id, ucak, mst_id) FROM stdin;
    public          postgres    false    220   w       ?          0    16547    ucret 
   TABLE DATA           A   COPY public.ucret (id, mst_ucret, mst_sehir, mst_id) FROM stdin;
    public          postgres    false    228   @w       ?          0    16530    ulke 
   TABLE DATA           ?   COPY public.ulke (mst_id, mst_ulke, mst_postakodu) FROM stdin;
    public          postgres    false    225   ?w       ?          0    16495    yemek 
   TABLE DATA           8   COPY public.yemek (id, yemek, sure, mst_id) FROM stdin;
    public          postgres    false    218   ?w       ?           2606    16519    adres adres_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.adres
    ADD CONSTRAINT adres_pkey PRIMARY KEY (mst_id);
 :   ALTER TABLE ONLY public.adres DROP CONSTRAINT adres_pkey;
       public            postgres    false    222            ?           2606    16546    fatura fatura_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.fatura
    ADD CONSTRAINT fatura_pkey PRIMARY KEY (mst_id);
 <   ALTER TABLE ONLY public.fatura DROP CONSTRAINT fatura_pkey;
       public            postgres    false    227            ?           2606    16539    kita kita_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.kita
    ADD CONSTRAINT kita_pkey PRIMARY KEY (mst_id);
 8   ALTER TABLE ONLY public.kita DROP CONSTRAINT kita_pkey;
       public            postgres    false    226            ?           2606    16483    mst_tipi mst_tipi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.mst_tipi
    ADD CONSTRAINT mst_tipi_pkey PRIMARY KEY (mst_tipiid);
 @   ALTER TABLE ONLY public.mst_tipi DROP CONSTRAINT mst_tipi_pkey;
       public            postgres    false    216            ?           2606    24637    mst_tur mst_tur_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.mst_tur
    ADD CONSTRAINT mst_tur_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.mst_tur DROP CONSTRAINT mst_tur_pkey;
       public            postgres    false    230            ?           2606    16473    musteri musteri_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT musteri_pkey PRIMARY KEY (mst_id);
 >   ALTER TABLE ONLY public.musteri DROP CONSTRAINT musteri_pkey;
       public            postgres    false    214            ?           2606    16514    otel otel_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.otel
    ADD CONSTRAINT otel_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.otel DROP CONSTRAINT otel_pkey;
       public            postgres    false    221            ?           2606    16524    postakodu postakodu_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.postakodu
    ADD CONSTRAINT postakodu_pkey PRIMARY KEY (mst_id);
 B   ALTER TABLE ONLY public.postakodu DROP CONSTRAINT postakodu_pkey;
       public            postgres    false    223            ?           2606    16494    rehber rehber_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.rehber
    ADD CONSTRAINT rehber_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.rehber DROP CONSTRAINT rehber_pkey;
       public            postgres    false    217            ?           2606    16529    sehir sehir_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT sehir_pkey PRIMARY KEY (mst_id);
 :   ALTER TABLE ONLY public.sehir DROP CONSTRAINT sehir_pkey;
       public            postgres    false    224            ?           2606    16504    sure sure_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.sure
    ADD CONSTRAINT sure_pkey PRIMARY KEY (tur_id);
 8   ALTER TABLE ONLY public.sure DROP CONSTRAINT sure_pkey;
       public            postgres    false    219            ?           2606    16556    telefon telefon_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.telefon
    ADD CONSTRAINT telefon_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.telefon DROP CONSTRAINT telefon_pkey;
       public            postgres    false    229            ?           2606    24721     toplammusteri toplammusteri_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.toplammusteri
    ADD CONSTRAINT toplammusteri_pkey PRIMARY KEY (sayi);
 J   ALTER TABLE ONLY public.toplammusteri DROP CONSTRAINT toplammusteri_pkey;
       public            postgres    false    231            ?           2606    24735 &   toplammusteriiki toplammusteriiki_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.toplammusteriiki
    ADD CONSTRAINT toplammusteriiki_pkey PRIMARY KEY (sayi);
 P   ALTER TABLE ONLY public.toplammusteriiki DROP CONSTRAINT toplammusteriiki_pkey;
       public            postgres    false    233            ?           2606    24728    toplamtur toplamtur_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.toplamtur
    ADD CONSTRAINT toplamtur_pkey PRIMARY KEY (sayi);
 B   ALTER TABLE ONLY public.toplamtur DROP CONSTRAINT toplamtur_pkey;
       public            postgres    false    232            ?           2606    24742    toplamturiki toplamturiki_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.toplamturiki
    ADD CONSTRAINT toplamturiki_pkey PRIMARY KEY (sayi);
 H   ALTER TABLE ONLY public.toplamturiki DROP CONSTRAINT toplamturiki_pkey;
       public            postgres    false    234            ?           2606    16478    tur tur_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tur
    ADD CONSTRAINT tur_pkey PRIMARY KEY (tur_id);
 6   ALTER TABLE ONLY public.tur DROP CONSTRAINT tur_pkey;
       public            postgres    false    215            ?           2606    16509    ucak ucak_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.ucak
    ADD CONSTRAINT ucak_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.ucak DROP CONSTRAINT ucak_pkey;
       public            postgres    false    220            ?           2606    16551    ucret ucret_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.ucret
    ADD CONSTRAINT ucret_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.ucret DROP CONSTRAINT ucret_pkey;
       public            postgres    false    228            ?           2606    16534    ulke ulke_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ulke
    ADD CONSTRAINT ulke_pkey PRIMARY KEY (mst_id);
 8   ALTER TABLE ONLY public.ulke DROP CONSTRAINT ulke_pkey;
       public            postgres    false    225            ?           2606    16499    yemek yemek_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.yemek
    ADD CONSTRAINT yemek_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.yemek DROP CONSTRAINT yemek_pkey;
       public            postgres    false    218            ?           1259    24679    fki_adres_fk    INDEX     D   CREATE INDEX fki_adres_fk ON public.postakodu USING btree (mst_id);
     DROP INDEX public.fki_adres_fk;
       public            postgres    false    223            ?           1259    24673    fki_kita_fk    INDEX     >   CREATE INDEX fki_kita_fk ON public.ulke USING btree (mst_id);
    DROP INDEX public.fki_kita_fk;
       public            postgres    false    225            ?           1259    24667    fki_kita_foreign    INDEX     D   CREATE INDEX fki_kita_foreign ON public.adres USING btree (mst_id);
 $   DROP INDEX public.fki_kita_foreign;
       public            postgres    false    222            ?           1259    24697    fki_kitasehir_fk    INDEX     D   CREATE INDEX fki_kitasehir_fk ON public.sehir USING btree (mst_id);
 $   DROP INDEX public.fki_kitasehir_fk;
       public            postgres    false    224            ?           1259    24655    fki_m    INDEX     7   CREATE INDEX fki_m ON public.telefon USING btree (id);
    DROP INDEX public.fki_m;
       public            postgres    false    229            ?           1259    24643    fki_mst_foreign    INDEX     A   CREATE INDEX fki_mst_foreign ON public.mst_tur USING btree (id);
 #   DROP INDEX public.fki_mst_foreign;
       public            postgres    false    230            ?           1259    24691    fki_posta_fk    INDEX     @   CREATE INDEX fki_posta_fk ON public.sehir USING btree (mst_id);
     DROP INDEX public.fki_posta_fk;
       public            postgres    false    224            ?           1259    24632    fki_rehber_foreign    INDEX     G   CREATE INDEX fki_rehber_foreign ON public.tur USING btree (rehber_id);
 &   DROP INDEX public.fki_rehber_foreign;
       public            postgres    false    215            ?           1259    16489    fki_tur_foreign    INDEX     A   CREATE INDEX fki_tur_foreign ON public.tur USING btree (mst_id);
 #   DROP INDEX public.fki_tur_foreign;
       public            postgres    false    215            ?           1259    24649    fki_turmst_foreign    INDEX     D   CREATE INDEX fki_turmst_foreign ON public.mst_tur USING btree (id);
 &   DROP INDEX public.fki_turmst_foreign;
       public            postgres    false    230            ?           1259    24661    fki_ucaktel_foreign    INDEX     E   CREATE INDEX fki_ucaktel_foreign ON public.telefon USING btree (id);
 '   DROP INDEX public.fki_ucaktel_foreign;
       public            postgres    false    229            ?           1259    24685    fki_ulke_fk    INDEX     ?   CREATE INDEX fki_ulke_fk ON public.sehir USING btree (mst_id);
    DROP INDEX public.fki_ulke_fk;
       public            postgres    false    224            ?           1259    24626    fki_yemek_foreign    INDEX     E   CREATE INDEX fki_yemek_foreign ON public.tur USING btree (yemek_id);
 %   DROP INDEX public.fki_yemek_foreign;
       public            postgres    false    215            ?           2620    24737    musteri test1trig    TRIGGER     f   CREATE TRIGGER test1trig AFTER INSERT ON public.musteri FOR EACH ROW EXECUTE FUNCTION public.test1();
 *   DROP TRIGGER test1trig ON public.musteri;
       public          postgres    false    214    242                        2620    24744    tur test2trig    TRIGGER     b   CREATE TRIGGER test2trig AFTER INSERT ON public.tur FOR EACH ROW EXECUTE FUNCTION public.test2();
 &   DROP TRIGGER test2trig ON public.tur;
       public          postgres    false    243    215            ?           2620    24723    musteri testtrig    TRIGGER     d   CREATE TRIGGER testtrig AFTER INSERT ON public.musteri FOR EACH ROW EXECUTE FUNCTION public.test();
 )   DROP TRIGGER testtrig ON public.musteri;
       public          postgres    false    236    214                       2620    24730    tur testtrigtwo    TRIGGER     f   CREATE TRIGGER testtrigtwo AFTER INSERT ON public.tur FOR EACH ROW EXECUTE FUNCTION public.testtwo();
 (   DROP TRIGGER testtrigtwo ON public.tur;
       public          postgres    false    241    215            ?           2606    24674    postakodu adres_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.postakodu
    ADD CONSTRAINT adres_fk FOREIGN KEY (mst_id) REFERENCES public.adres(mst_id) NOT VALID;
 <   ALTER TABLE ONLY public.postakodu DROP CONSTRAINT adres_fk;
       public          postgres    false    222    3281    223            ?           2606    24668    ulke kita_fk    FK CONSTRAINT     w   ALTER TABLE ONLY public.ulke
    ADD CONSTRAINT kita_fk FOREIGN KEY (mst_id) REFERENCES public.kita(mst_id) NOT VALID;
 6   ALTER TABLE ONLY public.ulke DROP CONSTRAINT kita_fk;
       public          postgres    false    225    3295    226            ?           2606    24662    adres kita_foreign    FK CONSTRAINT     }   ALTER TABLE ONLY public.adres
    ADD CONSTRAINT kita_foreign FOREIGN KEY (mst_id) REFERENCES public.kita(mst_id) NOT VALID;
 <   ALTER TABLE ONLY public.adres DROP CONSTRAINT kita_foreign;
       public          postgres    false    226    222    3295            ?           2606    24692    sehir kitasehir_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT kitasehir_fk FOREIGN KEY (mst_id) REFERENCES public.kita(mst_id) NOT VALID;
 <   ALTER TABLE ONLY public.sehir DROP CONSTRAINT kitasehir_fk;
       public          postgres    false    226    3295    224            ?           2606    24638    mst_tur mst_foreign    FK CONSTRAINT     }   ALTER TABLE ONLY public.mst_tur
    ADD CONSTRAINT mst_foreign FOREIGN KEY (id) REFERENCES public.musteri(mst_id) NOT VALID;
 =   ALTER TABLE ONLY public.mst_tur DROP CONSTRAINT mst_foreign;
       public          postgres    false    214    230    3262            ?           2606    24686    sehir posta_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT posta_fk FOREIGN KEY (mst_id) REFERENCES public.postakodu(mst_id) NOT VALID;
 8   ALTER TABLE ONLY public.sehir DROP CONSTRAINT posta_fk;
       public          postgres    false    3285    224    223            ?           2606    24627    tur rehber_foreign    FK CONSTRAINT     ~   ALTER TABLE ONLY public.tur
    ADD CONSTRAINT rehber_foreign FOREIGN KEY (rehber_id) REFERENCES public.rehber(id) NOT VALID;
 <   ALTER TABLE ONLY public.tur DROP CONSTRAINT rehber_foreign;
       public          postgres    false    217    3271    215            ?           2606    24644    mst_tur turmst_foreign    FK CONSTRAINT     |   ALTER TABLE ONLY public.mst_tur
    ADD CONSTRAINT turmst_foreign FOREIGN KEY (id) REFERENCES public.tur(tur_id) NOT VALID;
 @   ALTER TABLE ONLY public.mst_tur DROP CONSTRAINT turmst_foreign;
       public          postgres    false    215    3267    230            ?           2606    24680    sehir ulke_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT ulke_fk FOREIGN KEY (mst_id) REFERENCES public.ulke(mst_id) NOT VALID;
 7   ALTER TABLE ONLY public.sehir DROP CONSTRAINT ulke_fk;
       public          postgres    false    224    225    3293            ?           2606    24621    tur yemek_foreign    FK CONSTRAINT     {   ALTER TABLE ONLY public.tur
    ADD CONSTRAINT yemek_foreign FOREIGN KEY (yemek_id) REFERENCES public.yemek(id) NOT VALID;
 ;   ALTER TABLE ONLY public.tur DROP CONSTRAINT yemek_foreign;
       public          postgres    false    215    218    3273            ?   ?   x???1?0??c???ʈ:P?R
?? )??<_AJ???v4?p?;KB??8K???G?3??r?*D?\r?6,"5:a???74?z(Q?4?p??e?2??q?ԨNE?v????lW0?/~R?ʀ?/o?V0??1???Os      ?   7   x???<???$1/?4???????]??381;??2??? ?7?s?K???=... ?r      ?      x?????? ? ?      ?   h   x?3??O/J?K??t?L*?NU??-N?????2?K9????(8'fg?$?8#SK2??3?8?Ss2??3?l??!BƷ??$1-Q?;?(1?4????)??+F??? ??$?      ?      x?????? ? ?      ?   u  x?m??N?0??????]???qf??
!?Bb?AD-]?	ފw?v?i?X Y?????Ι???>^?-\?Ͱ?n??L??5+???[F$M?j?`=l?]\??q???????\?J.a2ΰ@?eT?D?????-9X?0?fB?V?۾<?x]jy?6Sm_5?6!4?N??????>?????}???8??@;=z?a??????g?7???d΃`?eL}6??Ւ(???y7??q?4~??8???J?m.?*?c?^?'_?c"???!?<&f76???H?p???s??h{?U?XM?aѱ???Dj.?:E_??*??8?d?Ns?l???M???1x]???t?Q???i+???/ɷ???O???=?|      ?   *   x?3?440?4????22!L3 ӄ??42?!?=... ???      ?   4   x???46100?<???$1/?4??CČ???$??_??_??e?.???? <??      ?   %   x?3?4????????2?4?,K,1?8a?=... ??1      ?   *   x?3?N?N,?L?45105?2?s?K?8MM??b???? ???      ?      x?3?4?4?2?4???f@2F??? #(?      ?      x?3?440?44???"?=... #?T      ?      x?34??????       ?      x?35?????? 
      ?      x???????? ? ?      ?      x?34?????? ?      ?   ?   x?3?4?t?IMO?+Q?N?KLI?4WH/????? .SN#tƨ*?8?9C????J??5s?r?e&?'%*??$??g?k7?4?T?f?!??
4?? :23')?8S??*5?J?
?"풟?&m	??J??s?˰)????? 3?R?      ?      x?3?44????2?44 ?1z\\\ '*c      ?   :   x?3?44 ??????<??.N????%?yI?9 1s,bFp?ىE?? ?=... ?9>      ?      x?3?*-?L?440400?2E???qqq ???      ?      x???,K,?4????2G0c???? W??     