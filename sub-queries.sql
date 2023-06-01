
select aluno.primeiro_nome,
	   aluno.ultimo_nome,
	   count(aluno_curso.curso_id) numero_cursos
from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
group by 1, 2
order by numero_cursos desc;

--------------------------------------------------------------------------------------------

select curso.nome, 
count(aluno_curso.aluno_id) numero_alunos      
from curso
join aluno_curso on aluno_curso.curso_id = curso.id
group by 1
order by numero_alunos desc
limit 1;

--------------------------------------------------------------------------------------------

select * from curso where categoria_id in (1,2);

--------------------------------------------------------------------------------------------

SELECT * FROM curso WHERE categoria_id IN (
    SELECT id FROM categoria WHERE nome LIKE ('% de %')
);

--------------------------------------------------------------------------------------------

SELECT categoria,
       numero_cursos
    FROM (SELECT categoria.nome AS categoria,
                COUNT(curso.id) as numero_cursos
            FROM categoria
            JOIN curso ON curso.categoria_id = categoria.id
        GROUP BY categoria
    ) AS categoria_cursos
  WHERE numero_cursos > 3;
 
--------------------------------------------------------------------------------------------

SELECT categoria.nome AS categoria,
        COUNT(curso.id) as numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;
    HAVING numero_cursos > 3;
    
--------------------------------------------------------------------------------------------   