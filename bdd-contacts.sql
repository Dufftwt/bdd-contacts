DROP DATABASE IF EXISTS exo_contacts;
CREATE DATABASE IF NOT EXISTS exo_contacts;
USE exo_contacts;

CREATE TABLE IF NOT EXISTS pays (
    iso_3 VARCHAR(3) PRIMARY KEY,
    nom VARCHAR(70) NOT NULL,
    iso_2 VARCHAR(2) NOT NULL,
    nationalite VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70) NOT NULL,
    date_de_naissance DATE NOT NULL,
    sexe VARCHAR(10) NOT NULL,
    adresse TEXT NOT NULL,
    cp VARCHAR(10) NOT NULL,
    ville VARCHAR(70) NOT NULL,
    pays_iso_3 VARCHAR(3),
    FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS telephone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_contact INT NOT NULL,
    numero VARCHAR(50) NOT NULL,
    type TINYINT NOT NULL,
    FOREIGN KEY (id_contact) REFERENCES contacts(id) ON DELETE CASCADE
);

INSERT INTO `pays` (`iso_3`, `nom`, `iso_2`, `nationalite`) VALUES
('FRA', 'France', 'FR', 'Française'),
('ESP', 'Espagne', 'ES', 'Espagnole'),
('ITA', 'Italie', 'IT', 'Italienne'),
('DEU', 'Allemagne', 'DE', 'Allemande'),
('GBR', 'Royaume-Uni', 'GB', 'Britannique'),
('USA', 'États-Unis', 'US', 'Américaine'),
('CAN', 'Canada', 'CA', 'Canadienne'),
('BRA', 'Brésil', 'BR', 'Brésilienne'),
('ARG', 'Argentine', 'AR', 'Argentine'),
('CHN', 'Chine', 'CN', 'Chinoise');

INSERT INTO `contacts` (`nom`, `prenom`, `date_de_naissance`, `sexe`, `adresse`, `cp`, `ville`, `pays_iso_3`) VALUES
('Martin', 'Paul', '1985-04-12', 'M', '123 Boulevard de France', '75000', 'Paris', 'FRA'),
('Bernard', 'Marie', '1990-07-23', 'F', '456 Avenue de la République', '31000', 'Toulouse', 'FRA'),
('Dubois', 'Jean', '1975-02-15', 'M', '789 Rue du Général', '13000', 'Marseille', 'FRA'),
('Thomas', 'Julie', '1988-01-06', 'F', '321 Rue de la Liberté', '69000', 'Lyon', 'FRA'),
('Robert', 'Émilie', '1992-12-11', 'F', '654 Allée des Champs', '44000', 'Nantes', 'FRA'),
('Richard', 'Luc', '1968-05-30', 'M', '987 Voie du Roi', '67000', 'Strasbourg', 'FRA'),
('Petit', 'Sophie', '1979-03-22', 'F', '159 Avenue des Fleurs', '33000', 'Bordeaux', 'FRA'),
('Durand', 'Nicolas', '1982-08-14', 'M', '862 Boulevard Égalité', '59000', 'Lille', 'FRA'),
('Leroy', 'David', '1986-09-19', 'M', '753 Rue de la Paix', '34000', 'Montpellier', 'FRA'),
('Moreau', 'Isabelle', '1994-06-07', 'F', '468 Place de la Victoire', '06000', 'Nice', 'FRA');
