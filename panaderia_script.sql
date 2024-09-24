CREATE DATABASE IF NOT EXISTS panaderia;
USE panaderia;

CREATE TABLE Ingredientes(
    Id INT AUTO_INCREMENT NOT NULL ,
    NombreIngrediente VARCHAR(255) NOT NULL,
    FechaVencimiento ,
    Formato ,
    Cantidad ,

);

CREATE TABLE Turno();

CREATE TABLE Trabajadores(
    Id INT AUTO_INCREMENT NOT NULL
    NombreTrabajador VARCHAR(50),
    CargoTrabajador ENUM('Administrador', 'Jefe de área', 'Vendedor', 'Panadero'),


);

CREATE TABLE Stock();

CREATE TABLE IngredientesMinimos(

);


();