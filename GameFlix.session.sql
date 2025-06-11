CREATE DATABASE IF NOT EXISTS gameflix;
USE gameflix;

-- Apenas para visualização
SELECT DATABASE();
SHOW DATABASES;

-- Tabela de unidades
CREATE TABLE IF NOT EXISTS unidade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL
);


-- Tabela principal de produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(100) NOT NULL,  
    categoria VARCHAR(50) NOT NULL,   
    especificacao VARCHAR(50) NOT NULL  
); 

-- Jogos ligados aos produtos
CREATE TABLE IF NOT EXISTS jogos (
    id INT PRIMARY KEY,
    plataforma VARCHAR(100) NOT NULL,
    modo_jogo VARCHAR(50) NOT NULL,
    FOREIGN KEY (id) REFERENCES produtos(id) ON DELETE CASCADE
);

-- Filmes ligados aos produtos
CREATE TABLE IF NOT EXISTS filmes (
    id INT PRIMARY KEY,
    diretor VARCHAR(100) NOT NULL,
    classificacao VARCHAR(50) NOT NULL,
    ano_lancamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (id) REFERENCES produtos(id) ON DELETE CASCADE
);

-- Pessoas
CREATE TABLE IF NOT EXISTS pessoa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf BIGINT NOT NULL UNIQUE,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone BIGINT NOT NULL UNIQUE
);

-- Cliente (usa o mesmo ID da pessoa)
CREATE TABLE IF NOT EXISTS cliente (
    id INT PRIMARY KEY, -- mesma pessoa
    FOREIGN KEY (id) REFERENCES pessoa(id) ON DELETE CASCADE
);

-- Funcionarios
CREATE TABLE IF NOT EXISTS funcionario (
    id INT PRIMARY KEY, -- o mesmo id da pessoa
    cargo VARCHAR(50) NOT NULL,
    unidade_id INT NOT NULL,

    FOREIGN KEY (id) REFERENCES pessoa(id) ON DELETE CASCADE,
    FOREIGN KEY (unidade_id) REFERENCES unidade(id) ON DELETE CASCADE
);


-- Aluguel (cabecalho)
CREATE TABLE IF NOT EXISTS aluguel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    funcionario_id INT,
    data_retirada DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    em_atraso BOOLEAN DEFAULT FALSE,
    multa DECIMAL(10,2) DEFAULT 0.00,
    multa_paga BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id) ON DELETE SET NULL
);

-- Produtos em cada aluguel
CREATE TABLE IF NOT EXISTS aluguel_produto (
    aluguel_id INT NOT NULL,
    produto_id INT NOT NULL,

    PRIMARY KEY (aluguel_id, produto_id),
    FOREIGN KEY (aluguel_id) REFERENCES aluguel(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);

-- Estoque dos produtos
CREATE TABLE IF NOT EXISTS estoque (
    unidade_id INT,
    produto_id INT,
    quantidade INT NOT NULL,

    PRIMARY KEY (unidade_id, produto_id),
    FOREIGN KEY (unidade_id) REFERENCES unidade(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);

-- INSERTIONS

INSERT INTO unidade (nome, endereco) VALUES
('Unidade Recreio', 'Avenida Professor Fausto Moreira, 43'),
('Unidade Botafogo', 'Rua das Palmeiras, 17');

insert into pessoa (cpf, nome_completo, email, endereco, telefone) VALUES 

(15583145471, 'Anderson Silva', 'silva@gmail.com', 'Av Jaime Poggi 500', 21998463710), 
(24871320985, 'Maria Oliveira', 'maria.oliveira@gmail.com', 'Rua das Acácias 123', 21994561234), 
(31234567890, 'João Souza', 'joao.souza@hotmail.com', 'Rua das Flores 456', 21987654321), 
(40789123456, 'Carla Lima', 'carla.lima@yahoo.com', 'Av Brasil 987', 21991234567), 
(50876123498, 'Lucas Pereira', 'lucas.pereira@gmail.com', 'Rua do Comércio 321', 21993456789), 
(60123456789, 'Ana Beatriz Costa', 'ana.costa@gmail.com', 'Rua Central 202', 21998887766), 
(70987654321, 'Felipe Rocha', 'felipe.rocha@outlook.com', 'Av das Américas 800', 21997654321), 
(81234567987, 'Juliana Martins', 'juliana.martins@gmail.com', 'Travessa Azul 55', 21996543210), 
(99887766554, 'Ricardo Gomes', 'ricardo.gomes@gmail.com', 'Rua do Sol 12', 21999887766), 
(10293847561, 'Patrícia Alves', 'patricia.alves@live.com', 'Rua Verde 88', 21998765432),
(11442233669, 'Thiago Menezes', 'thiago.menezes@gmail.com', 'Rua das Palmeiras 77', 21991112233), 
(22334455667, 'Larissa Duarte', 'larissa.duarte@hotmail.com', 'Av Sete de Setembro 900', 21992223344), 
(33445566778, 'Bruno Carvalho', 'bruno.carvalho@yahoo.com', 'Rua Santa Luzia 12', 21993334455), 
(44556677889, 'Camila Ferreira', 'camila.ferreira@gmail.com', 'Alameda dos Ipês 40', 21994445566), 
(55667788990, 'Gabriel Monteiro', 'gabriel.monteiro@outlook.com', 'Av Dom Pedro I 605', 21995556677), 
(66778899001, 'Isabela Nunes', 'isabela.nunes@gmail.com', 'Rua do Campo 123', 21996667788), 
(77889900112, 'Rodrigo Almeida', 'rodrigo.almeida@gmail.com', 'Travessa da Paz 31', 21997778899), 
(88990011223, 'Vanessa Cardoso', 'vanessa.cardoso@hotmail.com', 'Rua Bela Vista 88', 21998889900), 
(99001122334, 'Eduardo Ramos', 'eduardo.ramos@gmail.com', 'Estrada Velha 432', 21990001122), 
(10111213141, 'Natália Fonseca', 'natalia.fonseca@live.com', 'Av das Nações 300', 2199111933); 

INSERT INTO funcionario (id, cargo, unidade_id) VALUES
(3, 'Caixa', 1),
(4, 'Gerente', 1),
(6, 'Repositor', 1),
(12, 'Caixa', 2),
(14, 'Gerente', 2),
(20, 'Repositor', 2);

INSERT INTO cliente (id) VALUES
(1), (2), (5), (7), (8), (9), (10),
(11), (13), (15), (16), (17), (18), (19);

INSERT INTO produtos (titulo, categoria, especificacao) VALUES
('The Legend of Zelda: Breath of the Wild', 'Jogo', 'Aventura'),
('God of War Ragnarok', 'Jogo', 'Ação'),
('Minecraft', 'Jogo', 'Sandbox'),
('Elden Ring', 'Jogo', 'RPG'),
('FIFA 24', 'Jogo', 'Esporte'),
('Hollow Knight', 'Jogo', 'Metroidvania'),
('Call of Duty: Modern Warfare II', 'Jogo', 'FPS'),
('Animal Crossing: New Horizons', 'Jogo', 'Simulação'),
('Overwatch 2', 'Jogo', 'Multiplayer'),
('The Witcher 3: Wild Hunt', 'Jogo', 'RPG'),
('Oppenheimer', 'Filme', 'Drama'),
('Homem-Aranha: Sem Volta Para Casa', 'Filme', 'Ação'),
('Duna: Parte Dois', 'Filme', 'Ficção Científica'),
('O Poderoso Chefão', 'Filme', 'Crime'),
('Interestelar', 'Filme', 'Ficção Científica'),
('Forrest Gump', 'Filme', 'Drama'),
('Coringa', 'Filme', 'Psicológico'),
('A Origem', 'Filme', 'Suspense'),
('Matrix', 'Filme', 'Ação'),
('Barbie', 'Filme', 'Comédia');

INSERT INTO jogos (id, plataforma, modo_jogo) VALUES 

(1, 'Nintendo Switch', 'Singleplayer'), 
(2, 'PlayStation 5', 'Singleplayer'), 
(3, 'Multiplataforma', 'Multiplayer'), 
(4, 'PlayStation 5 / Xbox', 'Singleplayer'), 
(5, 'Multiplataforma', 'Multiplayer'), 
(6, 'PC / Console', 'Singleplayer'), 
(7, 'Multiplataforma', 'Multiplayer'), 
(8, 'Nintendo Switch', 'Singleplayer'), 
(9, 'PC / Console', 'Multiplayer'), 
(10, 'PC / Xbox / PlayStation', 'Singleplayer'); 

INSERT INTO filmes (id, diretor, classificacao, ano_lancamento) VALUES 

(11, 'Christopher Nolan', '16+', '2023'), 
(12, 'Jon Watts', '12+', '2021'), 
(13, 'Denis Villeneuve', '14+', '2024'), 
(14, 'Francis Ford Coppola', '18+', '1972'), 
(15, 'Christopher Nolan', '10+', '2014'), 
(16, 'Robert Zemeckis', 'Livre', '1994'), 
(17, 'Todd Phillips', '18+', '2019'), 
(18, 'Christopher Nolan', '14+', '2010'), 
(19, 'The Wachowskis', '14+', '1999'), 
(20, 'Greta Gerwig', '10+', '2023'); 

-- Estoque
INSERT INTO estoque (produto_id, unidade_id, quantidade) VALUES
(1, 1, 3), (2, 1, 2), (3, 1, 5), (4, 1, 4), (5, 1, 6),
(6, 1, 2), (7, 1, 3), (8, 1, 1), (9, 1, 2), (10, 1, 3),
(11, 1, 2), (12, 1, 4), (13, 1, 1), (14, 1, 3), (15, 1, 2),
(16, 1, 3), (17, 1, 1), (18, 1, 2), (19, 1, 2), (20, 1, 3),
(1, 2, 2), (2, 2, 3), (3, 2, 4), (4, 2, 1), (5, 2, 2),
(6, 2, 5), (7, 2, 2), (8, 2, 3), (9, 2, 1), (10, 2, 2),
(11, 2, 3), (12, 2, 2), (13, 2, 4), (14, 2, 1), (15, 2, 3),
(16, 2, 2), (17, 2, 3), (18, 2, 1), (19, 2, 3), (20, 2, 2);

-- Aluguel e Aluguel_Produto
INSERT INTO aluguel (cliente_id, funcionario_id, data_retirada, data_devolucao_prevista, data_devolucao_real, em_atraso, multa, multa_paga) VALUES
(1, 3, '2024-06-01', '2024-06-05', '2024-06-05', FALSE, 0.00, TRUE),
(2, 4, '2024-06-02', '2024-06-06', '2024-06-08', TRUE, 10.00, FALSE),
(5, 6, '2024-06-03', '2024-06-07', '2024-06-07', FALSE, 0.00, TRUE),
(7, 12, '2025-06-09', '2025-06-15', NULL, FALSE, 0.00, FALSE),
(8, 14, '2025-05-30', '2025-06-04', '2025-06-05', TRUE, 10.00, TRUE);


INSERT INTO aluguel_produto (aluguel_id, produto_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5);
