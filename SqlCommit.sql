
------------------TÜM SQL KOMUTLARI NOTUM-------------------
-- BÖLÜM 1 : GİRİŞ 
Structured Query Language (SQL) Nedir?

Yapısal sorgulama dili anlamına gelir.

   SQL, veritabanı yönetimi için kullanılan bir dildir. Veritabanlarına
veri eklemek, güncellemek, silmek ve sorgulamak için kullanılır.
 veri tabanı nedir ? 
    Veritabanı temel anlamda icerisinde veri barındıran yazılılardır.
    bir cok farklı yazılım var örneğin SQL SERVER , ORACLE, MYSQL, POSTGRESQL...
    bunların hepsinin ortak dili SQl dir, ama her birinin kedine özgü birkaç komutu vardır .
    ama temel sql komutları hepsi icin ortaktır.

özetlicek olursak SQL veritabanı yönetimi için kullanılırken,
    veritabanı verileri depolar ve organize eder.

veritabanı sunucusu nedir ? 
    veritabanı sunucusu, veritabanlarını barındıran ve yöneten bir yazılımdır.
    veritabanı sunucuları kendi veritabanı yazılımları ile bizim 
    SQL komutlarımızı işler ve bize yanıt döner.


BU NOT DOSYASINDA SQL SERVER KOMUTLARINI ÖĞRENECEĞİZ.

SQL SERVER temel anlamda iki baslık altında incelenebilir.
1.SQL SERVER PROGRAMMING
    - Temel SQL Komutları
    - SQL SERVER Programlama
    - TSQL 
2.SQL SERVER ADMINISTRANTING 
    -Temel Yönetimi 
    - ileri seviye yönetim
    -TSQL

----------------------------------

RDMS (İlişkisel Veri Tabanı Yönetim Sistemi)
    RDMS, verilerin tablolar halinde düzenlendiği ve bu tablolar arasındaki ilişkilerin
    tanımlandığı bir veri tabanı yönetim sistemidir.
    SQL SERVER, ORACLE, MYSQL, POSTGRESQL gibi birçok veritabanı RDMS kategorisine girer.  
    örnek : 
        bir okul veritabanında öğrenciler, dersler ve öğretmenler tabloları olabilir.
        Öğrenciler tablosu öğrenci bilgilerini, dersler tablosu ders bilgilerini,
        öğretmenler tablosu ise öğretmen bilgilerini içerir.
        Bu tablolar arasındaki ilişkiler, öğrencilerin hangi dersleri aldığı
        ve hangi öğretmenlerin bu dersleri verdiği gibi bilgileri tanımlar. 
    -- daha sonra ilişkisel veri tabanı yönetim sistemleri ile ilgili detaylı bilgi verilecek.

--BÖLÜM 2 : VERİTABANI İŞLEMLERİNE GİRİŞ

Tablo olusturken her zaman otomatik artan bir ID olusturulur ve bu primery key (benzersiz anahtar) olarak isaretlenir.
bunun sebebi her kayıtın benzersız ve kolay yönetilir olabilmesi içindir.

Tablo nedir? 
    veritabanında verilerin depolandığı yapıdır.
    tablolar satırlar ve sütunlar halinde düzenlenir.
    her tablo belirli bir konuya odaklanır ve ilgili verileri içerir.
    örnek : 
        bir "Öğrenciler" tablosu, öğrenci bilgilerini içerebilir.
        Bu tablo, öğrenci adı, soyadı, doğum tarihi gibi sütunlara sahip olabilir.
        Her satır ise bir öğrencinin bilgilerini temsil eder.

Bölüm 1 de bahsettiğimiz RDMS (İlişkisel Veri Tabanı Yönetim Sistemi)
    aslında tabloların birbirleriyle ilişkili olduğu bir yapıdır.Tabloların sütunlarının arasındaki ilişkidir.SELECT TOP (1000) [LOGICALREF]

                                  ------BÖLÜM 3 : TEMEL SQL KOMUTLARI--------


-- 1. VERİ SEÇME İŞLEMİ (SELECT)

KISACA SELECT KOMUTU BİZE İSTEDİĞİMİZ VERİYİ TABLODAN ÇEKMEMİZİ SAĞLAR.


SELECT * FROM TabloAdı; -- Tablodaki tüm verileri seçer.
--Örnekler: SELECT*FROM EMPLOYEES; -- EMPLOYEES tablosundaki tüm verileri seçer.

SELECT Sütun1, Sütun2 FROM TabloAdı; -- Belirli sütunları seçer.
--Örnekler: SELECT FirstName, LastName FROM EMPLOYEES; --EMPLOYEES tablosundaki FirstName ve LastName sütunlarını seçer.

SELECT DISTINCT SütunAdı FROM TabloAdı; -- Belirli bir sütundaki benzersiz değerleri seçer. 
--Örnekler: SELECT DISTINCT Department FROM EMPLOYEES; -- EMPLOYEES tablosundaki benzersiz departmanları seçer.

SELECT TOP 10 * FROM TabloAdı; -- İlk 10 kaydı seçer.
--Örnekler: SELECT TOP 10 * FROM EMPLOYEES; -- EMPLOYEES tablosundaki ilk 10 kaydı seçer.

SELECT COUNT(*) FROM TabloAdı; -- Tablo içindeki toplam kayıt sayısını döner.
--Örnekler: SELECT COUNT(*) FROM EMPLOYEES; -- EMPLOYEES tablosundaki toplam kayıt sayısını döner.

SELECT SütunAdı FROM TabloAdı WHERE Koşul; -- Belirli bir koşula göre veri seçer.
--Örnekler: SELECT * FROM EMPLOYEES WHERE Department = 'Sales'; -- EMPLOYEES tablosundan departmanı 'Sales' olan kayıtları seçer.


-- 2. VERİ EKLEME İŞLEMİ (INSERT)


INSERT INTO TabloAdı (Sütun1, Sütun2) VALUES (Değer1, Değer2); -- Yeni bir kayıt ekler.
--Örnekler: INSERT INTO EMPLOYEES (FirstName, LastName, Department) VALUES ('John', 'Doe', 'Sales'); -- EMPLOYEES tablosuna yeni bir çalışan ekler.

-- 3. VERİ GÜNCELLEME İŞLEMİ (UPDATE)   


UPDATE TabloAdı SET Sütun1 = Değer1 WHERE Koşul; -- Belirli bir koşula göre veriyi günceller.
--Örnekler: UPDATE EMPLOYEES SET Department = 'Marketing' WHERE EmployeeID = 1; -- EmployeeID'si 1 olan çalışanın departmanını 'Marketing' olarak günceller.

-- 4. VERİ SİLME İŞLEMİ (DELETE)

DELETE FROM TabloAdı WHERE Koşul; -- Belirli bir koşula göre veriyi siler.
--Örnekler: DELETE FROM EMPLOYEES WHERE EmployeeID = 1; -- EmployeeID'si 1 olan çalışanı siler.

-- 5. TABLO OLUŞTURMA İŞLEMİ (CREATE TABLE)
CREATE TABLE TabloAdı (
    Sütun1 VeriTipi,
    Sütun2 VeriTipi,
    PRIMARY KEY (Sütun1) -- Birincil anahtar tanımlama
);
-- 6. TABLO SİLME İŞLEMİ (DROP TABLE)

DROP TABLE TabloAdı; -- Tabloyu ve içindeki tüm verileri siler.
--Örnekler: DROP TABLE EMPLOYEES; -- EMPLOYEES tablosunu siler.

-- 7. TABLO DEĞİŞTİRME İŞLEMİ (ALTER TABLE)

ALTER TABLE TabloAdı ADD SütunAdı VeriTipi; -- Tabloya yeni bir sütun ekler.
ALTER TABLE TabloAdı DROP COLUMN SütunAdı; -- Tabloyu sütun siler.
ALTER TABLE TabloAdı ALTER COLUMN SütunAdı YeniVeriTipi; -- Sütunun veri tipini değiştirir.
-- 8. VERİ SIRALAMA İŞLEMİ (ORDER BY) 
SELECT * FROM TabloAdı ORDER BY SütunAdı ASC; -- Belirli bir sütuna göre artan sırada verileri sıralar.
SELECT * FROM TabloAdı ORDER BY SütunAdı DESC; -- Belirli bir sütuna göre azalan sırada verileri sıralar.   
-- 9. VERİ FİLTRELEME İŞLEMİ (WHERE)
SELECT * FROM TabloAdı WHERE SütunAdı = Değer; -- Belirli bir koşula göre veri seçer.


---------4.bölüm: örnek satış datası sorguları----------
 SELECT * FROM SALES; --SALES TABLSOSUNDAKİ TÜM VERİLERİ GETİRİR.
 
 SELECT TOP 5 * FROM SALES; --SALES TABLSOSUNDAKİ İLK 5 VERİYİ GETİRİR.

  SELECT DISTINCT PRODUCT FROM SALES; --SALES TABLSOSUNDAKİ BENZERSİZ ÜRÜNLERİ GETİRİR.

SELECT COUNT(*) FROM SALES --SALES TABLSOSUNDAKİ TOPLAM ROW SAYISNI GETİRİR.)   
SELECT COUNT(DISTINCT PRODUCT) FROM SALES --SALES TABLSOSUNDAKİ BENZERSİZ ÜRÜN SAYISNI GETİRİR.)

SELECT SUM(LINENET) AS TOPLAM_SATIS FROM SATIS --SATIS TABLASUNDAKİ TOPLAM SATISI GETİRİR.
SELECT AVG(LINENET) AS ORTALAMA_SATIS FROM SATIS --SATIS TABLSOUNDAKİ ORTALAMA SATISI GETİRİR.
SELECT MAX(LINENET) AS EN_YUKSEK_SATIS FROM SALES --SALES TABLOSUNDAKİ EN YÜKSEK SATISI GETİRİR.
SELECT MIN(LINENET) AS EN_DUSUK_SATIS FROM SALES --SALES TABLOSUNDAKİ EN DÜŞÜK SATISI GETİRİR.

Simdi bir örnek sorgu yazalım:
SELECT SUM(LINENET) AS TOPLAM_SATIS, SELECT BRANCH ,AVG(LINENET) AS ORTALAMA_SATIS
FROM SALES
HAVING SUM(LINENET) > 10000
GROUP BY BRANCH
ORDER BY TOPLAM_SATIS DESC
--BU SORGU İLE HER ŞUBE İÇİN TOPLAM SATIŞ VE ORTALAMA SATIŞ DEĞERLERİNİ GETİRİRİZ.
--AYRICA TOPLAM SATIŞ DEĞERİ 10000 DEN BÜYÜK OLAN ŞUBELERİ FİLTRELERİZ.
--SONUÇLARI TOPLAM SATIŞ DEĞERİNE GÖRE AZALAN ŞEKİLDE SIRALARIZ.

SİMDİ BASKA BİR ÖRNEK SORGU YAZAALIM:
SELECT BRANCH,SUM(LINENET) AS TOPLAM_SATIS
FROM SALES
WHERE BRANCH='ISTANBUL SUBESI'
GROUP BY BRANCH
--BU SORGU İLE İSTANBUL ŞUBESİNİN TOPLAM SATIŞ DEĞERİNİ GETİRİRİZ.

BASKA BİR ÖRNEK SORGU YAZALIM:
SELECT SUM(LINENET) AS TOPLAM_SATIS,DATE_ AS SATIS_TARIHI,BRANCH AS SUBE
FROM SALES
WHERE DATE_ = '2023-01-15' AND BRANCH='ANKARA SUBESI'
GROUP BY DATE_,BRANCH
--BU SORGU İLE 15 OCAK 2023 TARİHİNDE ANKARA ŞUBESİNİN TOPLAM SATIŞ DEĞERİNİ GETİRİRİZ.

BASKA BİR ÖRNEK SORGU YAZALIM:
SELECT BRAND ,CATEGORY_NAME1,CATEGORY_NAME2,SUM(LINENET) AS TOPLAM_SATIS
FROM SALES
WHERE BRAND IS NOT NULL AND BRAND!='ULKER'
GROUP BY BRAND ,CATEGORY_NAME1,CATEGORY_NAME2
ORDER BY BRAND,CATEGORY_NAME1,CATEGORY_NAME2 DESC
--BU SORGU İLE ULKER MARKASI DIŞINDAKİ TÜM MARKALARIN KATEGORİ BAZINDA TOPLAM SATIŞ DEĞERİNİ GETİRİRİZ.

------------------5.bölüm:VERİ TİPLERİ--------------------
--SQL SERVER'DA KULLANILAN TEMEL VERİ TİPLERİ ŞUNLARDIR:

--1. SAYISAL VERİ TİPLERİ:
    INT: Tam sayılar için kullanılır. 4 byte yer kaplar.
    FLOAT: Ondalıklı sayılar için kullanılır. 8 byte yer kaplar.
    DECIMAL(p,s): Belirli bir hassasiyet ve ölçek ile ondalıklı sayılar için kullanılır.10^38-1 aralığında değer alabilir.
    BIGINT: Çok büyük tam sayılar için kullanılır. 8 byte yer kaplar.
    SMALLINT: Küçük tam sayılar için kullanılır. 2 byte yer kaplar.

--2. KARAKTER VE METİN VERİ TİPLERİ:
    VARCHAR(n): Değişken uzunlukta karakter dizileri için kullanılır. n, maksimum karakter sayısını belirtir.girdiğin karakter sayısına göre yer kaplar.
    CHAR(n): Sabit uzunlukta karakter dizileri için kullanılır. n, karakter sayısını belirtir.girdiğin veriden bağımsız her zaman n kadar yer kaplar.
    TEXT: Uzun metin verileri için kullanılır. Maksimum 2 GB veri depolayabilir.Artık kullanılan bir veri tipi değildir.
    NCHAR(n): Unicode karakter dizileri için kullanılır. n, karakter sayısını belirtir. Uluslararası bir karakter seti için kullanırız daha çok.
    NVARCHAR(n): Değişken uzunlukta Unicode karakter dizileri için kullanılır. n, maksimum karakter sayısını belirtir. Uluslararası bir karakter seti için kullanırız daha çok.

--3. TARİH VE ZAMAN VERİ TİPLERİ:

    DATE:SADECE TARİH BİLGİSİ GİREBİLİRİZ. YYYY-MM-DD formatında tarih depolar.
    DATETIME: Hem tarih hem de zaman bilgisi için kullanılır. 1753-01-01 ile 9999-12-31 tarih aralığını ve 00:00:00 ile 23:59:59.997 zaman aralığını kapsar.
    TIME: Sadece zaman bilgisi için kullanılır. 00:00:00 ile 23:59:59.9999999 zaman aralığını kapsar.
    SMALLDATETIME: Hem tarih hem de zaman bilgisi için kullanılır. 1900-01-01 ile 2079-06-06 tarih aralığını ve 00:00:00 ile 23:59:59 zaman aralığını kapsar.
    DATETIME2: Geniş tarih ve zaman aralığı için kullanılır. 0001-01-01 ile 9999-12-31 tarih aralığını ve 00:00:00 ile 23:59:59.9999999 zaman aralığını kapsar.MİCROSECOND DESTEĞİ VARDIR.DAHA DETAYLI ZAMAN İŞLEMLERİ İÇİN KULLANILIR.

--4. DİĞER VERİ TİPLERİ:
    LONGITUDE: Coğrafi koordinatlar için kullanılır.
    LATITUDE: Coğrafi koordinatlar için kullanılır.
    GEOGRAPHY: Coğrafi veriler için kullanılır.
    BINARY(n): Sabit uzunlukta ikili veri için kullanılır. n, byte sayısını belirtir.ÇOK KULLANILMIYOR.
    VARBINARY(n): Değişken uzunlukta ikili veri için kullanılır. n, maksimum byte sayısını belirtir.ÇOK KULLANILMIYOR.
    IMAGE: Görüntü verileri için kullanılır. Maksimum 2 GB veri depolayabilir.Artık kullanılan bir veri tipi değildir.
    XML: XML verileri için kullanılır
    UNIQUEIDENTIFIER: Benzersiz kimlikler için kullanılır. GUID (Globally Unique Identifier) formatında veri depolar.EĞER DÜNYADA BENSERZİR BİR VERİ OLUŞTURMAK İSTİYORSANIZ KULLANILIR.


------------------6.BÖLÜM: RDSMS (İLİŞKİSEL VERİ TABANI YÖNETİM SİSTEMİ)-------------------
RDMS (İlişkisel Veri Tabanı Yönetim Sistemi)
    RDMS, verilerin tablolar halinde düzenlendiği ve bu tablolar arasındaki ilişkilerin
    tanımlandığı bir veri tabanı yönetim sistemidir.
    SQL SERVER, ORACLE, MYSQL, POSTGRESQL gibi birçok veritabanı RDMS kategorisine girer.  
    örnek : 
        bir okul veritabanında öğrenciler, dersler ve öğretmenler tabloları olabilir.
        Öğrenciler tablosu öğrenci bilgilerini, dersler tablosu ders bilgilerini,
        öğretmenler tablosu ise öğretmen bilgilerini içerir.
        Bu tablolar arasındaki ilişkiler, öğrencilerin hangi dersleri aldığı
        ve hangi öğretmenlerin bu dersleri verdiği gibi bilgileri tanımlar. 
    -- daha sonra ilişkisel veri tabanı yönetim sistemleri ile ilgili detaylı bilgi verilecek.

    ÖRNEK: E -Ticaret Veritabanı
    Bir e-ticaret veritabanında aşağıdaki tablolar olabilir:
     ÖNCELİKLE BİR USER TABLOSU OLUŞTURALIM EXCELDEN;

  -- 1. Kullanıcı Tablosu
CREATE TABLE USER_ (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    USERNAME_ VARCHAR(50),
    PASSWORD_ VARCHAR(50),
    NAMESURNAME VARCHAR(100),
    EMAIL VARCHAR(100),
    GENDER VARCHAR(1),
    CREATEDATE DATETIME,
    BIRTHDATE DATETIME,
    TELNR1 VARCHAR(15),
    TELNR2 VARCHAR(15)
);

-- 2. Ülke Tablosu
CREATE TABLE COUNTRY (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    COUNTRY VARCHAR(100)
);

-- 3. Şehir Tablosu
CREATE TABLE CITY (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    CITY VARCHAR(100)
);

-- 4. İlçe Tablosu
CREATE TABLE TOWN (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TOWN VARCHAR(100)
);

CREATE TABLE DISTRICT (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DISTRICT VARCHAR(100)
);

-- 6. Adres Tablosu
CREATE TABLE ADDRESS (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    COUNTRYID INT,
    CITYID INT,
    TOWNID INT,
    DISTRICTID INT,
    POSTALCODE VARCHAR(10),
    ADDRESSTEXT VARCHAR(250),
    USERID INT
);

-- 7. Ürün Tablosu
CREATE TABLE ITEM (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ITEMCODE VARCHAR(100),
    ITEMNAME VARCHAR(100),
    PRICE FLOAT,
    CATEGORY1 VARCHAR(100),
    CATEGORY2 VARCHAR(100),
    CATEGORY3 VARCHAR(100)
);

-- 8. Sepet Tablosu
CREATE TABLE BASKET (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    USERID INT,
    CREATEDATE DATETIME,
    LASTMODIFIEDDATE DATETIME,
    ITEMCOUNT INT,
    TOTALPRICE FLOAT,
    STATUS_ INT
);

-- 9. Sepet Detay Tablosu
CREATE TABLE BASKETDETAIL (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    BASKETID INT,
    ITEMID INT,
    PRICE FLOAT,
    TOTALPRICE FLOAT,
    DATE_ DATETIME
);

-- 10. Ödeme Tablosu
CREATE TABLE PAYMENT (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    BASKETID INT,
    TOTALPRICE FLOAT,
    PAYMENTTYPE INT,
    DATE_ DATETIME,
    ISOK BIT,
    APPROVECODE VARCHAR(50),
    ERROR_ VARCHAR(100)
);

-- 11. Sipariş Tablosu ('ORDER' SQL'de özel bir komuttur, 'ORDER_' olarak adlandırdım)
CREATE TABLE ORDER_ (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    USERID INT,
    BASKETID INT,
    CREATEDATE DATETIME,
    ITEMCOUNT INT,
    TOTALPRICE FLOAT,
    STATUS_ INT
);

-- 12. Sipariş Detay Tablosu
CREATE TABLE ORDERDETAIL (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ORDERID INT,
    BASKETDETAILID INT,
    ITEMID INT,
    AMOUNT INT,
    PRICE FLOAT,
    TOTALPRICE FLOAT,
    DATE_ DATETIME
);

-- 13. Fatura Tablosu
CREATE TABLE INVOICE (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ORDERID INT,
    INVOICENR VARCHAR(50),
    DATE_ DATETIME,
    CARGOFIC VARCHAR(50),
    STATUS_ INT
);

-- 14. Fatura Detay Tablosu
CREATE TABLE INVOICEDETAIL (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    INVOICEID INT,
    ITEMID INT,
    AMOUNT INT,
    PRICE FLOAT,
    TOTALPRICE FLOAT
);
ŞİMDİ ÖZET GEÇİYORUM BİZ ADREES ADINDA BİR TABLO OLUŞTURDUK BUNUN İÇİNDE
 COUNTRYID CITYID DISTRICTID OLUSTURDUK VE SONASINDA CIT COUNTRY DISTRICT İSİMLİ TABLOLAR OLUSTURDUK
  BU TABLOLARDA ID ADINDA BİR VARİABLE OLUSTURDUK VE COUNTRYID CITYID GİBİ ADRESS TABLOSUNDAKİ İD İÇERENLERLE İLİŞKİ KURDUK
   BURDAKİ ACOUNTRYID COUNTRY NİN İÇİNDEKİ İD İLE AYNI DEMEK İSTEDİK BUNUN SEBEBİ DE
    FARKLI TABLOLARDA VERİLERİ DAHA DÜZENLİ VERİ TUTABİLMEK BİR KİŞİNİN BİRDEN FAZLA ADRESİ OLABİLİYOR
 VE BU VERİLER FARKLI TABLOLARDA TUTULDUĞU İÇİN BUNLARI BİRLEŞTİRMEK LAZIM BU YÜZDEN DE JOİN KULLAMDIK

 Anlattığınız her şey %100 doğru. Yaptığımız bu tasarıma "İlişkisel Veritabanı Normalizasyonu" deniyor ve tam olarak sizin belirttiğiniz nedenlerle yapılıyor.

Neden Tabloları Ayırdık? (Normalizasyon)

Veri Tekrarını Önlemek: Haklısınız.
 COUNTRY, CITY gibi tabloları ayırmasaydık, 
 her adres satırına "Türkiye", "İstanbul", "Kadıköy" gibi bilgileri tekrar tekrar metin olarak yazmak zorunda kalacaktık. 
 Bu, hem milyonlarca satırda devasa bir yer israfına yol açar hem de veri girişinde ("İstanbul" vs "Istanbul") tutarsızlık yaratır.

Şimdi ise "Türkiye" (ID: 1) bilgisini COUNTRY tablosunda sadece bir kez tutuyoruz. ADDRESS tablosunda ise sadece 1 yazıyoruz. Çok daha verimli.

Tabloları Nasıl İlişkilendirdik? (Anahtarlar)

Tam dediğiniz gibi. COUNTRY tablosundaki ID bizim Primary Key (PK - Birincil Anahtar) değerimizdir (benzersiz tanımlayıcı).

    ADDRESS tablosundaki COUNTRYID ise Foreign Key (FK - Yabancı Anahtar) değeridir.
   -- Bu, ADDRESS tablosundaki COUNTRYID'nin COUNTRY tablosundaki ID ile eşleştiği anlamına gelir.
    -- Böylece, bir ADDRESS kaydının hangi ülkeye ait olduğunu kolayca bulabiliriz.
    Bu yapı, veritabanımızın hem daha az yer kaplamasını sağlar hem de veri bütünlüğünü korur.




