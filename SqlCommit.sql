
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
    
      ,[ITEMCODE]
      ,[ITEMNAME]
      ,[FICHENO]
      ,[DATE_]
      ,[AMOUNT] 
      ,[PRICE]
      ,[LINENETTOTAL]
      ,[LINENET]
      ,[BRANCHNR]
      ,[BRANCH]
      ,[SALESMAN]
      ,[CITY]
      ,[REGION]
      ,[LATITUDE]
      ,[LONGITUDE]
      ,[CLIENTCODE]
      ,[CLIENTNAME]
      ,[BRANDCODE]
      ,[BRAND]
      ,[CATEGORY_NAME1]
      ,[CATEGORY_NAME2]
      ,[CATEGORY_NAME3]
      ,[STARTDATE]
      ,[ENDDATE]
      ,[SPECODE]
      ,[CAPIBLOCK_CREADEDDATE]
  FROM [ETRADE].[dbo].[SALES]
  
  --- BURADA T�M SATIRLARI �EK�YORUZ--
  SELECT*FROM SALES


  -- BURADA TOPLAM SATISI SATIR SAYISINI MAX VE M�N SATISI VE ORTALAMA SATISI
  KOCAEL� SUBES� ���N �EK�YORUZ --

  SELECT SUM(LINENET) AS TOPLAMSATIS,
  COUNT(*) AS SATIRSAYISI,
  MAX(LINENET) AS MAXSATIS,MIN(LINENET) AS MINSATIS,
  AVG(LINENET) AS ORTALAMASATIS
  FROM SALES 
  WHERE BRANCH ='Kocaeli Subesi'
  GROUP BY BRANCH 

  --BURDA TOPLAM SATISI 50 B�NDEN FAZLA OLAN SUBELER� �EK�YORUZ--
  
SELECT BRANCH,SUM(LINENET) AS TOPLAMSATIS
FROM SALES
GROUP BY BRANCH 
HAVING SUM(LINENET) >50000
ORDER BY 2 DESC


-- BURADA ANKARA SUBES�NDE BEL�RL� B�R TAR�HTEK� SATISI �EK�YORUZ--

SELECT BRANCH AS SUBE,DATE_ AS TARIH, SUM(LINENET) AS TOPLAMSATIS,COUNT(*) SATIRSAYISI
FROM SALES
WHERE BRANCH='ANKARA Subesi' --AND DATE_='2017-01-05'
GROUP BY BRANCH,DATE_
ORDER BY DATE_

SELECT BRANCH AS SUBE,DATE_ AS TARIH, SUM(LINENET) AS TOPLAMSATIS,COUNT(*) SATIRSAYISI
FROM SALES
GROUP BY BRANCH,DATE_
ORDER BY BRANCH,DATE_

SELECT DATE_ ,BRANCH,SUM(LINENET) FROM SALES
GROUP BY DATE_,BRANCH 
RDER BY DATE_ SUM(LINENET) DESC;

SELECT CATEGORY_NAME1,BRAND,CATEGORY_NAME2,SUM(LINENET),CATEGORY_NAME3 FROM SALES
WHERE CATEGORY_NAME1 IS NOT NULL AND CATEGORY_NAME2 IS NOT NULL AND CATEGORY_NAME3 IS NOT NULL AND CATEGORY_NAME1='GIDA'
GROUP BY CATEGORY_NAME1,CATEGORY_NAME2,CATEGORY_NAME3,BRAND
ORDER BY SUM(LINENET) DESC  ;
--- BURADA GIDA KATEGOR�S�NDEK� SATI�LARI MARKA VE ALT KATEGOR�YE G�RE L��KELEND�R�YORUZ --
