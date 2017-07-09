/*
create table pokemon
(id int primary key,name varchar(255),pokemon varchar(255),
  foreign key (pokemon)  (TypeA)
  references pokemons (pokemon)
);
なお処理時にはコードを消さないと
コメントアウトしても読み込まれるため注意

TypeAの部分がつながっている（コード中には書かない）
*/

-- create table pokemons
-- (pokemon varchar(255) primary key(TypeA),type varchar(255))


insert into pokemons values
(1,'おとか','ガブリアス'),
(2,'さやのん','リザードン'),
(3,'ブレイグ','ジュプトル'),
(4,'クラレ','ガブリアス');

/*
create table テーブル名（1 primary key,a,2,b）　--　作成 
上insert intoする前にかならず実行する
insert into テーブル名 列名（省略可能） values または
insert into テーブル名 values
（値を書く）
*/




