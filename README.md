# Teste Ruby para Candidatos

## Pontos para melhoria que não consegui implementar pelo tempo restrito

- O processo de persistência das marcas e modelos que ainda não estão na base de dados poderia ser assíncrono, utilizando bibliotecas como Sidekiq, assim podemos eliminar o block no request. Poderiamos também fazer essa carga com uma rake task definindo um intervalo para execução, já que não temos novas marcas e modelos todos os dias no mercado.

- As rotas de existentes `/` e `/models` poderiam ser nested, pensei em algo como: 
  `/makes` retornando o html com o selectbox das marcas   e   `/makes/2/models` com a listagem dos modelos da marca 

- Cache. Fazendo uma análise percebi que os dados não mudam com frequencia, sabendo disso podemos implementar uma camada de cache para evitar acessos desnecessários ao banco e melhorar a performance.

- Índices para as colunas `webmotors_id` e `make_id`

- Testes automatizados :(