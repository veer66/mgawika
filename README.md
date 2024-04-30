# mgawika

_mgawika_ is a PostgreSQL extension that enables full-text searching on almost every known human language.

## How to install

1. git clone https://github.com/veer66/mgawika.git
2. cd mgawika
3. cargo build --release
4. ./install.sh

## Latest result

````
d4=# create extension mgawika;
CREATE EXTENSION
d4=# CREATE TEXT SEARCH CONFIGURATION mgawika (PARSER = mgawika);
CREATE TEXT SEARCH CONFIGURATION
d4=# ALTER TEXT SEARCH CONFIGURATION mgawika ADD MAPPING FOR word WITH simple;
ALTER TEXT SEARCH CONFIGURATION
d4=# select to_tsvector('mgawika', 'ฉันกินข้าวຈະຊອກຫາອີ່ຫຍັງ本日のお仕事終了しました');
                                                      to_tsvector 
-----------------------------------------------------------------------------------------------------------------------
 'กิน':3 'ข้าว':4 'ฉัน':2 'ຈະ':5 'ຊອກ':6 'ຫຍັງ':9 'ຫາ':7 'ອີ່':8 'お仕事':12 'した':15 'しま':14 'の':11 '本日':10 '終了':13
(1 row)
````

## Status

mgawika currently support PostgreSQL 15 on GNU/Linux.

## Example

### Initiailize

```
create extension mgawika;
CREATE TEXT SEARCH CONFIGURATION mgawika (PARSER = mgawika);
ALTER TEXT SEARCH CONFIGURATION mgawika ADD MAPPING FOR word WITH simple;
```

### Prepare table

```
create table tab1(id serial, body text);
insert into tab1(body) values ('ไก่กับเป็ด'), ('ช้างม้า'), ('วัวหมี');
```

### Query

```
select * from tab1 where to_tsvector('mgawika', body) @@ to_tsquery('เป็ด & ไก่');
```

### Index

```
CREATE INDEX tab1_idx ON tab1 USING GIN (to_tsvector('mgawika', body));
```

## Podman

### Build

```
$ git clone https://github.com/veer66/mgawika.git
$ cd mgawika
$ podman build -t mgawika .
```

### Run

```
$ podman run --name mgawika-1 -e POSTGRES_PASSWORD=yourpass -d mgawika
```

### Use

```
$ podman exec -it mgawika-1 psql -U postgres
```
