
create database blog;


create table usuario(
	id serial primary key,
	email varchar not null
);

create table post(
	id serial primary key,
	usuario_id int not null,
	titulo varchar not null,
	fecha date not null,
	foreign key (usuario_id) references usuario(id)
);

create table comentario(
	id serial primary key,
	post_id int not null,
	usuario_id int not null,
	texto varchar not null,
	fecha date not null,
	foreign key (post_id) references post(id),
	foreign key (usuario_id) references usuario(id)
);


insert into usuario (email) values 
    ('usuario01@hotmail.com'), 
    ('usuario02@hotmail.com'), 
    ('usuario03@hotmail.com'), 
    ('usuario04@hotmail.com'), 
    ('usuario05@hotmail.com'), 
    ('usuario06@hotmail.com'), 
	('usuario07@hotmail.com'), 
    ('usuario08@hotmail.com'), 
    ('usuario09@hotmail.com');

insert into post(usuario_id, titulo, fecha) values 
    (1, 'Post 1: Esto es malo', '2020-06-29'), 
    (5, 'Post 2: Esto es malo', '2020-06-20'), 
    (1, 'Post 3: Esto es excelente', '2020-05-30'), 
	(9, 'Post 4: Esto es bueno', '2020-05-09'), 
    (7, 'Post 5: Esto es bueno', '2020-07-10'), 
    (5, 'Post 6: Esto es excelente', '2020-07-18'), 
    (8, 'Post 7: Esto es excelente', '2020-07-07'), 
	(5, 'Post 8: Esto es excelente', '2020-05-14'), 
    (2, 'Post 9: Esto es bueno', '2020-05-08'), 
    (6, 'Post 10: Esto es bueno', '2020-06-02'), 
    (4, 'Post 11: Esto es bueno', '2020-05-05'), 
	(9, 'Post 12: Esto es malo', '2020-07-23'), 
    (5, 'Post 13: Esto es excelente', '2020-05-30'), 
    (8, 'Post 14: Esto es excelente', '2020-05-01'), 
    (7, 'Post 15: Esto es malo', '2020-06-17');

insert into comentario(post_id, usuario_id, texto, fecha) values 
    (6, 3, 'Este es el comentario 1', '2020-07-08'), 
    (2, 4, 'Este es el comentario 2', '2020-06-07'), 
	(4, 6, 'Este es el comentario 3', '2020-06-16'), 
    (13, 2, 'Este es el comentario 4', '2020-06-15'), 
    (6, 6, 'Este es el comentario 5', '2020-05-14'), 
    (3, 3, 'Este es el comentario 6', '2020-07-08'), 
	(1, 6, 'Este es el comentario 7', '2020-05-22'), 
    (7, 6, 'Este es el comentario 8', '2020-07-09'), 
    (13, 8, 'Este es el comentario 9', '2020-06-30'), 
    (6, 8, 'Este es el comentario 10', '2020-06-19'), 
	(1, 5, 'Este es el comentario 11', '2020-05-09'), 
    (15, 8, 'Este es el comentario 12', '2020-06-17'), 
    (9, 1, 'Este es el comentario 13', '2020-05-01'), 
    (5, 2, 'Este es el comentario 14', '2020-05-31'), 
	(3, 4, 'Este es el comentario 15', '2020-06-28');


select u.email correo, p.id, p.titulo 
from post p
	inner join usuario u on u.id = p.usuario_id
where u.id = 5;


select u.email correo, u.id usuario, c.post_id, c.texto, c.fecha 
from comentario c 
	inner join usuario u on c.usuario_id = u.id 
where email != 'usuario06@hotmail.com'
order by u.id, c.post_id;


select u.id usuario_sin_posts
from usuario u
	left join post p on u.id = p.usuario_id
where p.usuario_id is null;


select p.titulo post, c.texto comentario
from post p
	full outer join comentario c on p.id = c.post_id
order by p.id, c.id;


select *
from usuario u 
	inner join post p on u.id = p.usuario_id 
where p.fecha between '2020-06-01' and '2020-06-30';