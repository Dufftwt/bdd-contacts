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