-- Afficher tous les arrêts dans l'ordre alphabétique
SELECT nom FROM arrets ORDER BY nom ;
-- Afficher la liste de toutes les immatriculations des bus.
SELECT immatriculation FROM bus ;
-- Ajoutez une ligne Noir qui passe par les arrêts Korrigan, L'Ankou et Viviane.
INSERT INTO lignes (nom) VALUES ('Noir');
INSERT INTO arrets_lignes (ligne, arret) VALUES 
((select id from lignes where nom='Noir'), (select id from arrets where nom='Korrigan')),
((select id from lignes where nom='Noir'), (select id from arrets where nom='L''Ankou')),
((select id from lignes where nom='Noir'), (select id from arrets where nom='Viviane'));
-- Il y a une erreur sur l'arrêt L'Ankou, l'adresse exacte est 3 place du L'Ankou.
update arrets SET adresse='3 place du L\'Ankou'WHERE nom='L\'Ankou';
-- Sélectionner tous les bus de la ligne Rouge.
select * from bus where ligne=(select id from lignes where nom='Rouge');
select * from bus as b JOIN lignes as l on b.ligne = l.id where l.nom='Rouge';
-- Ajoutez 2 bus sur la ligne Noir :BB05, PU 123 LL BB06, FE 123 TE
INSERT INTO bus (numero, immatriculation, nombre_place, ligne) VALUES 
('BB05','PU123LL', '20', (select id from lignes where nom='Noir')),
('BB06','FE123TE','30', (select id from lignes where nom='Noir')) ;
-- Trouver tous les arrêts du bus BB01
select a.nom from arrets_lignes as al  
INNER JOIN bus as b ON  al.ligne = b.ligne 
INNER JOIN arrets as a ON a.id = al.arret where b.numero='BB01';
-- Compter le nombre de bus
select count(*) as nb_bus from bus
-- Compter le nombre d'arrêts de la ligne bleu
select count(*) as nb_arret from arrets_lignes  as a INNER JOIN lignes as l on l.id=a.ligne where l.nom='bleu'
-- Trouver toutes les lignes qui passent par Morgana.
select count(*) from arrets_lignes as al INNER JOIN arrets as a on al.arret=a.id where a.nom='Morgana' ;
